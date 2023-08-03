package edu.univ.ezen.dto;

public class QnaBoardDTO {
	private int qna_code;
	private String qna_title;
	private String content;
	
	public QnaBoardDTO() {
		
	}

	public int getQna_code() {
		return qna_code;
	}

	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
