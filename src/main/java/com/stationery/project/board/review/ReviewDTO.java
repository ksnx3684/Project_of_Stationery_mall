package com.stationery.project.board.review;

import com.stationery.project.board.BoardDTO;

public class ReviewDTO extends BoardDTO{
	private Long orderNum;

	public Long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	
	
}
