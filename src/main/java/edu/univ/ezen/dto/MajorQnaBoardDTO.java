package edu.univ.ezen.dto;

public class MajorQnaBoardDTO {
	private int major_qna_board_code;
	private String subject;
	private String writer;
	private String writer_id;
	private String image;
	private String content;
	private String reg_date;
	private int readcount;
	private String ip;
	private int re_step;
	private int re_level;
	private int re_group;
	private String class_code;
	private String teacher_id;
	private boolean secret;
	
	public MajorQnaBoardDTO() {}

	public int getMajor_qna_board_code() {
		return major_qna_board_code;
	}

	public void setMajor_qna_board_code(int major_qna_board_code) {
		this.major_qna_board_code = major_qna_board_code;
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

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public int getRe_group() {
		return re_group;
	}

	public void setRe_group(int re_group) {
		this.re_group = re_group;
	}

	public String getClass_code() {
		return class_code;
	}

	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}

	public String getTeacher_id() {
		return teacher_id;
	}

	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}

	public boolean isSecret() {
		return secret;
	}

	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	
		
}
