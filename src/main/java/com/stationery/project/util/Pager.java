package com.stationery.project.util;

public class Pager {

	private String search;
	private Integer categoryNum;
	
	
	public Integer getCategoryNum() {
		if(this.categoryNum==null) {
			this.categoryNum=0;
		}
		return categoryNum;
	}
	public void setCategoryNum(Integer categoryNum) {
		this.categoryNum = categoryNum;
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
