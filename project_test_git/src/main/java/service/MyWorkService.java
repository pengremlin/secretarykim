package service;


import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.MyWorkDAO;
import DTO.MyWork;


@Service
public class MyWorkService {

	@Autowired
	private SqlSession sqlSession;

	
	
	// 할일 리스트
	public List<MyWork> getWork(Principal user_id) throws ClassNotFoundException, SQLException {

		MyWorkDAO myworkDao = sqlSession.getMapper(MyWorkDAO.class);
		List<MyWork> list = myworkDao.getWork(user_id.getName());
		
		return list;
	}
	
	// 할일 추가
	public String insertWork(MyWork mywork) 
			throws ClassNotFoundException, SQLException{
			
		MyWorkDAO myworkDao = sqlSession.getMapper(MyWorkDAO.class);
		myworkDao.insertWork(mywork);

		return "redirect:mypage.htm";
		
		
	}
	

	// 할일 삭제
	public String deleteWork(int work_num) throws ClassNotFoundException, SQLException {

		MyWorkDAO myworkDao = sqlSession.getMapper(MyWorkDAO.class);
		myworkDao.deleteWork(work_num);

		return "redirect:mypage.htm";
	}
	
	

}
