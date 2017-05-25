package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


import DAO.UserDAO;
import DTO.Auth;
import User.DTO.Auth_info;
import User.DTO.User_info;

@Component
@Service
public class UserService {
	@Autowired
	private SqlSession sqlsession;
	

	public List<User_info> list() {

		UserDAO userDao = sqlsession.getMapper(UserDAO.class);
		List<User_info> list = userDao.getAllUser();

		return list;
	}
	
	public int joinUser(User_info user){

		UserDAO userDao = sqlsession.getMapper(UserDAO.class);
		 
		int result = userDao.joinUser(user);
		              
		return result;
	}
	
	public int authUser(Auth auth){

		UserDAO userDao = sqlsession.getMapper(UserDAO.class);
		int result = userDao.authUser(auth);
		              
		return result;
	}
	
	public int checkUser(String user_id){
		UserDAO userDao = sqlsession.getMapper(UserDAO.class);
		return userDao.userCheck(user_id);
	}
	
	public User_info getUser(String user_id) {

		UserDAO userDao = sqlsession.getMapper(UserDAO.class);
		User_info dto = userDao.getUser(user_id);

		return dto;
	}
	
}
