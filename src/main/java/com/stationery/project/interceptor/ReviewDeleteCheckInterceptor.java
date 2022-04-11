package com.stationery.project.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.board.faq.FaqDAO;
import com.stationery.project.board.faq.FaqDTO;
import com.stationery.project.board.notices.NoticesDAO;
import com.stationery.project.board.notices.NoticesDTO;
import com.stationery.project.board.qnas.QnasDAO;
import com.stationery.project.board.qnas.QnasDTO;
import com.stationery.project.board.review.ReviewDAO;
import com.stationery.project.board.review.ReviewDTO;
import com.stationery.project.users.UsersDTO;

@Component
public class ReviewDeleteCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	private ReviewDAO reviewDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check=true;
		System.out.println("Delete Interceptor");
		Long num = Long.parseLong(request.getParameter("num"));
		BoardDTO boardDTO = new ReviewDTO();
		boardDTO.setNum(num);
		boardDTO = reviewDAO.detail(boardDTO);

		
		UsersDTO usersDTO = (UsersDTO) request.getSession().getAttribute("auth");
		
		if(!boardDTO.getId().equals(usersDTO.getId())) {
			check=false;
			// foward 방식
			request.setAttribute("message", "작성자만 삭제 가능합니다");
			request.setAttribute("path", "./list");
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);
			
		}
				
		return check;
	}

}