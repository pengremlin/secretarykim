package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;

import Emp.DTO.Dept;
import Project.DTO.Alph_content;
import Project.DTO.Alph_title;
import Project.DTO.Board;
import Project.DTO.Mile_agile;
import Project.DTO.Mile_frame_side;
import Project.DTO.Pro_file;
import Project.DTO.Project;
import Project.DTO.Re;
import Project.DTO.Score;
import Project.DTO.info_alph;
import User.DTO.User_info;
import service.CalendarService;
import service.ProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private CalendarService calendarService;

	@RequestMapping("/form.htm")
	public String upload() {

		return "project.form";
	}

		
	@RequestMapping(value="/uploadpro_File.htm", method=RequestMethod.POST)
	public String fileReg(Pro_file dto, MultipartHttpServletRequest request) throws IllegalStateException, IOException{
	
		
		
		projectService.uploadFile(dto, request);
		
		return "redirect:milestone.htm?project_no="+dto.getProject_no();
	}
	
	
	
	
	
	
	@RequestMapping(value="/get_files_to_download.htm", method=RequestMethod.POST)
	public void get_files_to_download(@RequestParam("project_no") int project_no,
			@RequestParam("mile_col_no") int mile_col_no,
			HttpServletResponse response) throws IllegalStateException, IOException{
	
		List<Pro_file> list = new ArrayList<Pro_file>();
		list = projectService.get_files_to_download(project_no, mile_col_no);
		
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
		@RequestMapping(value="downloadFile.htm")
		public void downFile(HttpServletRequest request, HttpServletResponse response) throws Exception{
	     
	      
	      String save_name = request.getParameter("save_name"); 
	      
	      String orign_name = request.getParameter("orign_name"); 
	      
	      String path = request.getServletContext().getRealPath("resources/project_upload_file");
	      
	      String fullPath = path+"\\"+save_name;
	      
	      File downloadFile = new File(fullPath);
	      
	      response.setContentLength((int)downloadFile.length());
	      
	      response.setContentType("application/octet-stream; charset=utf-8");
	      
	      response.setHeader("Content-Disposition", "attachment;filename="
	                              + new String(orign_name.getBytes(), "ISO8859_1"));
	      
	      response.setHeader("Content-Transfer-Encoding","binary");
	      
	      FileInputStream fin = new FileInputStream(downloadFile);
	      
	      ServletOutputStream sout = response.getOutputStream();

	      byte[] buf = new byte[1024];
	      
	      int size = -1;

	      while ((size = fin.read(buf, 0, buf.length)) != -1) {
	         sout.write(buf, 0, size);
	      }
	      fin.close();
	      sout.close();
	   }

	
	@RequestMapping("/get_person_to_select_project_manager.htm")
	public void get_person_to_select_project_manager(@RequestParam("dept_name") String dept_name,
			HttpServletResponse response) {

		List<User_info> user_list = new ArrayList<User_info>();

		user_list = projectService.get_person_to_select_project_manager(dept_name);

		ObjectMapper mapper = new ObjectMapper();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(user_list));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/update_col_name.htm")
	public void update_col_name(@RequestParam("project_no") int project_no,
			@RequestParam("mile_col_no") int mile_col_no, @RequestParam("mile_col_name") String mile_col_name,
			HttpServletResponse response) {

		int result = projectService.update_col_name(project_no, mile_col_no, mile_col_name);

		String mile_col_name_result = projectService.get_col_name_after_update(project_no, mile_col_no);

		ObjectMapper mapper = new ObjectMapper();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(mile_col_name_result));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping("/insertmemo.htm")
	public String write(Board board, Principal principal ,RedirectAttributes redirectAttributes) {

		redirectAttributes.addAttribute("project_no", board.getProject_no());
		redirectAttributes.addAttribute("list_name", board.getList_name());

		return projectService.insertmemo(board,principal);
	}

	@RequestMapping("/manageproject.htm")
	public String manageproject(Model model) throws Exception{

		List<Project> list = new ArrayList<Project>();		
		list = projectService.getAllProject();
		list = calendarService.project_completion(list);

		
		model.addAttribute("list", list);

		return "project.manage_project";
	}

	
	@RequestMapping("/tocreateproject.htm")
	public String tocreateProject(Model model) {

		List<Dept> dept_list = new ArrayList<Dept>();

		dept_list = projectService.get_all_dept_to_create_project();

		model.addAttribute("dept_list", dept_list);

		return "project.createproject";
	}

	@Transactional
	@RequestMapping("/createproject.htm")
	public String createProject(Project project, @RequestParam("mile_col_selection") int mile_col_selection) {

		Project dto = new Project();
		
		dto = projectService.createproject(project);

		project.setProject_no(dto.getProject_no());
		
		projectService.select_Col_to_create_milestone(project, mile_col_selection);

		projectService.create_auth_for_project(dto, project.getUser_name());

		return projectService.createContentforeachProject(project);
	}

	@RequestMapping("/drag3.htm")
	public String drag3(int project_no, String list_name, Model model) {

		List<Mile_agile> list = new ArrayList<Mile_agile>();

		list = projectService.get_alph_loc_from_mile_agile(project_no, list_name);

		List<info_alph> info_list = new ArrayList<info_alph>();

		info_list = projectService.get_alph_loc_from_info_alph(list);

		if (list != null) {
			List<Board> board_list = projectService.list(list.get(0));
			model.addAttribute("board_list", board_list);
		}

		model.addAttribute("project_no", project_no);
		model.addAttribute("list", list);
		model.addAttribute("info_list", info_list);

		return "project.drag3";
	}
	
	@RequestMapping("/drag4.htm")
	public String drag4(int project_no, String list_name, Model model) {

		List<Mile_agile> list = new ArrayList<Mile_agile>();

		list = projectService.get_alph_loc_from_mile_agile(project_no, list_name);

		List<info_alph> info_list = new ArrayList<info_alph>();

		info_list = projectService.get_alph_loc_from_info_alph(list);

		if (list != null) {
			List<Board> board_list = projectService.list(list.get(0));
			model.addAttribute("board_list", board_list);
		}

		model.addAttribute("project_no", project_no);
		model.addAttribute("list", list);
		model.addAttribute("info_list", info_list);

		return "project.drag4";
	}


	@RequestMapping("/milestone.htm")
	public String milestone(@RequestParam("project_no") int project_no, Model model) {

		List<Alph_title> list = new ArrayList<Alph_title>();

		list = projectService.callAllcard(project_no);

		List<Mile_frame_side> mile_frame_list = new ArrayList<Mile_frame_side>();
		// 마일스톤 열 수 를 가져와라!
		mile_frame_list = projectService.get_Col_count_from_Mile_frame_side(project_no);

		List<Mile_agile> mile_agile = new ArrayList<Mile_agile>();

		mile_agile = projectService.get_agile(project_no);

		if (mile_agile.size() != 0) {

			model.addAttribute("mile_agile", mile_agile);
		}

		model.addAttribute("mile_frame_list", mile_frame_list);
		model.addAttribute("alph_title", list);
		model.addAttribute("project_no", project_no);

		return "project.milestone" + mile_frame_list.size();
	}

	@RequestMapping("/milestone_score.htm")
	public String milestone_score(@RequestParam("project_no") int project_no, @RequestParam("col_no") int col_no,
			Model model) {

		List<Alph_title> list = new ArrayList<Alph_title>();

		
		list = projectService.milestone_score(project_no, col_no);

		model.addAttribute("list", list);
		model.addAttribute("project_no", project_no);

		return "project.milestone_score";
	}

	@RequestMapping(value = "updatemilestone.htm", method = RequestMethod.POST)
	public void updatecard(@RequestParam("alph_loc") String alph_loc, @RequestParam("alph_title") String alph_title,
			HttpServletResponse response) throws ClassNotFoundException, SQLException {

		
		projectService.updatecard(alph_title, alph_loc);

	}

	@RequestMapping(value = "updatescore.htm", method = RequestMethod.POST)
	public void updatescore(@RequestParam("score") ArrayList score,
			@RequestParam("alph_content_no") ArrayList alph_content_no, @RequestParam("project_no") int project_no,
			@RequestParam("alph_title") String alph_title, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {

		projectService.updatescore(score, alph_content_no, project_no);

		projectService.updatescore_total(alph_title, project_no);

	}

	@RequestMapping(value = "updateagile.htm", method = RequestMethod.POST)
	public void updateagile(@RequestParam("mile_col_no") String mile_col_no, @RequestParam("project_no") int project_no,
			@RequestParam("list_name") String list_name, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {

		info_alph info_alph = new info_alph();

		info_alph.setList_name(list_name);

		projectService.updateagile(mile_col_no, project_no, list_name);

	}

	@RequestMapping(value = "getmemo.htm", method = RequestMethod.POST)
	public void getmemo(@RequestParam("board_no") String board_no, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {
		Board board = new Board();

		
		board = projectService.getmemo(Integer.parseInt(board_no));

		List<Re> re_list = new ArrayList<Re>();
		
		re_list = projectService.getrememo(Integer.parseInt(board_no));

		List list = new ArrayList();

		list.add(0, board);
		list.add(1, re_list);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "finish_agile.htm", method = RequestMethod.POST)
	public void finish_agile(@RequestParam("list_name") String list_name, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {
		
		
		projectService.finish_agile(list_name);
		
		
	}
	
	

	@RequestMapping(value = "get_col_name_to_edit.htm", method = RequestMethod.POST)
	public void get_col_name_to_edit(@RequestParam("project_no") int project_no, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {
		ObjectMapper mapper = new ObjectMapper();

		List<Mile_frame_side> list = new ArrayList<Mile_frame_side>();
		list = projectService.get_col_name_to_edit(project_no);

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = " delete_board.htm", method = RequestMethod.POST)
	public void delete_board(@RequestParam("board_no") int board_no, HttpServletResponse response)
			throws ClassNotFoundException, SQLException {
		int result = projectService.delete_board(board_no);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	@RequestMapping(value = "insertre.htm", method = RequestMethod.POST)
	public void insertre(@RequestParam("re_content") String re_content, @RequestParam("board_no") String board_no,
			HttpServletResponse response) throws ClassNotFoundException, SQLException {

		int result = projectService.insertre(re_content, board_no);

		List<Re> re_list = new ArrayList<Re>();
		
		re_list = projectService.getrememo(Integer.parseInt(board_no));

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(re_list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 애자일 메모 리플 제거
	@RequestMapping(value = "deletere.htm", method = RequestMethod.POST)
	public void insertre(@RequestParam("re_no") int re_no, @RequestParam("board_no") int board_no,
			HttpServletResponse response) throws ClassNotFoundException, SQLException {

		
		projectService.delete_re(re_no);

		List<Re> re_list = new ArrayList<Re>();
		re_list = projectService.getrememo(board_no);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(re_list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "updateorder.htm", method = RequestMethod.POST)
	public void updateorder( String data,String list_no)throws ClassNotFoundException, SQLException {

		List list = new ArrayList();

		String[] string = data.split(",");

		for (int i = 0; i < string.length; i++) {
			list.add(string[i]);
		}

		Board board = new Board();

		for (int i = 0; i < list.size(); i++) {
			board.setBoard_no(Integer.parseInt((String) list.get(i)));
			board.setBoard_order(i);
			if (list_no.equals("todo")) {
				board.setList_no(1);
			} else if (list_no.equals("inprogress")) {

				board.setList_no(2);
			} else if (list_no.equals("completed")) {
				board.setList_no(3);
			}
			projectService.updateorder(board);
		}

	}

	@RequestMapping(value = "callcard.htm", method = RequestMethod.POST)
	public void callcard(@RequestParam("alph_title") String alph_title, @RequestParam("project_no") int project_no,
			HttpServletResponse response) throws ClassNotFoundException, SQLException {

		List<Alph_content> alpha_content = new ArrayList<Alph_content>();

		alpha_content = projectService.callcard(alph_title, project_no);

		ObjectMapper mapper = new ObjectMapper();

		try {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(mapper.writeValueAsString(alpha_content));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="complete.htm" , method = RequestMethod.POST)
	public String complete(RedirectAttributes redirectAttributes,Board board ,HttpServletResponse res)
			throws ClassNotFoundException, SQLException {
		
		redirectAttributes.addAttribute("project_no", board.getProject_no());
		redirectAttributes.addAttribute("list_name", board.getList_name());
		return projectService.update_board_state(board);
		
	}
	
	//프로젝트이름 중복 유효성 
		@RequestMapping(value="/project_name_check.htm" , method=RequestMethod.POST)
		public void project_name(@RequestParam("project_name") String check, HttpServletResponse response){
			System.out.println("project_name Controller Ÿ��");
			
	   		int project_name=0;
	   		
	   		project_name=projectService.project_name(check);
	   		
			PrintWriter writer = null;
			
			try{
				writer = response.getWriter();
				writer.write(project_name + "");
				writer.flush();
			} catch(IOException e){
				throw new RuntimeException(e.getMessage() , e);
			}
			finally{
				if(writer !=null){
					writer.close();
					
				}
			}
		}
		
		//버전 프로젝트 기간 가져오기
		@RequestMapping("/selet_Project_date.htm")
		public void selet_Project_date(int project_no ,HttpServletResponse response){
			System.out.println(project_no);
			List<Project> list = new ArrayList();
			list = projectService.selet_Project_date(project_no);
			
			
			ObjectMapper mapper = new ObjectMapper();

			try {
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(mapper.writeValueAsString(list));
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}

}