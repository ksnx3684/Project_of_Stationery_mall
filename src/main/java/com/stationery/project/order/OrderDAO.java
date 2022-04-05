package com.stationery.project.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.stationery.project.cart.CartDTO;
import com.stationery.project.users.UsersDTO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.stationery.project.order.OrderDAO.";

	
}
