package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import DTO.Auth;
import User.DTO.User_info;




public interface UserDAO {
	
	List<User_info> getAllUser();
	int insertUser(User_info user_no);
	int delUser(int user_no);
	User_info getUser(String user_id);
	int updateUser(User_info user) throws ClassNotFoundException,SQLException;
	int joinUser(User_info user);
	int authUser(Auth auth);
    User_info editUser(String user_id);
    User_info idSearch(@Param("user_name")String user_name, @Param("user_email")String user_email);
    User_info pwdSearch(@Param("user_id")String user_id, @Param("user_email")String user_email);
    int userCheck(String user_id);
}
