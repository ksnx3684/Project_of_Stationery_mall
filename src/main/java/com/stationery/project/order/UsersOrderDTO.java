package com.stationery.project.order;

import java.sql.Date;

import com.stationery.project.product.ProductDTO;

public class UsersOrderDTO {

	private Long orderNum;
	private String id;
	private Date orderDate;
	private Integer orderCheck;
	private Integer payCheck;
	private Long totalPrice;
	private String addressName;
	private String addressPhone;
	private Integer addressPostal;
	private String addressDetail;
	private String memo;
	private OrderDetailDTO orderDetailDTO;
	private ProductDTO productDTO;
	
	public Long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Integer getOrderCheck() {
		return orderCheck;
	}
	public void setOrderCheck(Integer orderCheck) {
		this.orderCheck = orderCheck;
	}
	public Integer getPayCheck() {
		return payCheck;
	}
	public void setPayCheck(Integer payCheck) {
		this.payCheck = payCheck;
	}
	public Long getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(Long totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public String getAddressPhone() {
		return addressPhone;
	}
	public void setAddressPhone(String addressPhone) {
		this.addressPhone = addressPhone;
	}
	public Integer getAddressPostal() {
		return addressPostal;
	}
	public void setAddressPostal(Integer addressPostal) {
		this.addressPostal = addressPostal;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public OrderDetailDTO getOrderDetailDTO() {
		return orderDetailDTO;
	}
	public void setOrderDetailDTO(OrderDetailDTO orderDetailDTO) {
		this.orderDetailDTO = orderDetailDTO;
	}
	public ProductDTO getProductDTO() {
		return productDTO;
	}
	public void setProductDTO(ProductDTO productDTO) {
		this.productDTO = productDTO;
	}
}
