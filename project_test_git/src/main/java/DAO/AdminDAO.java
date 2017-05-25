package DAO;

import java.util.List;

import DTO.Auth;
import User.DTO.User_info;


public interface AdminDAO {
     
	//회사 관리자 신청 리스트
	List<User_info> getAllauth();
	
	//모달로 띄워줄 신정차 정보
	User_info getUser(String user_id);
	
	//회사 관리자 등록 리스트
	int setAuth(Auth auth);
	
	//신청 됨과 동시에(ROLE_WATTING)권한부여 state 값을 1로 전환
	int setState(String user_id);
}
