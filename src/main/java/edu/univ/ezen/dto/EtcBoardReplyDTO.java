package edu.univ.ezen.dto;

public class EtcBoardReplyDTO {
	private int etc_board_reply_code;
	private String writer;
	private String writer_id;
	private String content;
	private String reg_date;
	private String ip;
	private int ref_group;
	
	public EtcBoardReplyDTO() {
		
	}
	
	public EtcBoardReplyDTO(int etc_board_reply_code, String writer, String writer_id, 
			String content, String reg_date, String ip, int ref_group) {
		this.etc_board_reply_code = etc_board_reply_code;
		this.writer = writer;
		this.writer_id = writer_id;
		this.content = content;
		this.reg_date = reg_date;
		this.ip = ip;
		this.ref_group = ref_group;
	}

	public int getEtc_board_reply_code() {
		return etc_board_reply_code;
	}

	public void setEtc_board_reply_code(int etc_board_reply_code) {
		this.etc_board_reply_code = etc_board_reply_code;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public String getWriter_id() {
		return writer_id;
	}

	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getRef_group() {
		return ref_group;
	}

	public void setRef_group(int ref_group) {
		this.ref_group = ref_group;
	}
	
}
