package edu.univ.ezen.dto;

public class AccountStudentDTO {
	private String student_id;
	private String student_pw;
	private String name;
	private String dept;
	private int grade;
	private int total_credit;
	private String birthdate;
	private String tel;
	private String address;
	private String status;
	private String indate;
	private String type;
	private String college;
	private String email;
	
	public AccountStudentDTO() {
		
	}
	
	public AccountStudentDTO(String student_id, String student_pw, String name, 
			String dept, int grade, int total_credit, String birthdate, String tel, 
			String address, String status, String indate, String type, String college,
			String email) {
		this.student_id = student_id;
		this.student_pw = student_pw;
		this.name = name;
		this.dept = dept;
		this.grade = grade;
		this.total_credit = total_credit;
		this.birthdate = birthdate;
		this.tel = tel;
		this.address = address;
		this.status = status;
		this.indate = indate;
		this.type = type;
		this.college = college;
		this.email = email;
	}
	
	public String getStudent_id() {
		return student_id;
	}
	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}
	public String getStudent_pw() {
		return student_pw;
	}
	public void setStudent_pw(String student_pw) {
		this.student_pw = student_pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getCollege() {
		return college;
	}

	public void setCollege(String college) {
		this.college = college;
	}

	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getTotal_credit() {
		return total_credit;
	}
	public void setTotal_credit(int total_credit) {
		this.total_credit = total_credit;
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
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
