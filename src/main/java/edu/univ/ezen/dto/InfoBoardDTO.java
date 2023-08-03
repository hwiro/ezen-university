package edu.univ.ezen.dto;

public class InfoBoardDTO {
	private int info_code;
	private String info_title;
	private String writer;
	private String content;
	private String reg_date;
	private int readcount;
	private String image;
	private String type;
	
	public InfoBoardDTO() {
		
	}
	
	public int getInfo_code() {
		return info_code;
	}
	
	public void setInfo_code(int info_code) {
		this.info_code = info_code;
	}
	
	public String getInfo_title() {
		return info_title;
	}
	
	public void setInfo_title(String info_title) {
		this.info_title = info_title;
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
	
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}

