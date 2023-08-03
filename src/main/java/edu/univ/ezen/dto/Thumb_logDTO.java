package edu.univ.ezen.dto;

public class Thumb_logDTO {
	
	private int num;
	private int code;
	private String id;
	
	public Thumb_logDTO(int num, int code, String id) {
		this.num = num;
		this.code = code;
		this.id = id;
	}
	
	public Thumb_logDTO() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
