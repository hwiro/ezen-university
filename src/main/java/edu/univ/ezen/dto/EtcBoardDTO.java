package edu.univ.ezen.dto;

public class EtcBoardDTO {
	private int etc_board_code;
	private String subject;
	private String writer;
	private String writer_id;
	private String image;
	private String content;
	private String reg_date;
	private int readcount;
	private int thumb;
	private String ip;
	
	public EtcBoardDTO() {
		
	}
	
	public EtcBoardDTO(int etc_board_code, String subject, String writer, 
			String writer_id, String image, String content, String reg_date, 
			int readcount, int thumb, String ip) {
		this.etc_board_code = etc_board_code;
		this.subject = subject;
		this.writer = writer;
		this.writer_id = writer_id;
		this.image = image;
		this.content = content;
		this.reg_date = reg_date;
		this.readcount = readcount;
		this.thumb = thumb;
		this.ip = ip;
	}

	public int getEtc_board_code() {
		return etc_board_code;
	}

	public void setEtc_board_code(int etc_board_code) {
		this.etc_board_code = etc_board_code;
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
	
	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public int getThumb() {
		return thumb;
	}

	public void setThumb(int thumb) {
		this.thumb = thumb;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
