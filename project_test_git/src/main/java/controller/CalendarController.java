package controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.ObjectMapper;

import Project.DTO.CalendarDTO;
import Project.DTO.Project;
import service.CalendarService;
import service.ProjectService;

@Controller
@RequestMapping("/project")
public class CalendarController {

	@Autowired
	private CalendarService calendarService;
	
	@Autowired
	private ProjectService projectService;

	int result = 0;


	@RequestMapping("/calendar.htm")
	public String go_calendar(int project_no , String project_name , Model model) {
		
			
		CalendarDTO CalendarDTO = new CalendarDTO();
		
		CalendarDTO.setProject_no(project_no);
		CalendarDTO.setProject_name(project_name);			
		
		
		List<CalendarDTO> list = new ArrayList<CalendarDTO>();		
		list = calendarService.selectCal(CalendarDTO);
		model.addAttribute("cal_list", list);
		model.addAttribute("project_no", project_no);
		model.addAttribute("project_name", project_name);
		return "project.calendar";
	}
	
	

	
	

	@RequestMapping("/insertCal.htm")
	public String insertCal(int project_no , String project_name , 
					String version_title , Model model) {
		
		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setProject_no(project_no);
		calendarDTO.setProject_name(project_name);
		calendarDTO.setVersion_title(version_title);
		
		result = calendarService.insertCal(calendarDTO);
		
		go_calendar(project_no, project_name, model);
		

		return "redirect:/project/calendar.htm";
	}

	@RequestMapping("/dropUpdateCal.htm")
	public void dropUpdateCal(@RequestParam("calendar_no") int calendar_no,
			@RequestParam("calendar_start") String calendar_start, @RequestParam("calendar_end") String calendar_end) {

		
		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setVersion_no(calendar_no);
		calendarDTO.setVersion_start(calendar_start);
		if (calendar_end.equals("")) {
			calendarService.dropUpdateCal(calendarDTO);
		} else {
			calendarDTO.setVersion_end(calendar_end);
			calendarService.dropUpdateCal2(calendarDTO);
		}

	}

	@RequestMapping("/ajaxCalendar.htm")
	public void ajaxCalendar(int project_no ,HttpServletResponse response) {

		List<CalendarDTO> list = new ArrayList<CalendarDTO>();

		list = calendarService.ajaxCalendar(project_no);

		ObjectMapper mapper = new ObjectMapper();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/resizeCal.htm")
	public void resiseCal(@RequestParam("calendar_no") int calendar_no,
			@RequestParam("calendar_end") String calendar_end) {

		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setVersion_no(calendar_no);
		calendarDTO.setVersion_end(calendar_end);

		calendarService.resiseCal(calendarDTO);
		
		

	}

	@RequestMapping("/timeline.htm")
	public String timeline(int project_no , Model model) {
		
		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setProject_no(project_no);
		
		List<CalendarDTO> callist = new ArrayList<CalendarDTO>();
		callist = calendarService.selectCal(calendarDTO);

		for (int i = 0; i < callist.size(); i++) {
			String enddate = callist.get(i).getVersion_end();
			String strdate = callist.get(i).getVersion_start();
			
			if(enddate == null || enddate.equals("null")){

				int overDay = 0;
				callist.get(i).setVersion_end(calendarService.parse(strdate,overDay));
			}else{

				int overDay = 1;
				callist.get(i).setVersion_end(calendarService.parse(enddate,overDay));
			}		
		}
		
		
		List<Project> prolist = new ArrayList();
		prolist = projectService.selet_Project_date(project_no);
		
		
		model.addAttribute("cal_list", callist);
		model.addAttribute("pro_list", prolist);
		return "project.timeline";
	}
	
	
	@RequestMapping("/timeline2.htm")
	public void timeline2(int project_no , HttpServletResponse response) {
		
		CalendarDTO calendarDTO = new CalendarDTO();
		calendarDTO.setProject_no(project_no);
		
		List<CalendarDTO> list = new ArrayList<CalendarDTO>();
		list = calendarService.selectCal(calendarDTO);

		for (int i = 0; i < list.size(); i++) {
			String enddate = list.get(i).getVersion_end();
			String strdate = list.get(i).getVersion_start();
			
			if(enddate == null || enddate.equals("null")){
				int overDay = 0;
				list.get(i).setVersion_end(calendarService.parse(strdate,overDay));
			}else{
				int overDay = 1;
				list.get(i).setVersion_end(calendarService.parse(enddate,overDay));
			}		
		}
		
		ObjectMapper mapper = new ObjectMapper();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	@RequestMapping("/deleteCal.htm")
	public String resiseCal(@RequestParam("id") int version_no ,int project_no ,
							String project_name , Model model) {
		
		result = calendarService.deleteCal(version_no);
		
		ObjectMapper mapper = new ObjectMapper();

		go_calendar(project_no, project_name, model);
		
		return "redirect:/project/calendar.htm";		
	}
	
	
	
	
	
}
