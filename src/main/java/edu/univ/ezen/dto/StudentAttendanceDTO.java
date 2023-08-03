package edu.univ.ezen.dto;

public class StudentAttendanceDTO {
	private int num;
	private String ontime;
	private String student_name;
	private String attendance;
	
	public StudentAttendanceDTO() {
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getOntime() {
		return ontime;
	}

	public void setOntime(String ontime) {
		this.ontime = ontime;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getAttendance() {
		return attendance;
	}

	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	
	
	
}
