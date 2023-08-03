package edu.univ.ezen.controller.admin;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.AccountAdminDTO;
import edu.univ.ezen.dto.EditLogDTO;
import edu.univ.ezen.dto.FileDepositoryDTO;
import edu.univ.ezen.dto.InfoBoardDTO;
import edu.univ.ezen.service.AccAdminMapper;
import edu.univ.ezen.service.FileDepositoryMapper;
import edu.univ.ezen.service.InfoBoardMapper;
import edu.univ.ezen.service.LogMapper;

@Controller
public class AdminInfoBoardController {
	
	@Autowired
	InfoBoardMapper infoBoardMapper;
	
	@Autowired
	AccAdminMapper accAdminMapper;
	
	@Autowired
	LogMapper logMapper;
	
	@Autowired
	FileDepositoryMapper fileDepositoryMapper;
	
	//세션에 id라는 값이 있는지 체크하는 메소드. 있으면 true, 없으면 false를 리턴한다.
	protected boolean id_check(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if(session.getAttribute("id") == null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	//공지 게시판 관리
	@RequestMapping("/admin_infoBoard_list.do")
	public String admin_infoBoard_list(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String page = req.getParameter("page");
		String type = req.getParameter("type");
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		List<InfoBoardDTO> list = new ArrayList<InfoBoardDTO>();
		int pageCount = 1;
		
		if(page == null) page = "1";
		if(type == null) type = "infoEvent";
		
		if(search == null || searchString == null || search.equals("all")) {
			list = infoBoardMapper.infoBoard_list(type, Integer.parseInt(page));
			pageCount = infoBoardMapper.countBoardAll();
		}
		else {
			list = infoBoardMapper.infoBoard_findList(search, searchString, type);
			pageCount = infoBoardMapper.countBoardSearch(search, searchString, type);
			req.setAttribute("search", search);
			req.setAttribute("searchString", searchString);
		}

		if(pageCount < 11) pageCount = 1;
		else {
			if(pageCount%10 == 0) pageCount = (pageCount/10);
			else pageCount = (pageCount/10)+1;
		}
		
		for(InfoBoardDTO ldto : list) {
			Map<String, Object> params = new HashMap<>();
			params.put("code", ldto.getInfo_code());
			params.put("board", type);
			List<FileDepositoryDTO> fdto = fileDepositoryMapper.getFile(params);
			if(fdto != null && fdto.size() != 0 && fdto.get(0).getCode() == ldto.getInfo_code()) ldto.setContent("yes");
			else ldto.setContent("none");
		}
		
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("list", list);
		req.setAttribute("type", type);

		return "admin/admin_infoBoard/admin_infoBoard_list";
	}
	
	//새 공지 등록 페이지
	@RequestMapping("/admin_infoBoard_insert.do")
	public String admin_infoBoard_insert(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		HttpSession session = req.getSession();
		AccountAdminDTO dto = accAdminMapper.getAdmin((String)session.getAttribute("id"));
		req.setAttribute("writer", dto.getName());
		req.setAttribute("mode", "insert");
		req.setAttribute("type", req.getParameter("type"));
	
		return "admin/admin_infoBoard/admin_infoBoard_insert";
	}

	//새 공지 등록 처리
	@RequestMapping("/admin_infoBoard_insert_pro.do")
	public ModelAndView admin_infoBoard_insert_pro(HttpServletRequest req, 
			@RequestParam("original_name") List<MultipartFile> multiFileList, 
			@ModelAttribute InfoBoardDTO dto, BindingResult result) {
		
		ModelAndView mav = new ModelAndView("message");

		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
	
		HttpSession session = req.getSession();
		InfoBoardDTO infoDTO = dto;
		FileDepositoryDTO fileDTO = new FileDepositoryDTO();
		String upPathImage = session.getServletContext().getRealPath("/resources/infoBoard_img");
		String upPathFile = session.getServletContext().getRealPath("/resources/infoBoard_file");
		String type = req.getParameter("type");	
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		
		MultipartFile mf = mr.getFile("image");
		String image = "none";
		if(mf != null && !mf.isEmpty()) {
			image = mf.getOriginalFilename();
			String imageExtension = image.substring(image.lastIndexOf("."));
			String newImage = UUID.randomUUID().toString() + imageExtension;
			File fileI = new File(upPathImage, newImage);
							
			try {
				mf.transferTo(fileI);
				
			} catch(IllegalStateException e) {
				e.printStackTrace();
				mav.addObject("msg", "IllegalStateException! : "+ e.getMessage());
				mav.addObject("url", "index_admin.do");
				return mav;
			} catch(IOException e) {
				e.printStackTrace();
				mav.addObject("msg", "IOException! : "+ e.getMessage());
				mav.addObject("url", "index_admin.do");
				return mav;
			}
			infoDTO.setImage(newImage);
			infoDTO.setReadcount(0);
			infoDTO.setInfo_code(0);
			infoDTO.setType(type);
		}
		else {
			infoDTO.setImage("none");
		}
		
		int res = infoBoardMapper.infoBoard_insert(infoDTO);
		
		if(res != 0) {
			mav.addObject("msg", "공지 등록이 완료되었습니다");
			mav.addObject("url", "admin_infoBoard_list.do?page=1");
			
			List<Map<String, String>> fileList = new ArrayList<>();
			
			if(!multiFileList.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile mpf : multiFileList) {
					String originFile = mpf.getOriginalFilename();
					int filesize = (int)mpf.getSize();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					int code = infoBoardMapper.infoGetRecentNum();
					fileDTO.setBoard(req.getParameter("type"));
					fileDTO.setOriginal_name(originFile);
					fileDTO.setSave_name(changeFile);
					fileDTO.setFilesize(filesize);
					fileDTO.setCode(code);
					int res2 = fileDepositoryMapper.fileInsert(fileDTO);
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);
					fileList.add(map);
				}
				
				try {
					for (int i = 0; i < multiFileList.size(); i++) {
						File uploadFile = new File(upPathFile + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
					System.out.println("다중 파일 업로드 성공");
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중파일 업로드 실패 ㅠㅠ");
					for (int i = 0; i < multiFileList.size(); i++) {
						new File(upPathFile + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
			}
			
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("공지등록:"+infoDTO.getInfo_title());
			eldto.setMemo(req.getParameter("memo"));
			int elog = logMapper.insertEdit(eldto);
			
			mav.addObject("type", type);
			
			return mav;
			
		}
		else {
			mav.addObject("msg", "공지등록에 실패했습니다");
			mav.addObject("url", "admin_infoBoard_list.do");
			return mav;
		}
	}


	//공지 삭제
	@RequestMapping("/admin_infoBoard_del.do")
	public ModelAndView admin_infoBoard_del(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("message");
		
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
		
		String info_code = req.getParameter("info_code");
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(info_code));
		String board = req.getParameter("type");
		Map<String, Object> params = new HashMap<>();
		params.put("board", board);
		params.put("code", info_code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		
		String upPath = req.getSession().getServletContext().getRealPath("/resources/infoBoard_img");
		String upPathF = req.getSession().getServletContext().getRealPath("/resources/infoBoard_file");
		HttpSession session = req.getSession();
		int res = infoBoardMapper.infoBoard_del(Integer.parseInt(info_code));
		
		if(res != 0) {
			File file = new File(upPath, ldto.getImage());
			if(file.exists()) {
				file.delete();
				
				for(FileDepositoryDTO fdto : list) {
					File file2 = new File(upPathF, fdto.getSave_name());
					if (file2.exists()) {
						int res2 = fileDepositoryMapper.fileDelete(fdto.getNum());
						file2.delete();
					}
				}
				
				mav.addObject("msg", "공지도 파일도 삭제되었습니다");
				mav.addObject("url", "admin_infoBoard_list.do?page=1");
				mav.addObject("type", board);
				
			}
			else {
				for(FileDepositoryDTO fdto : list) {
					File file2 = new File(upPathF, fdto.getSave_name());
					if (file2.exists()) {
						int res2 = fileDepositoryMapper.fileDelete(fdto.getNum());
						file2.delete();
					}
				}
				mav.addObject("msg", "공지글은 삭제되었고, 이미지는 없어서 삭제 안함");
				mav.addObject("url", "admin_infoBoard_list.do?page=1");
			}
			//수정내역 로그 남기기
			EditLogDTO eldto = new EditLogDTO();
			eldto.setId((String)session.getAttribute("id"));
			eldto.setContent("공지삭제:"+ldto.getInfo_title());
			eldto.setMemo("공지삭제");
			int elog = logMapper.insertEdit(eldto);
		}
		else {
			mav.addObject("msg", "공지도 파일도 삭제에 실패했습니다");
			mav.addObject("url", "admin_infoBoard_list.do?page=1");
		}		
		return mav;
	}
	
	//공지 수정
	@RequestMapping("/admin_infoBoard_edit.do")
	public String admin_infoBoard_edit(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String info_code =req.getParameter("info_code");
		InfoBoardDTO ldto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(info_code));
		HttpSession session = req.getSession();
		AccountAdminDTO dto = accAdminMapper.getAdmin((String)session.getAttribute("id"));
		
		req.setAttribute("writer", dto.getName());
		req.setAttribute("ldto", ldto);
		req.setAttribute("type", req.getParameter("type"));
		req.setAttribute("mode", "edit");
		
		return "admin/admin_infoBoard/admin_infoBoard_insert";
	}
	
	//행사일정 공지 수정 처리
	@RequestMapping("/admin_infoBoard_edit_pro.do")
	public ModelAndView admin_infoBoard_edit_pro(MultipartHttpServletRequest req, 
			@RequestParam("original_name") List<MultipartFile> multiFileList, 
			@ModelAttribute InfoBoardDTO dto, BindingResult result) {
		
		//아이디체크
		ModelAndView mav = new ModelAndView("message");
		boolean ch = id_check(req);
		if(!ch) {
			mav.setViewName("admin/admin_login");
			return mav;
		}
		
		String info_code = req.getParameter("info_code");
		
		InfoBoardDTO idto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(info_code));
		FileDepositoryDTO fileDTO = new FileDepositoryDTO();
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		HttpSession session = req.getSession();
		
		String pathImage = session.getServletContext().getRealPath("resources/infoBoard_img/");
		String pathFile = session.getServletContext().getRealPath("resources/infoBoard_file/");
		File ifile = new File(pathImage, idto.getImage());
		MultipartFile mf = mr.getFile("image");
		String filename = mf.getOriginalFilename();
	      
		//수정한 파일 체크
		if(filename == null || filename.equals("")) {
			dto.setImage(req.getParameter("image2"));
		}
		else {
			if(ifile.exists()) ifile.delete();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			File target = new File(pathImage, newFilename); 
			try {
				mf.transferTo(target);
			} catch (Exception e) {
				e.printStackTrace();
			}
			dto.setImage(newFilename);
		}

		InfoBoardDTO ldto = dto;
		
		int res = infoBoardMapper.infoBoard_update(ldto);
		
		List<Map<String, String>> fileList = new ArrayList<>();
		if(multiFileList == null || multiFileList.get(0).getOriginalFilename().equals("")) {
			mav.addObject("msg", "글 수정 성공(파일변동없음)");
			mav.addObject("url", "admin_infoBoard_list.do");
			return mav;
		}
		//첨부파일 변동 시 상황
		else if(multiFileList.get(0).getOriginalFilename() != "") {
			Map<String, Object> params = new HashMap<>();
			int code = dto.getInfo_code();
			String board = req.getParameter("type");
			params.put("code", code);
			params.put("board", board);
			List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
			for(FileDepositoryDTO fdto : list) {
				int res2 = fileDepositoryMapper.fileDelete(fdto.getNum());
				File file2 = new File(pathFile + "\\" + fdto.getSave_name());
				if(file2.exists()) file2.delete();
				else {
					req.setAttribute("msg", "파일 삭제 실패");
					req.setAttribute("url", "admin_infoBoard_list.do");
				}
			}
		}
		
		//파일 DB에 변동된 첨부파일 추가 및 UUID생성
		for (MultipartFile mpf : multiFileList) {
			String originFile = mpf.getOriginalFilename();
			int filesize = (int)mpf.getSize();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;
			fileDTO.setBoard(req.getParameter("type"));
			fileDTO.setOriginal_name(originFile);
			fileDTO.setSave_name(changeFile);
			fileDTO.setFilesize(filesize);
			int code = infoBoardMapper.infoGetRecentNum();
			fileDTO.setCode(code);
			int res2 = fileDepositoryMapper.fileInsert(fileDTO);
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);

			fileList.add(map);
		}
		
		//변동된 파일을 디스크에 저장
		try {
			int i = 0;
			for (MultipartFile mpf : multiFileList) {
				File uploadFile = new File(pathFile + "\\" + fileList.get(i).get("changeFile"));
				mpf.transferTo(uploadFile);
				++i;
			}
			System.out.println("다중 파일 업로드 성공");
		} catch (IllegalStateException | IOException e) {
			System.out.println("다중파일 업로드 실패");
			for (int i = 0; i < multiFileList.size(); i++) {
				new File(pathFile + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			e.printStackTrace();
		}
		
		mav.addObject("msg", "글 수정 성공(파일변동)");
		mav.addObject("url", "admin_infoBoard_list.do?page=1");
		mav.addObject("type", req.getParameter("type"));
		
		//수정내역 로그 남기기
		EditLogDTO eldto = new EditLogDTO();
		eldto.setId((String)session.getAttribute("id"));
		eldto.setContent("공지수정:"+ldto.getInfo_title());
		eldto.setMemo(req.getParameter("memo"));
		int elog = logMapper.insertEdit(eldto);
		
		return mav;				
	}
	
	//공지 상세보기
	@RequestMapping("/admin_infoBoard_view.do")
	public String admin_infoBoard_view(HttpServletRequest req) {
		boolean ch = id_check(req);
		if(!ch) return "admin/admin_login";
		
		String info_code = req.getParameter("info_code");
		InfoBoardDTO idto = infoBoardMapper.infoBoard_getByNum(Integer.parseInt(info_code));
		Map<String, Object> params = new HashMap<>();
		params.put("board", req.getParameter("type"));
		params.put("code", info_code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		
		req.setAttribute("dto", idto);
		req.setAttribute("filelist", list);
		req.setAttribute("type", req.getParameter("type"));
		
		return "admin/admin_infoBoard/admin_infoBoard_view";
	}
	
	//공지 첨부파일 다운로드 처리
	@RequestMapping("/admin_infoBoard_download.do")
	public String admin_infoBoard_download(HttpServletRequest req, 
			HttpServletResponse resp, @RequestParam int info_code) {
		int code = info_code;
		String board = req.getParameter("type");
		String path = req.getSession().getServletContext().getRealPath("resources/infoBoard_file");
		String name = req.getParameter("name");
		
		Map<String, Object> params = new HashMap<>();
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		HttpSession session = req.getSession();
		
		try {
			String original_name = null;
			String save_name = null;
	
			for(FileDepositoryDTO fdto : list) {
				if(fdto.getSave_name().equals(name)){
					original_name = fdto.getOriginal_name();
					save_name = fdto.getSave_name();
				}
			}
			original_name = new String(original_name.getBytes("UTF-8"), "iso-8859-1");
			File file = new File(path, save_name);
			
			FileInputStream fis = new FileInputStream(file);
            ServletOutputStream sos = resp.getOutputStream();
            
            resp.setContentType("application/octet-stream");
            resp.setContentLength((int) file.length());
            resp.setHeader("Content-Disposition", "attachment;filename=\""+ original_name +"\"");
		
            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = fis.read(buffer)) != -1) {
                sos.write(buffer, 0, bytesRead);
            }
            fis.close();
            sos.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("filelist", list);
		req.setAttribute("dto", infoBoardMapper.infoBoard_getByNum(code));
		req.setAttribute("type", board);
		
		return "admin/admin_infoBoard/admin_infoBoard_view";
	}
}							
			
					
				
				