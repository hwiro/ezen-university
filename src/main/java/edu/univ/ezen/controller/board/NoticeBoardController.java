package edu.univ.ezen.controller.board;

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

import edu.univ.ezen.dto.FileDepositoryDTO;
import edu.univ.ezen.dto.MajorNoticeBoardDTO;
import edu.univ.ezen.service.AccMapper;
import edu.univ.ezen.service.FileDepositoryMapper;
import edu.univ.ezen.service.MajorNoticeBoardMapper;

@Controller
public class NoticeBoardController {
	protected boolean isLogin(HttpServletRequest req) {
		HttpSession session = req.getSession();
		if (session.getAttribute("id") == null) {
			return false;
		} else {
			return true;
		}
	}

	protected Map<String, String> checkType(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String type = (String) session.getAttribute("type");
		String id = (String) session.getAttribute("id");
		Map<String, String> getType = new HashMap<>();
		if (type.equals("교수")) {
			getType.put("writer", accMapper.getTeacher(id).getName());
			getType.put("writer_id", accMapper.getTeacher(id).getTeacher_id());
		} else if (type.equals("학생")) {
			getType.put("writer", accMapper.getStudent(id).getName());
			getType.put("writer_id", accMapper.getStudent(id).getStudent_id());
		} else {
			getType.put("check", "check");
		}
		return getType;

	}

	@Autowired
	private AccMapper accMapper;
	@Autowired
	private MajorNoticeBoardMapper majorNoticeBoardMapper;
	@Autowired
	private FileDepositoryMapper fileDepositoryMapper;

	// 게시판 첫 메인 페이지 이동(공지사항이 default)
	@RequestMapping("noticeBoard.do")
	public ModelAndView noticeBoard(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return new ModelAndView("closeWindow_move");
		}
		HttpSession session = req.getSession();
		String class_code = (String) session.getAttribute("class_code");
		if (class_code == null) {
			session.setAttribute("class_code", class_code);
		}
		req.setAttribute("path", "resources/notice_board_img");
		int pageSize = 5;
		String pageNum = req.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = majorNoticeBoardMapper.getCount(class_code);
		if (endRow > count)
			endRow = count;
		List<MajorNoticeBoardDTO> list = null;
		if (count > 0) {
			Map<String, Object> params = new HashMap<>();
			params.put("class_code", class_code);
			params.put("startRow", startRow);
			params.put("endRow", endRow);
			list = majorNoticeBoardMapper.listBoard(params);
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
		return new ModelAndView("board/noticeBoard/noticeBoard", "listNoticeBoard", list);
	}

	// 공지사항 작성 폼 이동
	@RequestMapping(value = "write_notice_board.do", method = RequestMethod.GET)
	public String noticeBoard_insert(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		return "board/noticeBoard/writeBoard";
	}

	// 공지사항 작성 처리
	@RequestMapping(value = "write_notice_board.do", method = RequestMethod.POST)
	public String noticeBoard_insert_pro(HttpServletRequest req,
			@RequestParam("original_name") List<MultipartFile> multiFileList, @ModelAttribute MajorNoticeBoardDTO dto,
			BindingResult result) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		Map<String, String> map2 = checkType(req);
		if (result.hasErrors()) {
			dto.setImage("");
		}
		FileDepositoryDTO dto2 = new FileDepositoryDTO();
		String class_code = (String) session.getAttribute("class_code");
		String path = req.getSession().getServletContext().getRealPath("resources/notice_board_img");
		req.setAttribute("path", "resources/notice_board_img");
		dto.setClass_code(class_code);
		dto.setIp(req.getRemoteAddr());
		dto.setWriter_id(map2.get("writer_id"));
		dto.setWriter(map2.get("writer"));
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
		int res = majorNoticeBoardMapper.insertBoard(dto);
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
					dto2.setBoard("noticeBoard");
					dto2.setOriginal_name(originFile);
					dto2.setSave_name(changeFile);
					dto2.setFilesize(filesize);
					int code = majorNoticeBoardMapper.getNum();
					dto2.setCode(code);
					fileDepositoryMapper.fileInsert(dto2);
					Map<String, String> map = new HashMap<>();
					map.put("originFile", originFile);
					map.put("changeFile", changeFile);

					fileList.add(map);
				}

				// 파일 업로드
				try {
					for (int i = 0; i < multiFileList.size(); i++) {
						File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
						multiFileList.get(i).transferTo(uploadFile);
					}
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중파일 업로드 실패 ㅠㅠ");
					for (int i = 0; i < multiFileList.size(); i++) {
						new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
					}
					e.printStackTrace();
				}
				req.setAttribute("msg", "게시글 등록 성공(사진, 이미지도 등록 성공!!) 글목록 페이지로 이동합니다.");
				req.setAttribute("url", "noticeBoard.do");
			} else {

			}
			req.setAttribute("msg", "게시글 등록 성공!! 글목록 페이지로 이동합니다.");
			req.setAttribute("url", "noticeBoard.do");
		} else {
			req.setAttribute("msg", "게시글 등록 실패!! 글 등록 페이지로 이동합니다.");
			req.setAttribute("url", "write_notice_board.do");
		}
		return "message";
	}

	// 공지사항 글 내용 보기 페이지
	@RequestMapping("content_notice_board.do")
	public String noticeBoard_content(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam int major_notice_board_code) throws IOException {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		MajorNoticeBoardDTO dto = majorNoticeBoardMapper.getByNum(major_notice_board_code, "content");
		Map<String, Object> params = new HashMap<>();
		int code = major_notice_board_code;
		String board = "noticeBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		req.setAttribute("path", "resources/notice_board_img");
		req.setAttribute("listFile", list);
		req.setAttribute("getBoard", dto);
		return "board/noticeBoard/contentBoard";
	}

	// 파일 다운로드 처리
	@RequestMapping("/noticeBoard_download.do")
	public String noticeBoard_download(HttpServletRequest req, HttpServletResponse resp,
			@RequestParam int major_notice_board_code) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		HttpSession session = req.getSession();
		Map<String, Object> params = new HashMap<>();
		int code = major_notice_board_code;
		String board = "noticeBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		req.setAttribute("path", "resources/notice_board_img");
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
			File file = new File(session.getServletContext().getRealPath("/resources/notice_board_img/" + save_name));

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
		return "board/noticeBoard/contentBoard";
	}

	// 공지사항 업데이트 폼 이동
	@RequestMapping(value = "update_notice_board.do", method = RequestMethod.GET)
	public String noticeBoard_edit(HttpServletRequest req, int major_notice_board_code) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		req.setAttribute("path", "resources/notice_board_img");
		MajorNoticeBoardDTO dto2 = majorNoticeBoardMapper.getByNum(major_notice_board_code, "update");
		req.setAttribute("getBoard", dto2);
		return "board/noticeBoard/updateBoard";
	}

	// 공지사항 업데이트 처리
	@RequestMapping(value = "update_notice_board.do", method = RequestMethod.POST)
	public String noticeBoard_edit_pro(HttpServletRequest req,
			@RequestParam("original_name") List<MultipartFile> multiFileList, @ModelAttribute MajorNoticeBoardDTO dto,
			BindingResult result) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		if (result.hasErrors()) {
			dto.setImage("");
		}
		HttpSession session = req.getSession();
		String class_code = (String) session.getAttribute("class_code");
		if (result.hasErrors()) {
			dto.setImage("");
		}
		FileDepositoryDTO dto2 = new FileDepositoryDTO();
		String path = req.getSession().getServletContext().getRealPath("resources/notice_board_img");
		req.setAttribute("path", "resources/notice_board_img");
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
		Map<String, String> map2 = checkType(req);
		dto.setClass_code(class_code);
		dto.setIp(req.getRemoteAddr());
		dto.setWriter_id(map2.get("writer_id"));
		dto.setWriter(map2.get("writer"));
		int res = majorNoticeBoardMapper.updateBoard(dto);
		if (res > 0) {
			File fileCheck = new File(path);
			if (!fileCheck.exists())
				fileCheck.mkdirs();
			if (multiFileList == null || multiFileList.get(0).getOriginalFilename().equals("")) {
				req.setAttribute("msg", "글 수정 성공(혹시 파일 수정은 안했지?)! 글 목록 페이지로 이동합니다.");
				req.setAttribute("url", "noticeBoard.do");
				return "message";
			} else if (multiFileList.get(0).getOriginalFilename() != "") {
				Map<String, Object> params = new HashMap<>();
				int code = Integer.parseInt(req.getParameter("major_notice_board_code"));
				String board = "noticeBoard";
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
						req.setAttribute("url", "noticeBoard.do");
						return "message";
					}
				}
			}
			MultipartFile file3 = mr.getFile("original_name");
			if (file3.getOriginalFilename() == null || file3.getOriginalFilename() != "") {
				List<Map<String, String>> fileList = new ArrayList<>();
				for (int i = 0; i < multiFileList.size(); i++) {
					String originFile = multiFileList.get(i).getOriginalFilename();
					int filesize = (int) multiFileList.get(i).getSize();
					String ext = originFile.substring(originFile.lastIndexOf("."));
					String changeFile = UUID.randomUUID().toString() + ext;
					dto2.setBoard("noticeBoard");
					dto2.setOriginal_name(originFile);
					dto2.setSave_name(changeFile);
					dto2.setFilesize(filesize);
					dto2.setCode(dto.getMajor_notice_board_code());
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
				req.setAttribute("url", "noticeBoard.do");
			}
			req.setAttribute("msg", "글 수정 성공! 글 목록 페이지로 이동합니다.");
			req.setAttribute("url", "noticeBoard.do");
		} else {
			req.setAttribute("msg", "글 수정 실패 ! 글 수정 페이지로 이동");
			req.setAttribute("url",	"update_major_notice_board.do?major_board_code=" + dto.getMajor_notice_board_code());
		}
		return "message";
	}

	// 공지사항 글 삭제
	@RequestMapping("delete_notice_board.do")
	public String noticeBoard_delete(HttpServletRequest req) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return "closeWindow_move";
		}
		String major_notice_board_code = req.getParameter("major_notice_board_code");
		String image = req.getParameter("image");
		Map<String, Object> params = new HashMap<>();
		int code = Integer.parseInt(major_notice_board_code);
		String board = "noticeBoard";
		params.put("board", board);
		params.put("code", code);
		List<FileDepositoryDTO> list = fileDepositoryMapper.getFile(params);
		int res = majorNoticeBoardMapper.deleteBoard(Integer.parseInt(major_notice_board_code));
		if (res > 0) {
			String path = req.getSession().getServletContext().getRealPath("resources/notice_board_img");
			req.setAttribute("path", "resources/notice_board_img");
			File file = new File(path, image);
			if (file.exists()) {
				file.delete();
				for (int i = 0; i < list.size(); i++) {
					fileDepositoryMapper.fileDelete(list.get(i).getNum());
					File file2 = new File(path + "\\" + list.get(i).getSave_name());
					if (file2.exists()) {
						file2.delete();
					}
				}
				req.setAttribute("msg", "글 삭제 성공!(이미지, 파일도 삭제 성공) 공지사항 목록 페이지로 이동");
				req.setAttribute("url", "noticeBoard.do");
				return "message";
			} else {
				req.setAttribute("msg", "글 삭제 성공!(이미지, 파일은 삭제 실패) 공지사항 목록 페이지로 이동");
				req.setAttribute("url", "noticeBoard.do");
				return "message";
			}
		} else {
			req.setAttribute("msg", "이미지 삭제 실패!! 공지사항 목록 페이지로 이동합니다.");
			req.setAttribute("url", "noticeBoard.do");
			return "message";
		}
	}

	// 공지게시판 글 찾기 처리
	@RequestMapping("/find_major_notice_board.do")
	public ModelAndView noticeBoard_search(HttpServletRequest req, Map<String, String> params) {
		boolean id_check = isLogin(req);
		if (!id_check) {
			req.setAttribute("msg", "로그인 후 이용가능합니다");
			req.setAttribute("url", "login_main.do");
			return new ModelAndView("closeWindow_move");
		}
		HttpSession session = req.getSession();
		List<MajorNoticeBoardDTO> list = null;
		String search = req.getParameter("search");
		String searchString = req.getParameter("searchString");
		String class_code = (String)session.getAttribute("class_code");
		list = majorNoticeBoardMapper.findList(search, searchString, class_code);
		ModelAndView mav = new ModelAndView();
		if (params.get("search") != null) {
			mav.addObject("find", list);
			mav.addObject("mode", "find");
			mav.setViewName("board/noticeBoard/noticeBoard");
		} else {
			mav.addObject("find", list);
			mav.addObject("mode", "find");
			mav.setViewName("board/noticeBoard/noticeBoard");
		}
		return mav;
	}
}
