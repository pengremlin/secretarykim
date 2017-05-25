package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import DAO.UserDAO;
import DTO.Auth;
import User.DTO.User_info;
import service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userservice;

	@Autowired
	private SqlSession sqlsession;

	@Autowired
	private JavaMailSender mailSender;

	@RequestMapping("/getAllUser.htm")
	public String list(Model model) {

		List<User_info> list = userservice.list();

		model.addAttribute("list", list);

		return "user/list";
	}

	@RequestMapping(value = "/join.htm", method = RequestMethod.POST)
	public String main(User_info user_id, Auth auth, HttpServletResponse response) throws IOException {

		// 유효성검사
		// else 면 joinUser()실행해야함
		String id = user_id.getUser_id();

		int userCheck = userservice.checkUser(id);
		if (userCheck > 0) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('이미 등록된 아이디 입니다.');");
			out.println("location.href='join.htm';");
			out.println("</script>");
			out.close();
			return null;

		} else {

			int result = userservice.joinUser(user_id);
			userservice.authUser(auth);
			if (result != 0) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('성공적으로 가입되었습니다.');");
				out.println("location.href='index.htm';");
				out.println("</script>");
				out.close();

				return "home.index";
			}

		}
		return null;
	}

	// 아이디 찾기
	@RequestMapping(value = "idSearch.htm", method = RequestMethod.POST)
	public String searchidsuccess(String user_name, String user_email) throws Exception {

		System.out.println("searchsuccess start");
		SimpleMailMessage msg = new SimpleMailMessage();

		UserDAO userdao = sqlsession.getMapper(UserDAO.class);

		User_info user_info = userdao.idSearch(user_name, user_email);
		System.out.println(user_info);

		if (user_info != null) {
			// 메일 발송
			msg.setSubject("[KIMBUSIOR] 귀하의 아이디를 알려드립니다.");
			msg.setTo(user_email);
			msg.setText(user_name + " 님의 아이디는 " + user_info.getUser_id() + " 입니다.");
			mailSender.send(msg);
		} else {
			System.out.println("일치하는 정보 없음");
		}
		System.out.println("searchsuccess end");

		return "joinus.login";

	}

	// 패스워드 찾기
	@RequestMapping(value = "pwdSearch.htm", method = RequestMethod.POST)
	public String searchipwdsuccess(String user_id, String user_email) throws Exception {

		System.out.println("searchsuccess start");
		SimpleMailMessage msg = new SimpleMailMessage();

		UserDAO userdao = sqlsession.getMapper(UserDAO.class);

		User_info user_info = userdao.pwdSearch(user_id, user_email);
		System.out.println(user_info);

		if (user_info != null) {
			// 메일 발송
			msg.setSubject("[KIMBUSIOR] 귀하의 패스워드를 알려드립니다.");
			msg.setTo(user_email);
			msg.setText("패스워드는 " + user_info.getUser_pwd() + " 입니다.");
			mailSender.send(msg);
		} else {
			System.out.println("일치하는 정보 없음");
		}
		System.out.println("searchsuccess end");

		return "joinus.login";

	}
	
	// 아이디 중복확인
	@RequestMapping(value = "/idcheck.htm", method = RequestMethod.POST)
	public void idecheck(@RequestParam("user_id") String check, HttpServletResponse response) {
		System.out.println("id check");

		int userlist = 0;
		
		userlist = userservice.checkUser(check);

		PrintWriter writer = null;

		try {
			writer = response.getWriter();
			writer.write(userlist + "");
			writer.flush();
		} catch (IOException e) {
			throw new RuntimeException(e.getMessage(), e);
		} finally {
			if (writer != null) {
				writer.close();
			}
		}
	}
	
}
