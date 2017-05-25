package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import DTO.Auth;
import Emp.DTO.Dept;
import Emp.DTO.Emp_List;
import Project.DTO.Project;
import User.DTO.User_info;
import service.AuthService;
import service.EmpService;

@Controller
@RequestMapping("/auth/")
public class AuthController {
	
	@Autowired
	private AuthService authservice;
	
	@Autowired
	private EmpService empservice;
	
	@Autowired
	private View jsonView;
	
	@RequestMapping("authWriteForm.htm")
	public String absoluteAllauth(Model model){
		List <User_info> userlist = empservice.empInlist();
		model.addAttribute("userlist", userlist);
		
		
		return "auth.auth";
	}
	
	@RequestMapping(value="authWriteForm.htm" , method=RequestMethod.POST)
	public View absoluteAjaxauth(@RequestParam("user_id")String user_id  , ModelMap map){
		List <Auth> authlist = authservice.projectGetauth(user_id);
		List <User_info> userlist = empservice.empInlist();
		List<Dept> dept_list = authservice.get_all_dept();
		map.addAttribute("userlist", userlist);
		map.addAttribute("authlist",authlist);
		map.addAttribute("dept_list", dept_list);
		
		return jsonView;
	}
	//
	@RequestMapping(value="authSumbit.htm" , method=RequestMethod.POST)
	public String authSumbit(Auth auth , Model model){
		
		return authservice.regAuth(auth);
	}
	
	@RequestMapping(value="authDel.htm" , method=RequestMethod.POST)
	public View authAjaxauth(@RequestParam("user_id")String user_id  , ModelMap map){
		List <Auth> authlist = authservice.projectGetauth(user_id);
		List <User_info> userlist = empservice.empInlist();
		List<Dept> dept_list = authservice.get_all_dept();
		map.addAttribute("userlist",userlist);
		map.addAttribute("authlist",authlist);
		map.addAttribute("dept_list", dept_list);
		
		return jsonView;
	}
	
	@RequestMapping(value="authDelSumbit.htm" , method=RequestMethod.POST)
	public String authdelSumbit(Auth auth , Model model){
		
		return authservice.delAuth(auth);
	}
	
	@RequestMapping("projectWriteForm.htm")
	public String projectAllauth(Model model){
		List<Auth> projectlist = authservice.projectAllauth();
		model.addAttribute("projectlist", projectlist);
		return "auth.projectauthlist";
	}
	
	@RequestMapping(value="projectWriteForm.htm" , method=RequestMethod.POST)
	public View projectAjaxauth(@RequestParam("user_id")String user_id , ModelMap map){
		List<Auth> getprojectlist = authservice.projectGetauth(user_id);
		map.addAttribute("getprojectlist", getprojectlist);
		return jsonView;
	}
	
	@RequestMapping(value="projectSumbit.htm" , method=RequestMethod.POST)
	public String projectSumbit(Auth auth , RedirectAttributes redirectAttributes , Model model){
		
		authservice.projectSubmit(auth);
		List<Auth> projectlist = authservice.projectAllauth();
		model.addAttribute("projectlist", projectlist);
		redirectAttributes.addFlashAttribute("projectlist", projectlist);
		return "auth.projectauthlist";
	}
	
	
	@RequestMapping("projectsubWriteForm.htm")
	public String projectsubWriteForm(Model model){
		
		
		
		List<User_info> User_info = authservice.get_all_emp_list();
		model.addAttribute("User_info", User_info);
		
		
		return "auth.projectauthlist";
	}
	
	@RequestMapping("/get_project_for_give_auth.htm")
	public void get_project_for_give_auth(HttpServletResponse response) {

		List<Project> project_list = authservice.get_project_for_give_auth();
		
		
		
		

		ObjectMapper mapper = new ObjectMapper();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(project_list));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	@RequestMapping("/give_auth.htm")
	public void give_auth(@RequestParam("user_id") String user_id,@RequestParam("project_no") int project_no,@RequestParam("project_name") String project_name,HttpServletResponse response){
		
		
		
		int result = authservice.give_auth(project_no, user_id, project_name);
		
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	
	
	
	
	
	
	
	@RequestMapping(value="subauthSumbit.htm" , method=RequestMethod.POST)
	public String projectsubWritesubmit(Auth auth , RedirectAttributes redirectAttributes , Model model){
		
		authservice.projectSubmit(auth);
		List<Auth> authlist = authservice.projectsubAllauth();
		model.addAttribute("authlist", authlist);
		redirectAttributes.addFlashAttribute("authlist", authlist);
		return "auth.subauth";
	}
	

}
