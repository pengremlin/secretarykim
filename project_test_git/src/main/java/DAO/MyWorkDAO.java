package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import DTO.MyWork;

public interface MyWorkDAO {
	
	public List<MyWork> getWork(@Param("user_id")String user_id) throws ClassNotFoundException, SQLException;
	public int insertWork(MyWork mywork) throws ClassNotFoundException, SQLException;
	public int deleteWork(int work_num) throws ClassNotFoundException, SQLException;
	

}
