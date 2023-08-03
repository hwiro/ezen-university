package edu.univ.ezen.dto;

public class AccountTeacherDTO {
	private String teacher_id;
	private String teacher_pw;
	private String name;
	private String dept;
	private String history;
	private String birthdate;
	private String tel;
	private String address;
	private String type;
	private String email;
	
	public AccountTeacherDTO() {
		
	}
	
	public AccountTeacherDTO(String teacher_id, String teacher_pw, String name, String dept,
		String history, String birthdate, String tel, String address, String type, String email) {
		this.teacher_id = teacher_id;
		this.teacher_pw = teacher_pw;
		this.name = name;
		this.dept = dept;
		this.history = history;
		this.birthdate = birthdate;
		this.tel = tel;
		this.address = address;
		this.type = type;
		this.email = email;
	}
	
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_pw() {
		return teacher_pw;
	}
	public void setTeacher_pw(String teacher_pw) {
		this.teacher_pw = teacher_pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
	
	