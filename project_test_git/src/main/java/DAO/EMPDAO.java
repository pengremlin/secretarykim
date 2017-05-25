package DAO;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import Emp.DTO.Allow;
import Emp.DTO.AllowForm;
import Emp.DTO.AllowList;
import Emp.DTO.Allow_Basic;
import Emp.DTO.Allow_History;
import Emp.DTO.Atte;
import Emp.DTO.Atti;
import Emp.DTO.AttiContent;
import Emp.DTO.Atti_Kind;
import Emp.DTO.Atti_List;
import Emp.DTO.Dept;
import Emp.DTO.Doc;
import Emp.DTO.Doc_Data;
import Emp.DTO.Doc_Kind;
import Emp.DTO.EMP;
import Emp.DTO.EmpAllow;
import Emp.DTO.Emp_List;
import Emp.DTO.Holi;
import Emp.DTO.Holi2;
import Emp.DTO.Job;
import Emp.DTO.Retire;
import Emp.DTO.Sal;
import Emp.DTO.Sal_History;
import Emp.DTO.Sal_List;
import Emp.DTO.Sal_Search;
import Emp.DTO.Step;
import Emp.DTO.TotalSal;
import Emp.DTO.User_name;
import User.DTO.User_info;

public interface EMPDAO {
	//모든 회원정보중 회사에 가입되어있지 않은 유저정보 가지고 오기
			List<EMP> getAllList();
			//모든 사원정보 가지고 오기
			List<EMP> empUserList();
			//EMP에 속해있는 리스트 가져오기
			List<User_info>empAuthList();
			//한명의 사원정보 가지고 오기
			EMP getEMP(String user_id);
			//권한 수정 
			int EditEMP(@RequestParam("job_name")String job_name,@RequestParam("user_id")String user_id);
			//회사에 등록 되어있지 않은 리스트 카운트
			EMP getEditEMP(@RequestParam("user_id")String user_id);
			//회사에 등록 되어있지 않은 리스트 카운트
			int getlistcount();
			//한명의 사원의 모든 정보 가지고 오기
			User_info getUser_Info(String user_id);
			//사원 삭제 하기
			int delEMP(String user_id);
			//사원 등록하기
			int insertEMP(EMP emp);
			//사원 부서 업뎃하기
			int updateEMP(EMP emp);
			//부서 등록 시키기
			String insertJOB(Job job) throws ClassNotFoundException,SQLException;
			//직급 삭제
			int delJOB(String job_name);

	//선택한 근태 모든 내역 보여주기
		List<AttiContent> getAtti(int atti_no);
		//근태 추가
		int insertAtti(int emp_no);
		//출근
		int insertAtte_go(Atte atte);
		//퇴근
		int updateAtte_back(int emp_no) throws ClassNotFoundException,SQLException;
		//출근 후 처음 회사에서 나갈 경우
		int updateAtte_start(Atte atte) throws ClassNotFoundException,SQLException;
		//출근 후 처음이후 회사에서 나갈 경우
		int insertAtte_start(Atte atte);
		//출근 후 회사에서 나간 다음 들어올 경우
		int updateAtte_end(Atte atte) throws ClassNotFoundException,SQLException;
		//오늘 출근,퇴근,외출,복귀 내역 보여주기
		List<Atte> atteList();
		//선택한 출근,퇴근,외출,복귀 내역 보여주기
		List<Atte> atteList2(int atti_no);
		//선택한 근태 내역 보여주기
		Atte getAtte(int atte_no);
		//휴가 일지 작성
		int insertHoli(Holi holi);	
		//휴가 Doc 작성
		int insertHoliDoc(Doc doc);
		//휴가 일지 수정
		int updateHoli(Holi holi) throws ClassNotFoundException,SQLException;
		//휴가 일지 수정
		int updateHoli2(Holi holi) throws ClassNotFoundException,SQLException;
		//모든 휴가 내역 보여주기
		List<Holi> holiList();
		//선택한 모든 휴가 내역 보여주기
		List<Holi> holiList2(int atti_no);
		//선택한 휴가 내역 보여주기
		Holi getHoli(int holi_no);
		//근태 문서 작성
		int insertDoc(Doc doc);
		//근태 문서 수정
		int updateDoc(Doc doc) throws ClassNotFoundException,SQLException;
		//근태 문서 추가
		int insertDoc_Kind(Doc_Kind doc_kind);
		//모든 근태 문서 내역 보여주기
		List<Doc> docList();
		//선택한 근태 문서 내역 보여주기
		Doc getDoc(int doc_no);
		//급여 작성
		int insertSal(Sal sal);
		//급여 수정
		int updateSal(Sal sal) throws ClassNotFoundException,SQLException;
		//모든 급여 내역 보여주기
		List<Sal> salList();
		//선택한 급여 내역 보여주기
		Sal getSal(int sal_no);
		//근태 종류 추가
		int insertAtti_Kind(Atti_Kind atti_Kind);
		//근태 종류 보여주기
		List<Atti_Kind> atti_KindList();
		//외근 수 뽑아오기
		int Atte_start(Atte atte);
		//수당 기본 사항 등록 하기
		int updateAllowBasic(EMP emp);
		//수당 기본 사항 보여 주기
		List<Allow_Basic> allowBasicList();
		//수당 항목 리스트 보여 주기
		List<Allow> allowFormList();
		//수당 항목 작성하기
		int updateAllowForm(Allow allow);
		//계산 식 저장
		int updateAllowCal(Allow allow);
		//사원 리스트 보여주기
		List<Allow_Basic> empList();
		//모든 근태 내역 내용 보여주기
		List<Atti_List> attiList();
		//수당 항목 리스트 보여 주기
		Allow allowFormList2(int allow_no);
		//선택한 사원넘버로 리스트 보여주기
		Allow_Basic getAllow_Basic(int emp_no);
		//계산
		Allow calcul(int allow_no);
		//퇴직금 계산보여주기
		List<Retire> retireList();
		//출근한후 또 출근 클릭시
		int updateAtte_go(Atte atte);
		//모든 근태뽑기
		List<Atti> attiAllList();
		//모든 출근
		List<Atte> atteAllList();
		//급여 리스트
		List<Sal_List> sal_List();
		//급여 작성
		int insertSal_List(Sal_List sal_list);
		//부서 리스트
		List<Dept> dept_List();
		//사원 리스트
		List<EMP> emp_List();
		//모든 근태뽑기
		List<Atti> attiAllList2(int emp_no);
		//모든 출근
		List<Atte> atteAllList2(int emp_no);
		
		int insertAtte_go2(int emp_no);
		int updateAtte_go2(int emp_no);
		
		
		////////////////////////////////
		//출퇴근 뷰
		List<Atte> atteListView(int emp_no);
		//휴가 뷰
		List<Holi> ajaxholilist(int emp_no);
		//휴가 삭제
		int deleteholi(Holi holi);
		////////////////////////////////
		
		//
		List<EmpAllow> empAllowList(String dept_name);
		//수당 항목 리스트 보여 주기
		List<Allow> allowFormList3();
		//emp_no 뽑아오기
		EMP emp_no(String user_id);
		
		List<TotalSal> eachSal(int emp_no);
		List<EmpAllow> eachSalList(int emp_no);
		List<TotalSal> totalSal(String dept_name);
		int insertEmpAllow(Allow_History allow_history);
		List<Sal_Search> sal_SearchList();
		List<User_name> User_name();
		List<Step> step(String dept_name);
		
		//수당 기본 사항 삭제 하기
		int delteAllowBasic(int emp_no);
		//급여 리스트 삭제 하기
		int sal_ListDelete(int sal_list_no);

		int getEmp_no(EMP emp);
		
		int empno(String user_id);
		
		//휴가 일지 수정
		int updateSal_List(int sal_list_no);
		//급여 리스트 삭제 하기
		int atti_KindDelete(int atti_kind_no);
		//선택한 근태 문서 내역 보여주기
		List<Doc> docList2(int atti_no);
		//data 입력
		int insertDocData(Doc_Data doc_data);
		//선택한 모든 휴가 내역 보여주기 
		List<Holi2> holiList3(int atti_no);
}
