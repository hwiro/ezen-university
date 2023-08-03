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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import edu.univ.ezen.dto.ClassDTO;
import edu.univ.ezen.dto.FileDepositoryDTO;
import edu.univ.ezen.dto.MajorBoardDTO;
import edu.univ.ezen.dto.MajorBoardReplyDTO;
import edu.univ.ezen.service.AccAdminMapper;
import edu.univ.ezen.service.ClassMapper;
import edu.univ.ezen.service.FileDepositoryMapper;
import edu.univ.ezen.service.MajorBoardMapper;

@Controller
public class AdminMajorBoardController {

	@Autowired
	private MajorBoardMapper majorBoardMapper;
	
	@Autowired
	private FileDepositoryMapper fileDepositoryMapper;
	
	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private AccAdminMapper accAdminMapper;

	protected boolean isLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping("admin_selectLecture.do")
	public String admin_selLecture(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			return "admin/admin_login";
		}
		HttpSession session = req.getSession();
		String authority = (String) session.getAttribute("authority_level");
		if (authority.equals("게시판관리자") || authority.equals("마스터관리자")) {
			List<ClassDTO> list = classMapper.listClassAll();
			req.setAttribute("list", list);
		}
		return "admin/admin_majorBoard/admin_lecture";
	}

	@RequestMapping("admin_majorBoard.do")
	public ModelAndView admin_majorBoard(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return new ModelAndView("message");
		}
		HttpSession session = req.getSession();
		req.setAttribute("path", "resources/major_board_img");
		String class_code = (String)session.getAttribute("class_code");
		if(class_code == null) {
			session.setAttribute("class_code", req.getParameter("class_code"));
			class_code = req.getParameter("class_code");
		}
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = majorBoardMapper.getCount(class_code);
		if (endRow > count)
			endRow = count;
		List<MajorBoardDTO> list = null;
		if (count == 0) {
			Map<String, Object> params = new HashMap<>();
			params.put("class_code", class_code);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			list = majorBoardMapper.listBoard(params);
			return new ModelAndView("admin/admin_majorBoard/admin_majorBoard", "listMajorBoard", list);
		}
		if (count > 0) {
			Map<String, Object> params = new HashMap<>();
			params.put("class_code", class_code);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			list = majorBoardMapper.listBoard(params);
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount)
				endPage = pageCount;
			req.setAttribute("startPage", startPage);
			req.setAttribute("endPage", endPage);
			req.setAttribute("pageBlock", pageBlock);
			req.setAttribute("pageCount", pageCount);
		}
		int rowNum = count - (currentPage - 1) * pageSize;
		req.setAttribute("rowNum", rowNum);
		req.setAttribute("count", count);
		for (MajorBoardDTO bdto : list) {
			int reply = majorBoardMapper.countReply(bdto.getMajor_board_code());
			bdto.setContent("" + reply);
		}
		return new ModelAndView("admin/admin_majorBoard/admin_majorBoard", "listMajorBoard", list);
	}

	// 학과게시판 글 작성 폼으로 이동
	@RequestMapping(value = "admin_write_major_board.do", method = RequestMethod.GET)
	public String admin_majorBoard_insert(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		
		return "admin/admin_majorBoard/admin_writeBoard";
	}

	// 학과게시판 글 작성 처리
	@RequestMapping(value = "admin_write_major_board.do", method = RequestMethod.POST)
	public String admin_majorBoard_insert_pro(HttpServletRequest req,
			@RequestParam("original_name") List<MultipartFile> multiFileList, @ModelAttribute MajorBoardDTO dto,
			BindingResult result) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		HttpSession session = req.getSession();
		if (result.hasErrors()) {
			dto.setImage("");
		}
		FileDepositoryDTO dto2 = new FileDepositoryDTO();
		String class_code = (String) session.getAttribute("class_code");
		String path = req.getSession().getServletContext().getRealPath("resources/major_board_img");
		req.setAttribute("path", "resources/notice_board_img");
		dto.setClass_code(class_code);
		dto.setIp(req.getRemoteAddr());
		dto.setWriter_id((String) session.getAttribute("id"));
		dto.setWriter(accAdminMapper.getAdmin((String) session.getAttribute("id")).getName());
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("image");
		if (mf.getOriginalFilename() == null || mf.getOriginalFilename().equals("")) {
			dto.setImage("none");
		} else {
			String filename = mf.getOriginalFilename();
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			dto.setImage(newFilename);
			File file = new File(path, newFilename);
			try {
				mf.transferTo(file);
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		int res = majorBoardMapper.insertBoard(dto);
		if (res > 0) {
			MultipartFile file2 = mr.getFile("original_name");
			if (file2.getOriginalFilename() == null || file2.getOriginalFilename() != "") {
				File fileCheck = new File(path);
				if (!fileCheck.exists())
					fileCheck.mkdirs();
				List<Map<String, String>> fileList = new ArrayList<>();
				for (int i = 0; i < multiFileList.size(); i++) {
					String originFile = multiFileList.get(i).getOriginalFilename();
					int filesize = (int) multiFileList.get(i).getSize();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					dto2.setBoard("majorBoard");
					dto2.setOriginal_name(originFile);
					dto2.setSave_name(changeFile);
					dto2.setFilesize(filesize);
					int code = majorBoardMapper.getNum();
					dto2.setCode(code);
					fileDepositoryMapper.fileInsert(dto2);
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);

					fileList.add(map);
				}

				try {
					for (int i = 0; i < multiFileList.size(); ++i) {
						File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패");
					for (int i = 0; i < multiFileList.size(); ++i) {
						new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
				req.setAttribute("msg", "게시글 등록 성공(사진, 이미지도 등록 성공!!) 글목록 페이지로 이동합니다.");
				req.setAttribute("url", "admin_majorBoard.do");
			} else {

			}
			req.setAttribute("msg", "게시글 등록 성공!! 글목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_majorBoard.do");
		} else {
			req.setAttribute("msg", "게시글 등록 실패!! 글 등록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_write_major_board.do");
		}
		return "message";
	}

	// 학과게시판 글 내용 보기 페이지 이동
	@RequestMapping("admin_content_major_board.do")
	public String admin_majorBoard_content(HttpServletRequest req, @RequestParam int major_board_code) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		MajorBoardDTO dto = majorBoardMapper.getByNum(major_board_code, "content");
		Map<String, Object> params = new HashMap<>();
		int code = major_board_code;
		String board = "majorBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		req.setAttribute("listFile", list);
		req.setAttribute("getBoard", dto);
		List<MajorBoardReplyDTO> replyList = majorBoardMapper.readReply(major_board_code);
		req.setAttribute("path", "resources/major_board_img");
		req.setAttribute("replyList", replyList);
		return "admin/admin_majorBoard/admin_contentBoard";
	}

	// 학과게시판 파일 다운로드
	@RequestMapping("admin_majorBoard_download.do")
	public String admin_majorBoard_download(HttpServletRequest req, HttpServletResponse resp, @RequestParam int major_board_code) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		Map<String, Object> params = new HashMap<>();
		int code = major_board_code;
		String board = "majorBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		String name = req.getParameter("name");
		try {
			String original_name = null;
			String save_name = null;
			for (FileDepositoryDTO fdto : list) {
				if (fdto.getSave_name().equals(name)) {
					original_name = fdto.getOriginal_name();
					save_name = fdto.getSave_name();
				}
			}
			original_name = new String(original_name.getBytes("UTF-8"), "iso-8859-1");
			File file = new File(
					req.getSession().getServletContext().getRealPath("/resources/major_board_img/" + save_name));
			FileInputStream fis = new FileInputStream(file);
			ServletOutputStream sos = resp.getOutputStream();
			resp.setContentType("application/octet-stream");
			resp.setContentLength((int) file.length());
			resp.setHeader("Content-Disposition", "attachment;filename=\"" + original_name + "\"");
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
		return "admin/admin_majorBoard/admin_contentBoard";
	}

	// 학과게시판 댓글 작성처리
	@RequestMapping("admin_major_board_reWrite.do")
	public String admin_majorBoard_reInsert(HttpServletRequest req, @ModelAttribute MajorBoardReplyDTO dto) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		HttpSession session = req.getSession();
		int major_board_code = Integer.parseInt(req.getParameter("major_board_code"));
		dto.setWriter(accAdminMapper.getAdmin((String) session.getAttribute("id")).getName());
		dto.setWriter_id((String) session.getAttribute("id"));
		dto.setIp(req.getRemoteAddr());
		int res = majorBoardMapper.writeReply(dto);
		if (res > 0) {
			req.setAttribute("major_board_code", dto.getMajor_board_code());
			req.setAttribute("msg", "댓글 등록 성공");
			req.setAttribute("url", "admin_content_major_board.do?major_board_code=" + major_board_code);
		}
		return "message";
	}

	// 학과게시판 댓글 수정 폼 이동
	@RequestMapping("admin_update_reply_mb.do")
	public String admin_majorBoard_reEdit(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		int rno = Integer.parseInt(req.getParameter("rno"));
		int major_board_code = Integer.parseInt(req.getParameter("major_board_code"));
		MajorBoardDTO dto = majorBoardMapper.getByNum(major_board_code, "update");
		req.setAttribute("path", "resources/major_board_img");
		req.setAttribute("getBoard", dto);
		req.setAttribute("rno", rno);
		MajorBoardReplyDTO dto2 = majorBoardMapper.selectReply(rno);

		req.setAttribute("getReply", dto2);
		return "admin/admin_majorBoard/admin_replyUpdateBoard";
	}

	// 학과 게시판 댓글 수정 처리
	@RequestMapping("admin_major_board_reUpdate.do")
	public String admin_majorBoard_reEdit_pro(HttpServletRequest req, @ModelAttribute MajorBoardReplyDTO dto) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		int rno = Integer.parseInt(req.getParameter("rno"));
		int major_board_code = Integer.parseInt(req.getParameter("major_board_code"));
		dto = majorBoardMapper.selectReply(rno);
		String content = req.getParameter("content");
		dto.setContent(content);
		int res = majorBoardMapper.updateReply(dto);
		if (res > 0) {
			req.setAttribute("msg", "댓글 수정 성공");
			req.setAttribute("url", "admin_content_major_board.do?major_board_code=" + major_board_code);
		} else {
			req.setAttribute("msg", "댓글 수정 실패");
			req.setAttribute("url", "admin_update_reply_mb.do");
		}
		return "message";
	}

	// 학과 게시판 댓글 삭제 처리
	@RequestMapping("admin_delete_reply_mb.do")
	public String admin_majorBoard_reDelete(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		int rno = Integer.parseInt(req.getParameter("rno"));
		int major_board_code = Integer.parseInt(req.getParameter("major_board_code"));
		int res = majorBoardMapper.deleteReply(rno);
		if (res > 0) {
			req.setAttribute("msg", "댓글 삭제 성공");
			req.setAttribute("url", "admin_content_major_board.do?major_board_code=" + major_board_code);
		} else {
			req.setAttribute("msg", "댓글 삭제 실패");
			req.setAttribute("url", "admin_content_major_board.do?major_board_code=" + major_board_code);
		}
		return "message";
	}

	// 학과게시판 글 삭제 처리
	@RequestMapping("admin_delete_major_board.do")
	public String admin_majorBoard_delete(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		int major_board_code = Integer.parseInt(req.getParameter("major_board_code"));
		String image = req.getParameter("image");
		Map<String, Object> params = new HashMap<>();
		int code = major_board_code;
		String board = "majorBoard";
		params.put("board", board);
		params.put("code", code);
		int res = majorBoardMapper.deleteBoard(major_board_code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		if (res > 0) {
			String path = req.getSession().getServletContext().getRealPath("resources/major_board_img");
			req.setAttribute("path", "resources/major_board_img");
			File file = new File(path, image);
			if (file.exists()) {
				file.delete();
				for (FileDepositoryDTO dto : list) {
					fileDepositoryMapper.fileDelete(dto.getNum());
					File file2 = new File(path + "\\" + dto.getSave_name());
					if (file2.exists()) {
						file2.delete();
					} else {
						req.setAttribute("msg", "글 삭제 성공!(파일은 삭제 실패) 학과게시판 목록 페이지로 이동");
						req.setAttribute("url", "admin_majorBoard.do");
						return "message";
					}
				}
				req.setAttribute("msg", "글 삭제 성공!(이미지, 파일도 삭제 성공) 학과게시판 목록 페이지로 이동");
				req.setAttribute("url", "admin_majorBoard.do");
				return "message";
			} else {
				req.setAttribute("msg", "글 삭제 성공!(이미지는 삭제 실패) 학과게시판 목록 페이지로 이동");
				req.setAttribute("url", "admin_majorBoard.do");
				return "message";
			}
		} else {
			req.setAttribute("msg", "이미지 삭제 실패!! 학과게시판 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_majorBoard.do");
			return "message";
		}
	}

	// 학과게시판 글 수정 폼 이동
	@RequestMapping(value = "admin_update_major_board.do", method = RequestMethod.GET)
	public String admin_majorBoard_edit(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		int major_board_code = Integer.parseInt(req.getParameter("major_board_code"));
		MajorBoardDTO dto = majorBoardMapper.getByNum(major_board_code, "update");
		req.setAttribute("path", "resources/major_board_img");
		req.setAttribute("getBoard", dto);
		return "admin/admin_majorBoard/admin_updateBoard";
	}

	// 학과게시판 글 수정 처리
	@RequestMapping(value = "admin_update_major_board.do", method = RequestMethod.POST)
	public String admin_majorBoard_edit_pro(HttpServletRequest req,
			@RequestParam("original_name") List<MultipartFile> multiFileList, @ModelAttribute MajorBoardDTO dto,
			BindingResult result) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return "message";
		}
		if (result.hasErrors()) {
			dto.setImage("");
		}
		FileDepositoryDTO dto2 = new FileDepositoryDTO();
		String path = req.getSession().getServletContext().getRealPath("resources/major_board_img");
		req.setAttribute("path", "resources/major_board_img");
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;
		MultipartFile mf = mr.getFile("image");
		String filename = mf.getOriginalFilename();
		if (filename == null || filename.equals("")) {
			if (req.getParameter("image2").equals("none")) {
				dto.setImage("none");
			} else {
				dto.setImage(req.getParameter("image2"));
				String fileExtension = dto.getImage().substring(dto.getImage().lastIndexOf("."));
				String newFilename = UUID.randomUUID().toString() + fileExtension;
				File target = new File(path, newFilename);
				if (mf.getSize() > 0) {
					try {
						mf.transferTo(target);
					} catch (Exception e) {
						e.printStackTrace();
					}
					dto.setImage(newFilename);
				} else {
					dto.setImage(req.getParameter("image2"));
				}
			}
		} else {
			String fileExtension = filename.substring(filename.lastIndexOf("."));
			String newFilename = UUID.randomUUID().toString() + fileExtension;
			File target = new File(path, newFilename);
			if (mf.getSize() > 0) {
				try {
					mf.transferTo(target);
				} catch (Exception e) {
					e.printStackTrace();
				}
				dto.setImage(newFilename);
			} else {
				dto.setImage(req.getParameter("image2"));
			}
		}
		dto.setIp(req.getRemoteAddr());
		int res = majorBoardMapper.updateBoard(dto);
		if (res > 0) {
			File fileCheck = new File(path);
			if (!fileCheck.exists())
				fileCheck.mkdirs();
			List<Map<String, String>> fileList = new ArrayList<>();
			if (multiFileList == null || multiFileList.get(0).getOriginalFilename().equals("")) {
				req.setAttribute("msg", "글 수정 성공(혹시 파일 수정은 안했지?)! 글 목록 페이지로 이동합니다.");
				req.setAttribute("url", "admin_majorBoard.do");
				return "message";
			} else if (multiFileList.get(0).getOriginalFilename() != "") {
				Map<String, Object> params = new HashMap<>();
				int code = Integer.parseInt(req.getParameter("major_board_code"));
				String board = "majorBoard";
				params.put("board", board);
				params.put("code", code);
				List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
				for (FileDepositoryDTO fdto : list) {
					fileDepositoryMapper.fileDelete(fdto.getNum());
					File file2 = new File(path + "\\" + fdto.getSave_name());
					if (file2.exists()) {
						file2.delete();
					} else {
						req.setAttribute("msg", "파일 삭제 실패!");
						req.setAttribute("url", "admin_majorBoard.do");
						return "message";
					}
				}
			}
			MultipartFile file3 = mr.getFile("original_name");
			if (file3.getOriginalFilename() == null || file3.getOriginalFilename() != "") {
				for (int i = 0; i < multiFileList.size(); ++i) {
					String originFile = multiFileList.get(i).getOriginalFilename();
					int filesize = (int) multiFileList.get(i).getSize();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					dto2.setBoard("majorBoard");
					dto2.setOriginal_name(originFile);
					dto2.setSave_name(changeFile);
					dto2.setFilesize(filesize);
					dto2.setCode(dto.getMajor_board_code());
					fileDepositoryMapper.fileInsert(dto2);
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);

					fileList.add(map);
				}
				try {
					for (int i = 0; i < multiFileList.size(); ++i) {
						File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패");
					for (int i = 0; i < multiFileList.size(); ++i) {
						new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
				req.setAttribute("msg", "글 수정 성공! 글 목록 페이지로 이동합니다.");
				req.setAttribute("url", "admin_majorBoard.do");
			}
			req.setAttribute("msg", "글 수정 성공! 글 목록 페이지로 이동합니다.");
			req.setAttribute("url", "admin_majorBoard.do");
		} else {
			req.setAttribute("msg", "글 수정 실패 ! 글 수정 페이지로 이동");
			req.setAttribute("url", "admin_update_major_board.do?major_board_code=" + dto.getMajor_board_code());
		}
		return "message";
	}
	
	// 학과게시판 글 찾기 처리
	@RequestMapping("admin_find_major_board.do")
	public ModelAndView admin_majorBoard_search(HttpServletRequest req, Map<String, String> params) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "admin_login.do");
			return new ModelAndView("message");
		}
		HttpSession session = req.getSession();
		List<MajorBoardDTO> list = null;
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		String class_code = (String)session.getAttribute("class_code");
		ModelAndView mav = new ModelAndView();
		mav.addObject("path", "resources/major_board_img");
		list = majorBoardMapper.findList(search, searchString, class_code);
		if (params.get("search") != null) {
			for (MajorBoardDTO dto : list) {
				int reply = majorBoardMapper.countReply(dto.getMajor_board_code());
				dto.setContent("" + reply);
			}
			mav.addObject("find", list);
			mav.addObject("mode", "find");
			mav.setViewName("admin/admin_majorBoard/admin_majorBoard");
		}else {
			for (MajorBoardDTO dto : list) {
				int reply = majorBoardMapper.countReply(dto.getMajor_board_code());
				dto.setContent("" + reply);
			}
			mav.addObject("find", list);
			mav.addObject("mode", "find");
			mav.setViewName("admin/admin_majorBoard/admin_majorBoard");
		}
		return mav;
	}
}
