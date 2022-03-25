package com.stationery.project.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.stationery.project.board.BoardDTO;
import com.stationery.project.users.UsersDTO;

public class WriterCheckInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String method = request.getMethod();
		
		if(method.equals("POST")) {
			return;
		}
		
		// login 정보
		UsersDTO memberDTO = (UsersDTO)request.getSession().getAttribute("auth");
		
		// writer 정보
		Map<String, Object> map = modelAndView.getModel();
		BoardDTO boardDTO = (BoardDTO)map.get("dto");

		if(!memberDTO.getId().equals(boardDTO.getId())) {
			modelAndView.addObject("message", "권한이 없습니다");
			modelAndView.addObject("path", "./list");
			modelAndView.setViewName("common/result");
	
		}
	}

}
