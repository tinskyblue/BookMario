package com.bookmario.domain;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userID;
	private String userPass;
	private String username;
	private String Email;
	private String Phon;
	private String Addr1;
	private String Addr2;
	private Date regiDate;
	private boolean enabled;
	private Date regDate;
	
	private List<AuthVO> authList;

}
