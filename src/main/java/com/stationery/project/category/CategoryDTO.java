package com.stationery.project.category;

public class CategoryDTO {

	private Integer categoryNum;
	private	String categoryName;
	private Integer parentId;
	
	public Integer getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(Integer categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	

	
}
