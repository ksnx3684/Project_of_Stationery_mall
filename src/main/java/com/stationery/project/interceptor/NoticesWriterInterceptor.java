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
import com.stationery.project.users.UsersDTO;

@Component
public class NoticesWriterInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		boolean check = true;
		
		
		
		UsersDTO usersDTO = (UsersDTO)request.getSession().getAttribute("auth");
		if((usersDTO.getUserAccount() != 0) ) {	
			check = false;
			request.setAttribute("message", "권한이 없습니다");
			request.setAttribute("path", "./list");
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
	}
}
