package edu.univ.ezen.dto;

public class EmailConfirmDTO {
	
	private int num;
	private String fcode;
	private String bcode;
	private String mail_check;
	private String send_time;
	private String email;
	
	public EmailConfirmDTO() {
		
	}
	
	public EmailConfirmDTO(int num, String fcode, String bcode, String mail_check, 
			String send_time, String email) {
		this.num = num;
		this.fcode = fcode;
		this.bcode = bcode;
		this.mail_check = mail_check;
		this.send_time = send_time;
		this.email = email;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getFcode() {
		return fcode;
	}

	public void setFcode(String fcode) {
		this.fcode = fcode;
	}

	public String getBcode() {
		return bcode;
	}

	public void setBcode(String bcode) {
		this.bcode = bcode;
	}

	public String getMail_check() {
		return mail_check;
	}

	public void setMail_check(String mail_check) {
		this.mail_check = mail_check;
	}

	public String getSend_time() {
		return send_time;
	}

	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
