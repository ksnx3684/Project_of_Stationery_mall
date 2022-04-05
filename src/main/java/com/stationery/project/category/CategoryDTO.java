package com.stationery.project.category;


public class CategoryDTO {

	private Integer categoryNum;
	private	String categoryName;
	private Integer parentId;
	private Integer level;
	


	public Integer getLevel() {
		return level;
	}
	public void setLevel(Integer level) {
		this.level = level;
	}
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
