package edu.univ.ezen.dto;

public class UserBlacklistDTO {

	private int num;
	private String student_id;
	private String board;
	
	public UserBlacklistDTO() {
		
	}
	
	public UserBlacklistDTO(int num, String student_id, String board) {
		this.num = num;
		this.student_id = student_id;
		this.board = board;
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

	public String getBoard() {
		return board;
	}

	public void setBoard(String board) {
		this.board = board;
	}
	
	
}
