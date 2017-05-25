package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.EMPDAO;
import DAO.JobDAO;
import Emp.DTO.Job;

@Component
@Service
public class JobService {
   
	@Autowired
	private SqlSession sqlsession;
	
	public List<Job> job(){
		JobDAO jobDao = sqlsession.getMapper(JobDAO.class);
		List<Job> dto = jobDao.getJob();
		return dto;
	};
	
	public Job userJob(String job_name){
		JobDAO jobDao = sqlsession.getMapper(JobDAO.class);
		Job dto = jobDao.userJob(job_name);
		return dto;
	};
	
	public int submitJob(Job job){
		JobDAO jobDao = sqlsession.getMapper(JobDAO.class);
		int result = jobDao.submitJob(job);
		return result;
	}
	
	public int JobReg(Job job){
		JobDAO jobDao = sqlsession.getMapper(JobDAO.class);
		int result = jobDao.JobReg(job);
		return result;
	}
}
