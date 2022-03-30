package com.stationery.project.product;

import java.sql.Date;


import java.util.List;

public class ProductDTO {

	private Integer productNum;
	private Integer categoryNum;
	private String name;
	private String contents;
	private String thumbnail;
	private Integer price;
	private Integer stock;
	private Date regDate;
	
	private ProductFileDTO productFileDTO;
	private List<ProductFileDTO> productFileDTOs;
	private List<OptionDTO> optionDTOs;

	
	private Integer check; //1->썸네일 변경 2->유지 
	
	
	
	
	


	public Integer getCheck() {
		return check;
	}
	public void setCheck(Integer check) {
		this.check = check;
	}
	public List<ProductFileDTO> getProductFileDTOs() {
		return productFileDTOs;
	}
	public void setProductFileDTOs(List<ProductFileDTO> productFileDTOs) {
		this.productFileDTOs = productFileDTOs;
	}
	public ProductFileDTO getProductFileDTO() {
		return productFileDTO;
	}
	public void setProductFileDTO(ProductFileDTO productFileDTO) {
		this.productFileDTO = productFileDTO;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public Integer getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Integer categoryNum) {

		this.categoryNum = categoryNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public Integer getStock() {
		return stock;
	}
	public void setStock(Integer stock) {

		this.stock = stock;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	

	
}


