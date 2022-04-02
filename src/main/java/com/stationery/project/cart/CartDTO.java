package com.stationery.project.cart;

import java.util.List;

import com.stationery.project.product.ProductDTO;
import com.stationery.project.users.UsersDTO;

public class CartDTO {

	private Long cartNum;
	private String id;
	private Long productNum;
	private Long productCount;
	private Long totalPrice;
	private UsersDTO usersDTO;
	public List<ProductDTO> getProductDTOs() {
		return productDTOs;
	}
	public void setProductDTOs(List<ProductDTO> productDTOs) {
		this.productDTOs = productDTOs;
	}
	private List<ProductDTO> productDTOs;
	private ProductDTO productDTO;
	
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
	public Long getCartNum() {
		return cartNum;
	}
	public void setCartNum(Long cartNum) {
		this.cartNum = cartNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Long getProductNum() {
		return productNum;
	}
	public void setProductNum(Long productNum) {
		this.productNum = productNum;
	}
	public Long getProductCount() {
		return productCount;
	}
	public void setProductCount(Long productCount) {
		this.productCount = productCount;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public UsersDTO getUsersDTO() {
		return usersDTO;
	}
	public void setUsersDTO(UsersDTO usersDTO) {
		this.usersDTO = usersDTO;
	}
//	public List<ProductDTO> getProductDTOs() {
//		return productDTOs;
//	}
//	public void setProductDTOs(List<ProductDTO> productDTOs) {
//		this.productDTOs = productDTOs;
//	}
	
}
