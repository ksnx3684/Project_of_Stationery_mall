package com.stationery.project.util;

public class Pager {

	private Long perPage;// 페이지당보여줄 row 개수
	private Long page;// page 번호
	private Long startRow;// 시작번호
	private Long lastRow;// 끝번호
	
	private Long startNum;
	private Long lastNum;

	private boolean pre; // t - 이전 있음 f- 없음
	private boolean next; // t - 다음 있음 f- 없음

	
	private String search;
	private Integer categoryNum;
	
	// 시작번호,끝번호 계산
	public void makeRow() {
		this.startRow = (this.getPage() - 1) * this.getPerPage() + 1;
		this.lastRow = this.getPage() * this.getPerPage();
	}
	
	public void makeNum(Long totalCount) {
		// 1. 전체 row의 개수 (db에서 구해와야됨 )

		// 2. 전체 page의 개수구하기 (this.perPage 아닌 이유 :null 방지)
		Long totalPage = totalCount / this.getPerPage();
		if (totalCount % this.getPerPage() != 0) {
			totalPage++;
			// 나머지가 있으면 1 증가 시킴
		}

		// 3. 블럭당 페이지 개수 설정
		Long perBlock = 10L;

		// 4. 전체 블럭의 개수 구하기
		Long totalBlock = totalPage / perBlock;
		if (totalPage % perBlock != 0) {
			totalBlock++;
		}

		// 5. page번호로 현재 몇번째 Block인지 계산
		// 첫번째 : 1 - 10
		// 두번째 : 11 -20

		// page block
		// 1 1
		// 2 1
		// 9 1
		// 10 1
		// 11 2
		// 20 2
		// 21 3

		Long curBlock = this.getPage() / perBlock;
		if (this.getPage() % perBlock != 0) {
			curBlock++;
		}

		// 6. curBlock으로 startNum, lastNum 구하기
		// curBlock startNum lastNum
		// 1 1 10
		// 2 11 20

		this.startNum = (curBlock - 1) * perBlock + 1;
		this.lastNum = curBlock * perBlock;

	

		// 7. 이전 또는 다음 블럭 유무
		this.pre = false;
		if (curBlock > 1) {
			// 현재 블럭이 1이 아니라면 pre 활성화
			this.pre = true;
		}

		this.next = false;
		if (totalBlock > curBlock) { // 현재블록이 마지막 블록이 아니라면 next활성화
			this.next = true;
		}

		// 8. 현재 블럭이 마지막 블럭번호랑 같다면 page 있는 번호만 보여주기
		if (curBlock == totalBlock) {
			this.lastNum = totalPage;
		}
	}
	
	
	public Long getPerPage() {
		if (this.perPage == null || this.perPage < 1) {
			this.perPage = 10L;
		}
		return perPage;
	}
	public void setPerPage(Long perPage) {
		this.perPage = perPage;
	}
	public Long getPage() {
		if (this.page == null || this.page < 1) {
			this.page = 1L;
		}
		return page;
	}
	public void setPage(Long page) {
		this.page = page;
	}
	public Long getStartRow() {
		return startRow;
	}
	public void setStartRow(Long startRow) {
		this.startRow = startRow;
	}
	public Long getLastRow() {
		return lastRow;
	}
	public void setLastRow(Long lastRow) {
		this.lastRow = lastRow;
	}
	public Long getStartNum() {
		return startNum;
	}
	public void setStartNum(Long startNum) {
		this.startNum = startNum;
	}
	public Long getLastNum() {
		return lastNum;
	}
	public void setLastNum(Long lastNum) {
		this.lastNum = lastNum;
	}
	public boolean isPre() {
		return pre;
	}
	public void setPre(boolean pre) {
		this.pre = pre;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public Integer getCategoryNum() {
	
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
