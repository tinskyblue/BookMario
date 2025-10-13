package com.bookmario.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userID;
	private String userPass;
	private String username;
	private String email;
	private String phon;
	private String address;
	private Date regiDate;
	private boolean enabled;
	private Date regDate;
	
	private List<AuthVO> authList;

}
