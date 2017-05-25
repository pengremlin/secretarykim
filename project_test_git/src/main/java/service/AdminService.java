package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.AdminDAO;
import DTO.Auth;
import User.DTO.User_info;

@Component
@Service
public class AdminService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public List<User_info> masterlist(){
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		List<User_info> list = admindao.getAllauth();
		return list;
	}
	
	public User_info getUser(String user_id){
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		User_info user = admindao.getUser(user_id);
		return user;
	}
	
	
	public int setAuth(Auth auth){
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		auth.setUser_id(auth.getUser_id());
		int result = admindao.setAuth(auth);
		return result;
	}
	
	public int setState(String user_id){
		AdminDAO admindao = sqlsession.getMapper(AdminDAO.class);
		int result =admindao.setState(user_id);
		return result;
	}
	
	
}
