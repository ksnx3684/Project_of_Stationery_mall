package com.stationery.project.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.stationery.project.users.UsersDTO;

public class AlreadyLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		UsersDTO usersDTO = (UsersDTO)request.getSession().getAttribute("auth");
		
		boolean check = true;
		
		if(usersDTO != null) {
			check = false;
			request.setAttribute("message", "이미 로그인되어 있습니다");
			request.setAttribute("path", "../users/mypage");
			RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}
		
		return check;
	}
}
