package edu.univ.ezen.dto;

public class MyClassDTO {
	private int num;
	private String student_id;
	private String class_code;
	private String teacher_name;
	private String class_name;
	private int class_credit;
	private int my_credit;
	private String semester;
	private String course;
	private String onday;
	private int ontime;
	
	public MyClassDTO() {
		
	}
	
	public MyClassDTO(int num, String student_id, String class_code, String teacher_name, 
			String class_name, int class_credit, int my_credit, String semester, 
			String course, String onday, int ontime) {
		this.num = num;
		this.student_id = student_id;
		this.class_code = class_code;
		this.teacher_name = teacher_name;
		this.class_name = class_name;
		this.class_credit = class_credit;
		this.my_credit = my_credit;
		this.semester = semester;
		this.course = course;
		this.onday = onday;
		this.ontime = ontime;
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

	public String getClass_code() {
		return class_code;
	}

	public void setClass_no(String class_code) {
		this.class_code = class_code;
	}

	public String getTeacher_name() {
		return teacher_name;
	}

	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
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

	public int getMy_credit() {
		return my_credit;
	}

	public void setMy_credit(int my_credit) {
		this.my_credit = my_credit;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
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
	
}
