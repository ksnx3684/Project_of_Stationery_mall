package com.stationery.project.board.notices;

import java.sql.Date;
import java.util.List;

import com.stationery.project.board.BoardDTO;

public class NoticesDTO extends BoardDTO {
	private Date createdDate;
	private List<NoticesFileDTO> fileDTOs;
	
	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public List<NoticesFileDTO> getFileDTOs() {
		return fileDTOs;
	}

	public void setFileDTOs(List<NoticesFileDTO> fileDTOs) {
		this.fileDTOs = fileDTOs;
	}
	
	
	
	
}
