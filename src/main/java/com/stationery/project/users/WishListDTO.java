package com.stationery.project.users;

import com.stationery.project.product.ProductDTO;

public class WishListDTO {

	private Integer wishNum;
	private String id;
	private Integer productNum;
	private ProductDTO productDTO;
	
	
	public Integer getWishNum() {
		return wishNum;
	}
	public void setWishNum(Integer wishNum) {
		this.wishNum = wishNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	
	
}
