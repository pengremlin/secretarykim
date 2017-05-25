package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import Emp.DTO.Comp;
import service.EmailService;
import DTO.Auth;
import DTO.Email;
import Emp.DTO.Dept;
import Emp.DTO.EMP;
import Emp.DTO.Job;
import User.DTO.User_info;


@Controller
@RequestMapping("/mypage")
public class EmailController {
	
	@Autowired
	private EmailService emailservice;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value="/email.htm" , method=RequestMethod.POST)
	public String main(User_info user,EMP emp ,Auth auth , Comp comp , Job job ,Principal principal ,HttpServletResponse res) throws Exception {
      
		    System.out.println("이건 타니?");
		    int checkComp = emailservice.checkComp(comp);
			System.out.println("zzzzzzzzzzz :" + checkComp);
			if (checkComp > 0) {
				res.setContentType("text/html;charset=utf-8");
				PrintWriter out = res.getWriter();
				out.println("<script>");
				out.println("alert('중복된값이 있습니다.');");
				out.println("location.href='/momento/mypage/mypage.htm';");
				out.println("</script>");
				out.close();
				return null;

		} else {
			
		
	        emailservice.emailComp(comp);//회사 생성
	        int result = emailservice.comp(comp);//회사관련 부서번호 email 전송
	        
            Email email = new Email();
			System.out.println("*******메일*********" + comp.getComp_email());
			String reciever = comp.getComp_email();
			String subject = "[KIMBUSIOR] 김비서 회사 번호를 알려 드립니다. 회사번호는 ";
			
			email.setReciever(reciever);
			email.setSubject(subject);
			System.out.println("subject까진 진행되니?");
			email.setContent(subject +result+ "번 입니다.");
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			    emailservice.empComp(emp,principal);

				messageHelper.setFrom("parkchul40572@gmail.com");		
				messageHelper.setTo(comp.getComp_email()); 
				messageHelper.setSubject(email.getSubject());
				messageHelper.setText(email.getContent());
                System.out.println("이건 찍힙니까?");
				mailSender.send(message);
				
				res.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=res.getWriter();
		   		out.println("<script>");
		   		out.println("alert('회사가 설립 되었습니다. 회사 번호는 Email를 통해 전송 되었습니다.');");
		   		out.println("location.href='/momento/mypage/mypage.htm';");
		   		out.println("</script>");
		   		out.close();
			
			return "mypage.mypage";
		
	}
}
	
/*	@RequestMapping(value="/register.htm" , method=RequestMethod.POST)
	public String mypage(Comp comp ,Dept dept, Auth auth ,Job job , EMP emp , HttpSession session , Principal principal ,HttpServletResponse res) throws Exception {
		    emailservice.compAuthUser(auth);//회사 생성과 동시에 마스터 권한부여
	        emailservice.jobComp(job);//회사 생성 마스터의 job 테이블 기본 데이터 베이스 생성
	        emailservice.deptComp(dept);//회사 생성 마스터의 기본 부서 설정
	        emailservice.empComp(emp);//회사 생성 마스터의 기본 사원테이블 정보 등록       
			
				res.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=res.getWriter();
		   		out.println("<script>");
		   		out.println("alert('회사 창립을 진심으로 축하드립니다. 정보 저장을 위해 다시 한번 로그인 해 주시기 바랍니다.');");
		   		session.invalidate();
		   		out.println("location.href='/momento/index.htm';");
		   		out.println("</script>");
		   		out.close();
			return "mypage.mypage";
		
	}*/
	
	@RequestMapping(value="/cname_check.htm" , method=RequestMethod.POST)
	public void cname_check(@RequestParam("comp_name") String check, HttpServletResponse response){
		System.out.println("comp_name Controller Ÿ��");
		
   		int userlist=0;
   		//parameter�� session���� UserCheckList�� �Ѱܼ� ��������
   		userlist=emailservice.cname_check(check);
   		
		PrintWriter writer = null;
		
		try{
			writer = response.getWriter();
			writer.write(userlist + "");
			writer.flush();
		} catch(IOException e){
			throw new RuntimeException(e.getMessage() , e);
		}
		finally{
			if(writer !=null){
				writer.close();
			}
		}
	}
	
	@RequestMapping(value="/licence_check.htm" , method=RequestMethod.POST)
	public void licence_check(@RequestParam("licence") String check, HttpServletResponse response){
		System.out.println("licence_check Controller Ÿ��");
		
   		int licence_check=0;
   		//parameter�� session���� UserCheckList�� �Ѱܼ� ��������
   		licence_check=emailservice.licence_check(check);
   		
		PrintWriter writer = null;
		
		try{
			writer = response.getWriter();
			writer.write(licence_check + "");
			writer.flush();
		} catch(IOException e){
			throw new RuntimeException(e.getMessage() , e);
		}
		finally{
			if(writer !=null){
				writer.close();
			}
		}
	}
	
	@RequestMapping(value="/email_check.htm" , method=RequestMethod.POST)
	public void email_check(@RequestParam("comp_email") String check, HttpServletResponse response){
		System.out.println("email_check Controller Ÿ��");
		
   		int email_check=0;
   		//parameter�� session���� UserCheckList�� �Ѱܼ� ��������
   		email_check=emailservice.email_check(check);
   		
		PrintWriter writer = null;
		
		try{
			writer = response.getWriter();
			writer.write(email_check + "");
			writer.flush();
		} catch(IOException e){
			throw new RuntimeException(e.getMessage() , e);
		}
		finally{
			if(writer !=null){
				writer.close();
			}
		}
	}
	
	//회사등록 유효성------------------------------------------
	
			// 회사번호 DB에있는지 검사
				@RequestMapping(value="/compno_check.htm" , method=RequestMethod.POST)
				public void comp_no(@RequestParam("comp_no") String check, HttpServletResponse response){
					System.out.println("comp_no_ Controller Ÿ��");
					
			   		int comp_no=0;
			   		
			   		comp_no=emailservice.comp_no(check);
			   		
					PrintWriter writer = null;
					
					try{
						writer = response.getWriter();
						writer.write(comp_no + "");
						writer.flush();
					} catch(IOException e){
						throw new RuntimeException(e.getMessage() , e);
					}
					finally{
						if(writer !=null){
							writer.close();
						}
					}
				}
				
				// 부서번호 중복확인 유효성
				@RequestMapping(value="/deptno_check.htm" , method=RequestMethod.POST)
				public void dept_no(@RequestParam("dept_no") String check, HttpServletResponse response){
					System.out.println("dept_no Controller Ÿ��");
					
			   		int dept_no=0;
			   		
			   		dept_no=emailservice.dept_no(check);
			   		
					PrintWriter writer = null;
					
					try{
						writer = response.getWriter();
						writer.write(dept_no + "");
						writer.flush();
					} catch(IOException e){
						throw new RuntimeException(e.getMessage() , e);
					}
					finally{
						if(writer !=null){
							writer.close();
						}
					}
				}
				//부서등록 
				@RequestMapping(value="/deptreg.htm" , method=RequestMethod.POST)
				public String deptreg(Dept dept) throws ClassNotFoundException, SQLException {
					System.out.println("dept reg");
					return emailservice.deptreg(dept);
				}


}
