package com.stationery.project.board.qnas;

import java.util.List;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.util.Pager;

public class QnasVO {
	private Pager pager;
	private List<BoardDTO> qnasDTOs;
	
	
	public Pager getPager() {
		return pager;
	}
	public void setPager(Pager pager) {
		this.pager = pager;
	}
	public List<BoardDTO> getQnasDTOs() {
		return qnasDTOs;
	}
	public void setQnasDTOs(List<BoardDTO> qnasDTOs) {
		this.qnasDTOs = qnasDTOs;
	}
	
	

//	@Override
//	public int hashCode() {
//		
//		return super.hashCode();
//	}
//	@Override
//	public boolean equals(Object obj) {
//		
//		return super.equals(obj);
//	}
	
	
	
}
