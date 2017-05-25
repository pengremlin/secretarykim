package service;

import java.security.Principal;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import DAO.EmailDAO;
import DTO.Auth;
import Emp.DTO.Comp;
import Emp.DTO.Dept;
import Emp.DTO.EMP;
import Emp.DTO.Job;


@Component
@Service
public class EmailService {
    
	@Autowired
	private SqlSession sqlsession;
	
	
	public int emailComp(Comp comp){
		EmailDAO emaildao = sqlsession.getMapper(EmailDAO.class);
		int result= emaildao.emailComp(comp);
		return result;
	}
	
	public int comp(Comp comp){
		EmailDAO emaildao = sqlsession.getMapper(EmailDAO.class);
		int result = emaildao.comp(comp);
		System.out.println(comp.getComp_no());
		return result;
	}
	
	public int compAuthUser(Auth auth){
		EmailDAO emaildao = sqlsession.getMapper(EmailDAO.class);
		int result = emaildao.compAuthUser(auth);
		return result;
	}
	
	/*public int jobComp(Job job){
		EmailDAO emaildao = sqlsession.getMapper(EmailDAO.class);
		int result = emaildao.jobComp(job);
		return result;
	}*/
	
	public int deptComp(Dept dept){
		EmailDAO emaildao = sqlsession.getMapper(EmailDAO.class);
		int result = emaildao.deptComp(dept);
		return result;
	}
	
	public int empComp(EMP emp ,Principal principal){
		EmailDAO emaildao = sqlsession.getMapper(EmailDAO.class);
		emp.setUser_id(principal.getName());
		int result = emaildao.empComp(emp);
		return result;
	}
	
	public int cname_check(String comp_name){
		EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		return emailDao.cname_check(comp_name);
	}
	/*public void sendEmail(Email email) throws Exception{
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");


		messageHelper.setFrom("parkchul40572@gmail.com");		
		messageHelper.setTo(email.getReciever()); 
		messageHelper.setSubject(email.getSubject());
		messageHelper.setText(email.getContent());

		mailSender.send(message);
	}*/

	public int licence_check(String check) {
		EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		return emailDao.licence_check(check);
	}

	public int email_check(String check) {
		EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		return emailDao.email_check(check);
	}

	//회사유효성검사
	public int checkComp(Comp comp) {
		
		 EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		 return emailDao.checkComp(comp);
		
	}
	
	//회사번호 DB랑 일치하는지 확인
	public int comp_no(String check) {
		EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		return emailDao.comp_no(check);
	}
	//부서번호 중복확인 유효성
	public int dept_no(String check) {
		EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		return emailDao.dept_no(check);
	}
	//
	public String deptreg(Dept dept) {
		 EmailDAO emailDao = sqlsession.getMapper(EmailDAO.class);
		int result= emailDao.deptreg(dept);
		System.out.println("부서등록 결과 확인 : " + result);
		return "redirect:mypage.htm";
	}




	
}
