package com.stationery.project.users;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.stationery.project.MyJunitTest;

public class UserDAOTest extends MyJunitTest {
	
	@Autowired
	private UsersDAO usersDAO;

	@Test
	public void check() {
		assertNotNull(usersDAO);
	}
	
	//@Test
	public void joinTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id1");
		usersDTO.setPw("pw1");
		usersDTO.setName("name1");
		usersDTO.setPhone("phone1");
		usersDTO.setEmail("email1");
		usersDTO.setGender(1);
		usersDTO.setJoinDate(null);
		usersDTO.setUserAccount(0);
		usersDTO.setAddressName("addressname1");
		usersDTO.setAddressPhone("addressphone1");
		usersDTO.setPostalCode(1);
		usersDTO.setAddressDetail("addressdetail1");
		
		int result = usersDAO.join(usersDTO);
		
		assertEquals(1, result);
	}
	
	@Test
	public void loginTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id1");
		usersDTO.setPw("pw1");
		
		usersDTO = usersDAO.login(usersDTO);
		
		assertNotNull(usersDTO);
	}
	

}
