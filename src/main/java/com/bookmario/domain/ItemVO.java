package com.bookmario.domain;

import lombok.Data;

@Data
public class ItemVO {
	
	private Long itemID;
	private Long cartID;
	private Long bookID;
	private int amount;
    
    private int count; 
    
    private BookVO bookVO;

	public int getPrice() {
		return bookVO.getPrice();
	}
    
}
