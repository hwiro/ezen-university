package edu.univ.ezen.dto;

public class AccountAdminDTO {
	private String admin_id;
	private String admin_pw;
	private String name;
	private String authority_level;
	
	public AccountAdminDTO() {
		
	}
	
	public AccountAdminDTO(String admin_id, String admin_pw, String name, String authority_level) {
		this.admin_id = admin_id;
		this.admin_pw = admin_pw;
		this.name = name;
		this.authority_level = authority_level;
	}
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_pw() {
		return admin_pw;
	}
	public void setAdmin_pw(String admin_pw) {
		this.admin_pw = admin_pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthority_level() {
		return authority_level;
	}
	public void setAuthority_level(String authority_level) {
		this.authority_level = authority_level;
	}
}
