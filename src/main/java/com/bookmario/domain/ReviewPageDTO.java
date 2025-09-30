package com.bookmario.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ReviewPageDTO {

	public int reviewCnt;
	private List<ReviewVO> list;
	
}
