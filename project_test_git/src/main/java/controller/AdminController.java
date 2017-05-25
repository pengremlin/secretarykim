package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import DTO.Auth;
import User.DTO.User_info;
import service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminservice;
	
	@Autowired
	private View jsonView;
	
	/**
	 * 2016.06.18 박철수 admin 페이지
	 * 관리자 권한 list
	 * @param model
	 * @return
	 */
	@RequestMapping("/masterlist.htm")
	public String getAllauth(Model model){
		
		List<User_info> masterlist = new ArrayList<User_info>();
		masterlist = adminservice.masterlist();
		model.addAttribute("masterlist", masterlist);
	
		return "admin.admin";
	}
	
	@RequestMapping(value="/masterlist.htm" , method=RequestMethod.POST)
	public View getAjaxauth(@RequestParam("user_id") String user_id, ModelMap map){
		
		User_info authlist = new User_info();
		authlist = adminservice.getUser(user_id);
		map.addAttribute("authlist", authlist);
	
		return jsonView;
	}
	
	@RequestMapping(value="/mastersubmit.htm" , method=RequestMethod.POST)
	public String setAuth(Auth auth,Model model , 
			@RequestParam("user_id")String user_id,
			RedirectAttributes redirectAttributes , ModelMap map ,
			HttpServletResponse res) throws IOException{
	    
		adminservice.setAuth(auth);
		adminservice.setState(user_id);
		res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('권한 부여에 성공 하였습니다.');");
		List<User_info> masterlist = adminservice.masterlist();
		model.addAttribute("masterlist", masterlist);
		redirectAttributes.addFlashAttribute("masterlist",masterlist);
		out.println("location.href='/momento/admin/masterlist.htm';");
		out.println("</script>");
		out.close();
		
		
		return "admin.admin";
	}

}
