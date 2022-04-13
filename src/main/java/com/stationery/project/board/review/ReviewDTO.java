package com.stationery.project.board.review;

import java.util.List;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.order.OrderDetailDTO;
import com.stationery.project.product.ProductDTO;

public class ReviewDTO extends BoardDTO {
	private Long detailNum;
	private List<ReviewDTO> fileDTOs;
	private List<OrderDetailDTO> orderDetailDTOs;
	private List<ProductDTO> productDTOs;
	
	public Long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(Long detailNum) {
		this.detailNum = detailNum;
	}
	public List<ReviewDTO> getFileDTOs() {
		return fileDTOs;
	}
	public void setFileDTOs(List<ReviewDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	public List<OrderDetailDTO> getOrderDetailDTOs() {
		return orderDetailDTOs;
	}
	public void setOrderDetailDTOs(List<OrderDetailDTO> orderDetailDTOs) {
		this.orderDetailDTOs = orderDetailDTOs;
	}
	public List<ProductDTO> getProductDTOs() {
		return productDTOs;
	}
	public void setProductDTOs(List<ProductDTO> productDTOs) {
		this.productDTOs = productDTOs;
	}
	
	
	
	
}
