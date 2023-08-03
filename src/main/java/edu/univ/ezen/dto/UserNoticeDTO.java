package edu.univ.ezen.dto;

public class UserNoticeDTO {
	
	private int num;
	private String student_id;
	private String notice;
	private String url;
	
	public UserNoticeDTO() {
		
	}
	
	public UserNoticeDTO(int num, String student_id, String notice, String url) {
		this.num = num;
		this.student_id = student_id;
		this.notice = notice;
		this.url = url;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getNotice() {
		return notice;
	}

	public void setNotice(String notice) {
		this.notice = notice;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
