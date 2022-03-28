package com.stationery.project.product;

import com.stationery.project.file.FileDTO;

public class ProductFileDTO extends FileDTO{

	private Integer productNum;
	private Integer thumbnailCheck; //0= 썸네일 
	
	

	public Integer getThumbnailCheck() {
		return thumbnailCheck;
	}

	public void setThumbnailCheck(Integer thumbnailCheck) {
		this.thumbnailCheck = thumbnailCheck;
	}

	public Integer getProductNum() {
		return productNum;
	}

	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	
	
}
