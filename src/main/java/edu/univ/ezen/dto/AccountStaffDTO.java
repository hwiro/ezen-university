package edu.univ.ezen.dto;

public class AccountStaffDTO {
	private String staff_id;
	private String staff_pw;
	private String name;
	private String authority_level;
	private String indate;
	private String type;
	private String birthdate;
	private String tel;
	private String address;
	private String email;
	
	public AccountStaffDTO() {
		
	}
	
	public AccountStaffDTO(String staff_id, String staff_pw, String name, 
			String authority_level, String indate, String type, String birthdate, String tel, String address, String email) {
		this.staff_id = staff_id;
		this.staff_pw = staff_pw;
		this.name = name;
		this.authority_level = authority_level;
		this.indate = indate;
		this.type = type;
		this.birthdate = birthdate;
		this.tel = tel;
		this.address = address;
		this.email = email;
	}
	
	public String getStaff_id() {
		return staff_id;
	}
	public void setStaff_id(String staff_id) {
		this.staff_id = staff_id;
	}
	public String getStaff_pw() {
		return staff_pw;
	}
	public void setStaff_pw(String staff_pw) {
		this.staff_pw = staff_pw;
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
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
