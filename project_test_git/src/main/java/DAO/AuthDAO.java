package DAO;

import java.util.List;

import DTO.Auth;
import Emp.DTO.Dept;
import Emp.DTO.Emp_List;
import Project.DTO.Project;
import User.DTO.User_info;

public interface AuthDAO {
	int get_emp_no(String user_id);
	int give_auth_auth(Emp_List dto);
	int give_auth_emp_list(Emp_List dto);
	String regsubAuth();
	int delAuth(Auth auth);
	List<Project> get_project_for_give_auth();
	
	List<User_info> get_all_emp_list();
	
	//처음에 뿌려주는 권한리스트
	List<Auth> absoluteAllauth();
	
	//권한 넣어주는 함수
	int regAuth(Auth auth);
	
	//권한중에 project관련 권한리스트
	List<Auth> projectAllauth();
	
	//권한중에 project sub권한 관련 리스트
	List<Auth> projectsubAllauth();
	
	//해당 아이디의 프로젝트 권한을 읽어오는 함수
	List<Auth> projectGetauth(String user_id);
	
	//프로젝트 권한 부여 함수
	int projectSumbit(Auth auth);
	
	List<Dept> get_all_dept();
	

}
