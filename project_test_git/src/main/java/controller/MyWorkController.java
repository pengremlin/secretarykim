package controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DTO.MyWork;
import service.MyWorkService;



@Controller
@RequestMapping("/mypage/")
public class MyWorkController {
	

	@Autowired
	private MyWorkService myworkservice;
	

	@RequestMapping(value = "/mypage.htm", method = RequestMethod.GET)
	public String edit(HttpServletRequest request, Principal user_id, Model model)  throws ClassNotFoundException, SQLException{
		
		List<MyWork> list = myworkservice.getWork(user_id);
		model.addAttribute("mywork", list);
		return "mypage.mypage";
	}


	@RequestMapping(value = "/insertWork.htm", method = RequestMethod.POST)
	public String insertWork(MyWork mywork) throws ClassNotFoundException, SQLException {

		return myworkservice.insertWork(mywork);
	}
	
	@RequestMapping("/deleteWork.htm")
	public String deleteMSG(int work_num) throws ClassNotFoundException, SQLException {
		
		return myworkservice.deleteWork(work_num);
		
	}

}
