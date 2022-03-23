package com.stationery.project.users;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;

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
	
	//@Test
	public void loginTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id1");
		usersDTO.setPw("pw1");
		
		usersDTO = usersDAO.login(usersDTO);
		
		assertNotNull(usersDTO);
	}
	
	//@Test
	public void mypageTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id3");
		
		usersDTO = usersDAO.mypage(usersDTO);
		
		assertNotNull(usersDTO);
	}
	
	//@Test
	public void infochangeTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id2");
		usersDTO.setPhone("phone2");
		usersDTO.setEmail("email2");
		usersDTO.setAddressName("addressname2");
		usersDTO.setAddressPhone("addressphone2");
		usersDTO.setPostalCode(1);
		usersDTO.setAddressDetail("addressdetail2");
		
		int result = usersDAO.infochange(usersDTO);
		
		assertEquals(1, result);
	}
	
	//@Test
	public void pwchangeTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id3");
		usersDTO.setPw("pw3");
		
		int result = usersDAO.pwchange(usersDTO);
		
		assertEquals(1, result);
	}
	
	//@Test
	public void withdrawalTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id3");
		usersDTO.setPw("pw3");
		
		usersDTO = usersDAO.withdrawal(usersDTO);
		
		assertNotNull(usersDTO);
	}
	
	//@Test
	public void withdrawalfinalTest() throws Exception {
		UsersDTO usersDTO = new UsersDTO();
		usersDTO.setId("id4");
		
		int result = usersDAO.withdrawalfinal(usersDTO);
		
		assertEquals(1, result);
	}
	
}
