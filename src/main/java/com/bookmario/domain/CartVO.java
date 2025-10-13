package com.bookmario.domain;

import java.util.List;

import lombok.Data;

@Data
public class CartVO {
	
	public static final int SHOPPING = 0;
    public static final int ORDERED = 1;
    public static final int SHIPPING = 2;
    public static final int DELIVERED = 3;
    
    private Long cartID;
    private String userID;
    private int status;
   
    private List<ItemVO> items;
    private int totalPrice;
    private int count;
    
    public CartVO(int status, String userID) {
        this.status = status;
        this.userID = userID;
    }
}
