package com.bookmario.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartVO {
	
	public static final int SHOPPING = 0;
    public static final int ORDERD = 1;
    public static final int SHIPPING = 2;
    public static final int DELYVERED = 3;
    
    private Long cartID;
    private int status;
    private String userID;
    
    private int count;
	
    private List<ItemVO> items;
    private int totalPrice;
    
	/*public CartVO() {
		
	}*/
    
    public CartVO(int status, String userID) {
        this.status = status;
        this.userID = userID;
    }
}
