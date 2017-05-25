package DAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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



public interface ProjectDAO {	
	List<Project> getAllProject();
	int insertProject(Project project);
	int delInven(int project_no);
	Project getProject(int project_no);
	int updateProject(Project project) throws ClassNotFoundException,SQLException;
	int insertmemo(Board board);
	List<Board> getAllBoard();
	List<Board> getAllBoard_by_mile_agile(Mile_agile mile_agile);	
	int updateorder(Board board);
	Board getmemo(int board_no);
	List<Re> getrememo(int board_no);
	int insertre(Re re);	
	List<Alph_content> callallcardcontent();
	List<Alph_content> callcard(String alph_title);
	List<Alph_title> callAllcard();
	List<Alph_title> callAllcard_create();
	List<Mile_agile> updateagile(ArrayList mile_col_no, int project_no,String list_name);	
	String callinfo_alph(info_alph info_alph);	
	String  callinfo_alph_forscore(info_alph info_alph);
	int calltotal_score(info_alph info_alph);	
	List<info_alph> callinfo_alph_foragigle(info_alph info_alph);
	int create_agile(info_alph info_alph);
	List<Mile_agile> get_agile(int project_no);
	List<Mile_agile> get_alph_loc_from_mile_agile(Mile_agile mile);		
	int callscore(Score score);
	int updatecard(Alph_title alph_title);
	int updatescore(Score score);
	int updatescore_total(info_alph info);	
	int createProject(Project project);	
	Project getProjectno(Project project);
	int createCardforeachMilestone(createCardforeachMilestone cardforeachMilestone);
	int createContentforeachProject(createContentforeachProject createcontentforeachProject);	
	int select_Col_to_create_milestone(Mile_frame_side mile_frame_side);
	List<Mile_frame_side> get_Col_count_from_Mile_frame_side(int project_no);
	List<info_alph> get_alph_loc_from_info_alph(Mile_agile mile_agile);	
	String get_alph_cate_from_alph_title_by_alph_title(String alph_title);
	int delete_re(int re_no);
	
	int delete_board(int board_no);
	int delete_board_re(int board_no);
	List<Mile_frame_side> get_col_name_to_edit(int project_no);
	int update_col_name(Mile_frame_side mile_frame_side);
	String get_col_name_after_update(Mile_frame_side mile_frame_side);
	
	int get_dept_no_to_spread_at_select_tag(String dept_name);
	List<EMP> get_user_id_to_spread_at_select_tag(int dept_no);
	User_info get_user_info_to_spread_at_select_tag(EMP emp);
	
	List<Dept> get_all_dept_to_create_project();

	int create_auth_for_project_auth(String user_id);
	int get_emp_no_for_emp_list(String user_id);
	int create_auth_for_project_emp_list(Emp_List list);
	
	//board state값 1과 board end(프로젝트 완료)값 컬럼에 넣는 함수
		int insert_board_state(Board board);
		int update_board_state(Board board);
		int update_board_end(Board board);
	//유효성
		int project_name(String check); //프로젝트생성 이름 중복확인
		
		List<Project> selet_Project_date(int project_no);
		
		
		int uploadFile(Pro_file dto);
		String get_project_name_by_project_no(int project_no);
		List<Pro_file> get_files_to_download(Pro_file dto);
		
		
		int finish_agile(String list_name);
		
		String get_user_id_by_user_name(String user_name);
		
		
}
