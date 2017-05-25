package DAO;

import java.util.List;

import Emp.DTO.Job;

public interface JobDAO {
    //모든 job 리스트
    List<Job> getJob();
    
    //modal 에 띄울 job생성 리스트
    Job userJob(String job_name);
    
    int submitJob(Job job);
    
    int JobReg(Job job);
}
