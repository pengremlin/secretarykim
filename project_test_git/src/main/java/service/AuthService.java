package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.AuthDAO;
import DTO.Auth;
import Emp.DTO.Dept;
import Emp.DTO.Emp_List;
import Project.DTO.Project;
import User.DTO.User_info;

@Component
@Service
public class AuthService {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public int give_auth(int project_no,String user_id,String project_name){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		Emp_List dto = new Emp_List();
		
		
		
		
		dto.setProject_no(project_no);
		dto.setUser_id(user_id);
		dto.setProject_name(project_name);
		int emp_no = authdao.get_emp_no(user_id);
		
		dto.setEmp_no(emp_no);
		
		
		
		authdao.give_auth_auth(dto);
		
		
		
		int result = authdao.give_auth_emp_list(dto);
		
		
		
		
		
		
		return result;
	}
	
	
	public List<Project> get_project_for_give_auth(){
		
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		List<Project> project_list = authdao.get_project_for_give_auth();
		
		return project_list;
		
	}
	
	
	public List<User_info> get_all_emp_list(){
		
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		List<User_info> User_info = authdao.get_all_emp_list();
		
		return User_info;
		
	}
	
	public List<Dept> get_all_dept(){
		
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		
		List<Dept> dept_list = authdao.get_all_dept();
		
		
		
		return dept_list;
		
	}
	//
	
	public List<Auth> absoluteAllauth(){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		List<Auth> list= authdao.absoluteAllauth();
		return list;
	}
	
	public String regAuth(Auth auth){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		authdao.regAuth(auth);
		return "redirect:editForm.htm";
	}
	
	public List<Auth> projectAllauth(){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		List<Auth> list = authdao.projectAllauth();
		return list;
	}
	
	public List<Auth> projectsubAllauth(){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		List<Auth> list = authdao.projectsubAllauth();
		return list;
	}
	
	public List<Auth> projectGetauth(String user_id){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		List<Auth> list = authdao.projectGetauth(user_id);
		return list;
	}
	
	public int projectSubmit(Auth auth){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
		int list = authdao.projectSumbit(auth);
		return list;
	}
	
	
	public String delAuth(Auth auth){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
	    authdao.delAuth(auth);
		return "redirect:/auth/authWriteForm.htm";
	}
	
	public String del1Auth(Auth auth){
		AuthDAO authdao = sqlsession.getMapper(AuthDAO.class);
	    authdao.delAuth(auth);
		return "redirect:/emp/emplistForm.htm";
	}

}
