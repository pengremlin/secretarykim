package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import Project.DTO.Lean;
import Project.DTO.Project;
import service.LeanService;

@Controller
@RequestMapping("/project")
public class LeanCanvasController {
	
	@Autowired
	private LeanService leanService;
	
	@RequestMapping("/insertlean.htm")
	public String insert_Lean(Lean leanCanvas ){
		
		List<Project> list = new ArrayList<Project>();
		list = leanService.getProject_info(leanCanvas.getProject_no());
		leanCanvas.setProject_name(list.get(0).getProject_name());
		leanService.insert_Lean(leanCanvas);
		
		return "redirect:/project/leancanvas.htm?project_no="+leanCanvas.getProject_no();
	}
	
	
	@RequestMapping("/updatelean.htm")
	public String updateLean(@RequestParam("data") String data ,@RequestParam("lean_order") String lean_order){
		
		leanService.update_Lean(data ,lean_order);
		
		return "project.leancanvas";
	}
	
	
	@RequestMapping("/leancanvas.htm")
	public String selectlean(int project_no ,Model model ){
		
		
		List<Lean> leanlist = new ArrayList<Lean>();
		
		leanlist = leanService.select_Lean(project_no);
		model.addAttribute("lean_list",leanlist);
		model.addAttribute("project_no",project_no);
		
		return "project.leancanvas";
	}
	
	
	
	@RequestMapping("/deletelean.htm")
	public void selectlean(@RequestParam("lean_no") int lean_no , HttpServletResponse response){

		int result = leanService.deletelean(lean_no);
			
		ObjectMapper mapper = new ObjectMapper();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	


}
	