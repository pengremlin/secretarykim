package service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.CompDAO;
import DAO.EmailDAO;
import DTO.Auth;
import Emp.DTO.Comp;
import Emp.DTO.EMP;
import Emp.DTO.Job;

@Component
@Service
public class CompService {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public int jobComp(Job job){
		CompDAO compdao = sqlsession.getMapper(CompDAO.class);
		int result= compdao.jobComp(job);
		return result;
	}
	
	public int empComp(EMP emp){
		CompDAO compdao = sqlsession.getMapper(CompDAO.class);
		int result= compdao.empComp(emp);
		return result;
	}
	
	public int authComp(Auth auth){
		CompDAO compdao = sqlsession.getMapper(CompDAO.class);
		int result= compdao.authComp(auth);
		return result;
	}
}
