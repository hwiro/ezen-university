package edu.univ.ezen.dto;

public class LibraryBoardDTO {
	private int lib_board_code;
	private String subject;
	private String writer;
	private String content;
	private String regdate;
	private int readcount;
	private String filename;
	private String image;
	
	public LibraryBoardDTO() {
		
	}

	public int getLib_board_code() {
		return lib_board_code;
	}

	public void setLib_board_code(int lib_board_code) {
		this.lib_board_code = lib_board_code;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
