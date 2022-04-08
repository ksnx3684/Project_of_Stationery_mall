package com.stationery.project.board.qnas;

import java.util.List;

import com.stationery.project.board.BoardDTO;

public class QnasDTO extends BoardDTO{
	private Integer productNum;
	private Integer type;
	private Long ref;
	private Long step;
	private Long depth;
	
	private List<QnasDTO> fileDTOs;
	

	public List<QnasDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<QnasDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Long getRef() {
		return ref;
	}
	public void setRef(Long ref) {
		this.ref = ref;
	}
	public Long getStep() {
		return step;
	}
	public void setStep(Long step) {
		this.step = step;
	}
	public Long getDepth() {
		return depth;
	}
	public void setDepth(Long depth) {
		this.depth = depth;
	}
	
	
}
