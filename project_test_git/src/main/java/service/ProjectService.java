package service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import DAO.ProjectDAO;
import Emp.DTO.Dept;
import Emp.DTO.EMP;
import Emp.DTO.Emp_List;
import Project.DTO.Alph_content;
import Project.DTO.Alph_title;
import Project.DTO.Board;
import Project.DTO.Mile_agile;
import Project.DTO.Mile_frame_side;
import Project.DTO.Pro_file;
import Project.DTO.Project;
import Project.DTO.Re;
import Project.DTO.Score;
import Project.DTO.createCardforeachMilestone;
import Project.DTO.createContentforeachProject;
import Project.DTO.info_alph;
import User.DTO.User_info;

@Component
@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	public void finish_agile(String list_name){
		
		 ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		 projectDAO.finish_agile(list_name);
		 
		 
		
		
	}
	
	
	public List<Pro_file> get_files_to_download(int project_no,int mile_col_no){
		 ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<Pro_file> list = new ArrayList<Pro_file>();
		Pro_file dto = new Pro_file();
		
		dto.setProject_no(project_no);
		dto.setMile_col_no(mile_col_no);
		
		list = projectDAO.get_files_to_download(dto);
		
		
		return list;
	}
	

  public String uploadFile(Pro_file dto, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
	
	  
	ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
	String uploadpath = request.getSession().getServletContext().getRealPath("resources/project_upload_file");
	
	String project_name = projectDAO.get_project_name_by_project_no(dto.getProject_no());
	
	dto.setProject_name(project_name);
	
	File dir = new File(uploadpath);
	if(!dir.isDirectory()){
		dir.mkdirs();
	}
	

	List<MultipartFile> flist = request.getFiles("file");
	
	if(flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")){
		
	}else{
		for(int i=0; i<flist.size();i++){
		
			String genId = UUID.randomUUID().toString();
			System.out.println("genId : " + genId);
			
			String orign_file = flist.get(i).getOriginalFilename();
			int file_size = (int)flist.get(i).getSize();
			String save_file = genId + "-" + orign_file;
			
			dto.setO_name(orign_file);
			dto.setFile_name(save_file);
			dto.setFile_size(file_size);
			String save_path = uploadpath +	"\\" + save_file;
			
			System.out.println(save_path);
			
			flist.get(i).transferTo(new File(save_path)); 	
			

			projectDAO.uploadFile(dto);
			
			
		}
	}
	
	return "aa";
}

	

	public int create_auth_for_project(Project dto, String user_name) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		
		
		
		String user_id = projectDAO.get_user_id_by_user_name(user_name);

		projectDAO.create_auth_for_project_auth(user_id);
		
		System.out.println("dto.getProject_no()" + dto.getProject_no());
		
		int emp_no = get_emp_no_for_emp_list(user_id);

		Emp_List emplist = new Emp_List();

		emplist.setEmp_no(emp_no);
		emplist.setProject_name(dto.getProject_name());
		emplist.setProject_no(dto.getProject_no());
		emplist.setAuth_name("ROLE_PROJECT_MANAGER");
		emplist.setUser_id(user_id);

		

		int result = projectDAO.create_auth_for_project_emp_list(emplist);

		return result;
	}

	public int get_emp_no_for_emp_list(String user_id) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		int emp_no = projectDAO.get_emp_no_for_emp_list(user_id);

		return emp_no;
	}

	public List<User_info> get_person_to_select_project_manager(String dept_name) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		int dept_no = projectDAO.get_dept_no_to_spread_at_select_tag(dept_name);

		List<EMP> emp_list = projectDAO.get_user_id_to_spread_at_select_tag(dept_no);

		List<User_info> user_list = new ArrayList<User_info>();

		for (int i = 0; i < emp_list.size(); i++) {

			user_list.add(projectDAO.get_user_info_to_spread_at_select_tag(emp_list.get(i)));
		}

		return user_list;

	}

	public List<Dept> get_all_dept_to_create_project() {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		List<Dept> dept_list = new ArrayList<Dept>();

		dept_list = projectDAO.get_all_dept_to_create_project();

		return dept_list;

	}

	public String get_col_name_after_update(int project_no, int mile_col_no) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		Mile_frame_side dto = new Mile_frame_side();

		dto.setProject_no(project_no);
		dto.setMile_col_no(mile_col_no);

		String result = projectDAO.get_col_name_after_update(dto);

		return result;
	}

	public int update_col_name(int project_no, int mile_col_no, String mile_col_name) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		Mile_frame_side dto = new Mile_frame_side();

		dto.setProject_no(project_no);
		dto.setMile_col_no(mile_col_no);
		dto.setMile_col_name(mile_col_name);

		int result = 0;

		result = projectDAO.update_col_name(dto);

		return result;

	}

	public int delete_re(int re_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		int result = projectDAO.delete_re(re_no);

		return result;

	}

	public List<Mile_agile> get_alph_loc_from_mile_agile(int project_no, String list_name) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<Mile_agile> list = new ArrayList<Mile_agile>();

		Mile_agile mile = new Mile_agile();

		mile.setList_name(list_name);
		mile.setProject_no(project_no);

		list = projectDAO.get_alph_loc_from_mile_agile(mile);

		return list;
	}

	public List<info_alph> get_alph_loc_from_info_alph(List<Mile_agile> list) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<info_alph> info_list = new ArrayList<info_alph>();
		List<info_alph> info_return = new ArrayList<info_alph>();

		System.out.println("list_size" + list.size());

		for (int i = 0; i < list.size(); i++) {
			info_list = projectDAO.get_alph_loc_from_info_alph(list.get(i));

			for (int j = 0; j < info_list.size(); j++) {
				info_list.get(j).setAlph_cate(
						projectDAO.get_alph_cate_from_alph_title_by_alph_title(info_list.get(j).getAlph_title()));

				info_return.add(info_list.get(j));

			}
			if (info_list.size() == 1) {
				continue;
			} else {
				i += info_list.size() - 1;
			}

		}

		return info_return;
	}

	public List<Mile_agile> get_agile(int project_no) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		List<Mile_agile> mile_agile = new ArrayList<Mile_agile>();

		mile_agile = projectDAO.get_agile(project_no);

		return mile_agile;
	}

	public void updateagile(String mile_col_no, int project_no, String list_name) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		info_alph param = new info_alph();
		List<info_alph> result = new ArrayList<info_alph>();

		List<Mile_agile> mile_agile = new ArrayList<Mile_agile>();
		List list = new ArrayList();
		String[] string = mile_col_no.split(",");

		for (int i = 0; i < string.length; i++) {

			list.add(string[i]);
		}

		param.setProject_no(project_no);

		for (int i = 0; i < list.size(); i++) {
			param.setCol_no(Integer.parseInt((String) list.get(i)));

			result = projectDAO.callinfo_alph_foragigle(param);

			for (int j = 0; j < result.size(); j++) {
				result.get(j).setList_name(list_name);
				result.get(j).setProject_no(project_no);
				projectDAO.create_agile(result.get(j));
			}
		}

		mile_agile = projectDAO.get_agile(project_no);

	}

	/*
	 * 마일스톤 생성할 때 열의 숫자를 선택해서 해당하는 곳으로 이동~
	 */
	public void select_Col_to_create_milestone(Project project, int mile_col_selection) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		Mile_frame_side dto = new Mile_frame_side();

		dto.setProject_no(project.getProject_no());
		dto.setProject_name(project.getProject_name());

		for (int i = 0; i < mile_col_selection; i++) {
			dto.setMile_col_no(i + 1);

			projectDAO.select_Col_to_create_milestone(dto);
		}

	}

	// 생성된 마일스톤의 열 숫자를 가져오기~
	public List<Mile_frame_side> get_Col_count_from_Mile_frame_side(int project_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<Mile_frame_side> list = new ArrayList<Mile_frame_side>();

		list = projectDAO.get_Col_count_from_Mile_frame_side(project_no);

		return list;
	}

	public List<Alph_title> milestone_score(int project_no, int col_no) {

		List<Alph_title> list = new ArrayList<Alph_title>();

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		list = projectDAO.callAllcard();
		info_alph info_alph = new info_alph();

		List<Score> score = new ArrayList<Score>();

		for (int i = 0; i < list.size(); i++) {

			info_alph.setAlph_title(list.get(i).getAlph_title());
			info_alph.setProject_no(project_no);
			info_alph.setCol_no(col_no);

			list.get(i).setAlph_loc(projectDAO.callinfo_alph_forscore(info_alph));
			list.get(i).setAlph_total(projectDAO.calltotal_score(info_alph));

		}

		return list;
	}

	public List<Project> getAllProject() {

		List<Project> list = new ArrayList<Project>();
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		list = projectDAO.getAllProject();

		return list;
	}

	public void updatescore(ArrayList score, ArrayList alph_content_no, int project_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		Score score_dto = new Score();

		for (int i = 0; i < score.size(); i++) {
			score_dto.setAlph_score(Integer.parseInt((String) score.get(i)));
			score_dto.setAlph_content_no(Integer.parseInt((String) alph_content_no.get(i)));
			score_dto.setProject_no(project_no);

			projectDAO.updatescore(score_dto);
		}

	}

	public Project createproject(Project project) {

		Project getprono = new Project();
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		projectDAO.createProject(project);

		getprono = projectDAO.getProjectno(project);

		List<Alph_title> list = new ArrayList<Alph_title>();

		list = projectDAO.callAllcard_create();

		createCardforeachMilestone vo = new createCardforeachMilestone();

		for (int i = 0; i < list.size(); i++) {

			vo.setProject_no(getprono.getProject_no());
			vo.setAlph_title(list.get(i).getAlph_title());

			projectDAO.createCardforeachMilestone(vo);
		}

		return getprono;

	}

	public String createContentforeachProject(Project project) {
		
		Project getprono = new Project();
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		getprono = projectDAO.getProjectno(project);
		List<Alph_content> content = projectDAO.callallcardcontent();

		createContentforeachProject vo2 = new createContentforeachProject();

		for (int j = 0; j < content.size(); j++) {

			vo2.setProject_no(getprono.getProject_no());
			vo2.setAlph_title(content.get(j).getAlph_title());
			vo2.setAlph_content_no(content.get(j).getAlph_content_no());

			projectDAO.createContentforeachProject(vo2);
		}

		return "redirect:manageproject.htm";
		
	}

	public void updatescore_total(String alph_title, int project_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		info_alph info = new info_alph();

		info.setAlph_title(alph_title);
		info.setProject_no(project_no);

		projectDAO.updatescore_total(info);
	}

	public List<Alph_title> callAllcard(int project_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		List<Alph_title> list = new ArrayList<Alph_title>();

		info_alph info = new info_alph();
		List<info_alph> loc = new ArrayList<info_alph>();

		list = projectDAO.callAllcard();

		for (int i = 0; i < list.size(); i++) {

			info.setAlph_title((String) list.get(i).getAlph_title());
			info.setProject_no(project_no);

			list.get(i).setAlph_loc(projectDAO.callinfo_alph(info));
			/*
			 * list.get(i).setAlph_loc(projectDAO.callinfo_alph((String)list.get
			 * (i).getAlph_title()));
			 */

		}

		return list;
	}

	public String insertmemo(Board board , Principal principal) {
		System.out.println(board.getProject_no());
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
        board.setUser_id(principal.getName());
		projectDAO.insertmemo(board);

		return "redirect:/project/drag3.htm";
	}

	public int updatecard(String alph_title, String alph_loc) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		Alph_title alph = new Alph_title();

		int result = 0;

		List list = new ArrayList();

		String[] string = alph_title.split(",");

		for (int i = 0; i < string.length; i++) {
			list.add(string[i]);
		}

		for (int i = 0; i < list.size(); i++) {
			alph.setAlph_loc(alph_loc);
			alph.setAlph_title((String) list.get(i));

			result = projectDAO.updatecard(alph);

		}

		return result;

	}

	public int insertre(String re_content, String board_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		Re re = new Re();

		re.setBoard_no(Integer.parseInt(board_no));

		re.setRe_content(re_content);

		int result = projectDAO.insertre(re);

		return result;

	}

	public List<Board> list() {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<Board> list = projectDAO.getAllBoard();

		return list;
	}

	public List<Mile_frame_side> get_col_name_to_edit(int project_no) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<Mile_frame_side> list = new ArrayList<Mile_frame_side>();

		list = projectDAO.get_col_name_to_edit(project_no);

		return list;

	}

	public List<Board> list(Mile_agile mile_agile) {

		List<Board> list = new ArrayList<Board>();
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		list = projectDAO.getAllBoard_by_mile_agile(mile_agile);

		return list;
	}

	public int delete_board(int board_no) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		projectDAO.delete_board_re(board_no);
		int result = projectDAO.delete_board(board_no);

		System.out.println("결과 " + result);

		return result;

	}

	public int updateorder(Board board) {
		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		int result = projectDAO.updateorder(board);

		return result;

	}

	public Board getmemo(int board_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		Board board = projectDAO.getmemo(board_no);

		return board;

	}

	public List<Re> getrememo(int board_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);

		List<Re> list = new ArrayList<Re>();
		list = projectDAO.getrememo(board_no);

		return list;

	}

	public List<Alph_content> callcard(String alph_title, int project_no) {

		ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
		List<Alph_content> alph_content = new ArrayList<Alph_content>();
		Score score = new Score();
		alph_content = projectDAO.callcard(alph_title);
		score.setProject_no(project_no);

		for (int i = 0; i < alph_content.size(); i++) {
			score.setAlph_content_no(alph_content.get(i).getAlph_content_no());
			int get_score = projectDAO.callscore(score);

			alph_content.get(i).setalph_score(get_score);

		}

		return alph_content;

	}
	
	//2016.06.22
			public int insert_board_state(Board board , Principal principal){
				board.setUser_id(principal.getName());
				ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
				int result = projectDAO.insert_board_state(board);
				return result;
			}
			
			
			public String update_board_state(Board board){
				ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
				projectDAO.update_board_state(board);
				return "redirect:/project/drag3.htm";
			}

			
			public int update_board_end(Board board){
				ProjectDAO projectDAO = sqlsession.getMapper(ProjectDAO.class);
				int result = projectDAO.update_board_end(board);
				return result;
			}
			
			//프로젝트명 중복확인 유효성 
			public int project_name(String check) {
				ProjectDAO projectDao = sqlsession.getMapper(ProjectDAO.class);
				return projectDao.project_name(check);
			}
			
			//프로젝트 기간 가져오기
			public List<Project> selet_Project_date(int project_no){
				ProjectDAO projectDao = sqlsession.getMapper(ProjectDAO.class);		
				List<Project> list = projectDao.selet_Project_date(project_no);
				return list;
			}


		

}
