package service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.LeanDAO;
import Project.DTO.Board;
import Project.DTO.Lean;
import Project.DTO.Project;

@Component
@Service
public class LeanService {
	
	@Autowired
	private SqlSession sqlsession;
	
	int result = 0;
	
	public int insert_Lean(Lean leanCanvas){
		
		LeanDAO lean = sqlsession.getMapper(LeanDAO.class);
		try {
			leanCanvas.setProject_no(leanCanvas.getProject_no());
			leanCanvas.setProject_name(leanCanvas.getProject_name());
			result = lean.insert_Lean(leanCanvas);
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return result;
	}
	public int update_Lean(String data ,String lean_order){
		  
 	
    	List list = new ArrayList();
    	
    	String[] string = data.split(",");
        for(int i = 0; i < string.length;i++){
        	list.add(string[i]);
        }
        
        Lean leanCanvas = new Lean();
        
       
        for(int i = 0; i<list.size();i++){
        	leanCanvas.setLean_no(Integer.parseInt((String) list.get(i)));
        	leanCanvas.setLean_order(i);
        	if(lean_order.equals("problem")){
        		leanCanvas.setLean_order(1);
	    	}else if(lean_order.equals("solution")){
	    		leanCanvas.setLean_order(2);
	    	} else if(lean_order.equals("unique")){
	    		leanCanvas.setLean_order(3);
	    	} else if(lean_order.equals("unfair")){
	    		leanCanvas.setLean_order(4);
	    	} else if(lean_order.equals("customer")){
	    		leanCanvas.setLean_order(5);
	    	} else if(lean_order.equals("key")){
	    		leanCanvas.setLean_order(6);
	    	} else if(lean_order.equals("cost")){
	    		leanCanvas.setLean_order(8);
	    	} else if(lean_order.equals("channels")){
	    		leanCanvas.setLean_order(7);
	    	} else if(lean_order.equals("revenue")){
	    		leanCanvas.setLean_order(9);
	    	}
        	
        	LeanDAO lean = sqlsession.getMapper(LeanDAO.class);
        	try {
        		result = lean.update_Lean(leanCanvas);
			} catch (Exception e) {
				e.printStackTrace();
			}
        	 
        }
        return result;
		
	};
	public List<Lean> select_Lean(int project_no){
		
		LeanDAO lean = sqlsession.getMapper(LeanDAO.class);
		List<Lean> list = new ArrayList<Lean>();
		try {
			
			list = lean.select_Lean(project_no);
			
		}  catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
	}
	public int deletelean(int lean_no) {

		LeanDAO lean = sqlsession.getMapper(LeanDAO.class);
		Lean leanCanvas = new Lean();
		leanCanvas.setLean_no(lean_no);
		try {
			result = lean.deletelean(leanCanvas);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return result;
	};
	
	
	public List<Project> getProject_info(int project_no){
		
		LeanDAO lean = sqlsession.getMapper(LeanDAO.class);
		List<Project> list = new ArrayList<Project>();
		try {
			list = lean.getProject_info(project_no);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;

	}
	
	


}
