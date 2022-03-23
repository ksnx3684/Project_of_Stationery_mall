package com.stationery.project.users;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/users/*")
public class UsersController {

	@Autowired
	private UsersService usersService;
	
	// join form 이동
	@RequestMapping(value = "join", method = RequestMethod.GET)
	public void join() throws Exception {	
	}
	
	// joinCheck form 이동
	@RequestMapping(value = "joinCheck", method = RequestMethod.GET)
	public void joinCheck() throws Exception {
	}
	
	// join 기능
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(UsersDTO usersDTO) throws Exception {
		int result = usersService.join(usersDTO);
		return "redirect:../";
	}
	
	// login form 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public void login(Model model, @CookieValue(value="remember", defaultValue="", required = false) String rememberId) throws Exception {
	}
	
	// login 기능
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(UsersDTO usersDTO, Model model, String remember, HttpSession httpSession, HttpServletResponse httpServletResponse) throws Exception {
		
		if(remember != null && remember.equals("1")) { // login.jsp의 remember 값이 null이 아니거나 "1"일 경우
			Cookie cookie = new Cookie("remember", usersDTO.getId()); // usersDTO의 ID값으로 쿠키 생성
			cookie.setMaxAge(-1);
			httpServletResponse.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("remember", ""); // 공백으로 쿠키 생성
			cookie.setMaxAge(0);
			httpServletResponse.addCookie(cookie);
		}
		
		usersDTO = usersService.login(usersDTO); // 로그인 기능
		
		String message = "로그인 실패";
		String p = "./login";
		
		if(usersDTO != null) {
			httpSession.setAttribute("auth", usersDTO); // "auth"에 로그인 세션 삽입
			message = "로그인 성공";
			p = "../";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		
		String path = "common/result";
		
		return path;
	}
	// logout 기능
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession httpSession) throws Exception {
		httpSession.invalidate();
		return "redirect:../";
	}
	
	// wishlist form 이동
	@RequestMapping(value = "wishlist", method = RequestMethod.GET)
	public void wishlist(Model model, HttpSession httpSession) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		List<WishListDTO> list = usersService.wishlist(usersDTO);
		model.addAttribute("wishlistDTO", list);
	}
	
	// orderlist form 이동
	@RequestMapping(value = "orderlist", method = RequestMethod.GET)
	public void orderlist() throws Exception {
		
	}
	
	// mypage form 이동
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public void mypage(Model model, HttpSession httpSession) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		usersDTO = usersService.mypage(usersDTO);
		model.addAttribute("usersDTO", usersDTO);
	}
	
	// mychange form 이동
	@RequestMapping(value = "mychange", method = RequestMethod.GET)
	public void mychange() throws Exception {
	}
	
	// infochange form 이동
	@RequestMapping(value = "infochange", method = RequestMethod.GET)
	public void infochange(HttpSession httpSession, Model model) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		usersDTO = usersService.mypage(usersDTO);
		model.addAttribute("usersDTO", usersDTO);
	}
	
	// infochange 기능
	@RequestMapping(value = "infochange", method = RequestMethod.POST)
	public String infochange(UsersDTO usersDTO) throws Exception {
		int result = usersService.infochange(usersDTO);
		return "redirect:../";
	}
	
	// pwchange form 이동
	@RequestMapping(value = "pwchange", method = RequestMethod.GET)
	public void pwchange(HttpSession httpSession, Model model) throws Exception {
		UsersDTO usersDTO = (UsersDTO)httpSession.getAttribute("auth");
		usersDTO = usersService.mypage(usersDTO);
		model.addAttribute("usersDTO", usersDTO);
	}
	
	// pwchange 기능
	@RequestMapping(value = "pwchange", method = RequestMethod.POST)
	public String pwchange(UsersDTO usersDTO) throws Exception {
		int result = usersService.pwchange(usersDTO);
		return "redirect:../";
	}
	
	// withdrawal form 이동
	@GetMapping("withdrawal")
	public void withdrawal() throws Exception {
	}	
	
	// withdrawal 기능
	@PostMapping("withdrawal")
	public String withdrawal(UsersDTO usersDTO, Model model, HttpSession httpSession, HttpServletResponse httpServletResponse) throws Exception {
		
		usersDTO = usersService.withdrawal(usersDTO); // 로그인 기능
		
		String message = "아이디 또는 비밀번호가 일치하지 않습니다";
		String p = "./withdrawal";
		
		if(usersDTO != null) {
			httpSession.setAttribute("withdrawal", usersDTO); // "withdrawal"에 로그인 세션 삽입
			message = "회원탈퇴로 진행합니다";
			p = "./withdrawalfinal";
		}
		model.addAttribute("message", message);
		model.addAttribute("path", p);
		
		String path = "common/result";
		return path;
	}
	
	// withdrawalfinal form 이동
	@GetMapping("withdrawalfinal")
	public void withdrawalfinal() throws Exception {
	}
	
	// withdrawalfinal 기능
	@PostMapping("withdrawalfinal")
	public String withdrawalfinal(UsersDTO usersDTO, HttpSession httpSession) throws Exception {
		
		UsersDTO users = (UsersDTO)httpSession.getAttribute("withdrawal");
		
		int result = usersService.withdrawalfinal(users);
		httpSession.invalidate();
		System.out.println(users.getId());
		return "redirect:../";
	}
	
}
