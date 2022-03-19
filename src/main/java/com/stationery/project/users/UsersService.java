package com.stationery.project.users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UsersService {
	
	@Autowired
	private UsersDAO usersDAO;
	
	public int join(UsersDTO usersDTO) throws Exception {
		int result = usersDAO.join(usersDTO);
		return result;
	}
	
	public UsersDTO login(UsersDTO usersDTO) throws Exception {
		return usersDAO.login(usersDTO);
	}

}
