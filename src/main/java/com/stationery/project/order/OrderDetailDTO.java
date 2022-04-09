package com.stationery.project.order;

import java.util.List;

import com.stationery.project.product.ProductDTO;

public class OrderDetailDTO extends ProductDTO{

	private Long detailNum;
	private Long orderNum;
	private Integer productNum;
	private Long count;
	private Integer price;
	private String name;
	private String optionContents;
	private List<ProductDTO> productDTOs;
	
	
	public Long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(Long detailNum) {
		this.detailNum = detailNum;
	}
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOptionContents() {
		return optionContents;
	}
	public void setOptionContents(String optionContents) {
		this.optionContents = optionContents;
	}
	public List<ProductDTO> getProductDTOs() {
		return productDTOs;
	}
	public void setProductDTOs(List<ProductDTO> productDTOs) {
		this.productDTOs = productDTOs;
	}
}
