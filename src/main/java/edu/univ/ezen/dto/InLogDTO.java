package edu.univ.ezen.dto;

public class InLogDTO {
	private int num;
	private String id;
	private String indate;
	private String ip;
	
	public InLogDTO() {
		
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {	
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;	
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;	
	}
}
