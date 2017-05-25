package controller;

import java.security.Principal;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DTO.Auth;
import Emp.DTO.EMP;
import Emp.DTO.Job;
import service.CompService;
import service.EmpService;

@Controller
@RequestMapping("/company/")
public class CompController {

	@Autowired
	private CompService compservice;
	

	@Autowired
	private EmpService empservice;

	
	@RequestMapping("company.htm")
	public String company(Principal principal , HttpSession session){
		

		EMP emp = new EMP();
		
		emp.setUser_id(principal.getName());
		
		int result = empservice.getEmp_no(emp);
		
		session.setAttribute("emp_no", result);
	
	  // Tiles 적용
	  return "company.company";  // return view (UrlBase)
	}

	
	@RequestMapping(value="write.htm" , method=RequestMethod.POST)
	public String Comp(Job job , EMP emp , Auth auth) {
		compservice.jobComp(job);
		compservice.empComp(emp);
		compservice.authComp(auth);
	    
		return "company.company";
	}
}
