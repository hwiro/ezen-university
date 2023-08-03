package edu.univ.ezen.dto;

public class ClassDTO {
	private String class_code;
	private String class_name;
	private int class_credit;
	private String teacher_id;
	private String teacher_name;
	private String onday;
	private int ontime;
	private String classroom;
	private String dept_id;
	private String dept_name;
	private String course;
	private String semester;
	
	public ClassDTO() {
		
	}
	
	public String getClass_code() {
		return class_code;
	}
	public void setClass_code(String class_code) {
		this.class_code = class_code;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public int getClass_credit() {
		return class_credit;
	}
	public void setClass_credit(int class_credit) {
		this.class_credit = class_credit;
	}
	public String getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(String teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	public String getOnday() {
		return onday;
	}
	public void setOnday(String onday) {
		this.onday = onday;
	}
	public int getOntime() {
		return ontime;
	}
	public void setOntime(int ontime) {
		this.ontime = ontime;
	}
	public String getClassroom() {
		return classroom;
	}
	public void setClassroom(String classroom) {
		this.classroom = classroom;
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
	public String getCourse() {
		return course;
	}
	public void setCourse(String course) {
		this.course = course;
	}
	public String getSemester() {
		return semester;
	}
	public void setSemester(String semester) {
		this.semester = semester;
	}
	
}
