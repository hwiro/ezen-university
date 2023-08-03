package edu.univ.ezen.dto;

public class BookRentDTO {
	private int num;
	private String book_id;
	private String book_name;
	private String student_id;
	private String student_name;
	private String rentdate;
	private String image;
	
	public BookRentDTO() {
		
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getBook_id() {
		return book_id;
	}

	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getRentdate() {
		return rentdate;
	}

	public void setRentdate(String rentdate) {
		this.rentdate = rentdate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
}
