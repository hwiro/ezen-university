package edu.univ.ezen.dto;

public class DeptDTO {
	private String dept_id;
	private String dept_name;
	private String dept_head;
	private String dept_tel;
	private String dept_location;
	private String issingle;
	
	public DeptDTO() {
		
	}
	
	public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getDept_head() {
		return dept_head;
	}
	public void setDept_head(String dept_head) {
		this.dept_head = dept_head;
	}
	public String getDept_tel() {
		return dept_tel;
	}
	public void setDept_tel(String dept_tel) {
		this.dept_tel = dept_tel;
	}
	public String getDept_location() {
		return dept_location;
	}
	public void setDept_location(String dept_location) {
		this.dept_location = dept_location;
	}
	public String getIssingle() {
		return issingle;
	}
	public void setIssingle(String issingle) {
		this.issingle = issingle;
	}
	
}
