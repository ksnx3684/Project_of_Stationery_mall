package com.stationery.project.util;

public class Pager {

	private String search;
	private String categoryName;
	
	
	
	
	public String getCategoryName() {
		if(this.categoryName==null) {
			this.search="";
		}
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}


	
	
}
