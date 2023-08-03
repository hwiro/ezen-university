package edu.univ.ezen.dto;

import java.util.Date;

public class MajorBoardReplyDTO {
	private int major_board_code;
	private int rno;
	private String writer;
	private String writer_id;
	private String content;
	private Date reg_date;
	private String ip;
	
	public MajorBoardReplyDTO() {}
	
	public int getMajor_board_code() {
		return major_board_code;
	}

	public void setMajor_board_code(int major_board_code) {
		this.major_board_code = major_board_code;
	}

	public int getRno() {
		return rno;
	}


	public void setRno(int rno) {
		this.rno = rno;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
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

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "MajorBoardReplyDTO [major_board_code=" + major_board_code + ", rno=" + rno + ", content=" + content + ", writer=" + writer + ", reg_date="
				+ reg_date + "]";
	}
}
