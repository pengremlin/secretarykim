package DAO;


import DTO.Auth;
import Emp.DTO.Comp;
import Emp.DTO.Dept;
import Emp.DTO.EMP;
import Emp.DTO.Job;


public interface EmailDAO {
   
	int emailComp(Comp comp);//회사 생성 
	int comp(Comp comp); //회사 관련 부서번호 이메일 발송
	int compAuthUser(Auth auth); //회사 생성과 동시에 master 권한 부여
	/*int jobComp(Job job); //회사 생성 마스터의 job 테이블 기본 데이터 베이스 생성 */
	int deptComp(Dept dept);//회사 생성 마스터의 기본 부서 설정
	int empComp(EMP emp);//회사 생성 마스터의 개인정보 사원테이블 등록
	int cname_check(String comp_name);
	int licence_check(String check);
	int email_check(String check);
	int checkComp(Comp comp);//회사등록요청 유효성
	int comp_no(String check);//회사번호 DB에 있는지 확인 
	int deptreg(Dept dept);//부서 
	int dept_no(String check);//부서번호 중복확인
	
	
}
