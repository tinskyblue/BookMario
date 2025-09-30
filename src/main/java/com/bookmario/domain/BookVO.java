package com.bookmario.domain;

import lombok.Data;

@Data
public class BookVO {
	
	private Long bookID;
	private String bookISBN;
	private String image;
	private String title;
	private int price;
	private String author;
	private String publisher;
	private int totalPages;
	private int stock;
	private String content;
	private String category;
	
}
