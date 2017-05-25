package DAO;

import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.List;

import Project.DTO.Lean;
import Project.DTO.Project;

public interface LeanDAO {
	
	int insert_Lean(Lean leanCanvas) throws ClassNotFoundException,SQLException ;
	int update_Lean(Lean leanCanvas)throws ClassNotFoundException,SQLException ;
	List<Lean> select_Lean(int project_no)throws ClassNotFoundException,SQLException ;
	int deletelean(Lean leanCanvas) throws ClassNotFoundException,SQLException ;
	List<Project> getProject_info(int project_no)throws ClassNotFoundException,SQLException ;

}
