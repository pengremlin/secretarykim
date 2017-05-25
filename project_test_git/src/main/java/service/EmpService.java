package service;
import java.io.File;
import java.io.IOException;
import java.security.Principal;
/*
* @FileName : EmpService.java
* @Project
* @Date
: service
: 2016. 6. 02.
*/
import java.sql.SQLException;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ericsson.research.trap.utils.UUID;

import DAO.EMPDAO;
import DAO.GoodsDAO;
import Emp.DTO.Allow;
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
import Emp.DTO.Holi;
import Emp.DTO.Holi2;
import Emp.DTO.Retire;
import Emp.DTO.Sal_List;
import Emp.DTO.Sal_Search;
import Emp.DTO.Step;
import Emp.DTO.TotalSal;
import Emp.DTO.User_name;
import User.DTO.User_info;
@Component
@Service
public class EmpService {
	@Autowired
	private SqlSession sqlsession;
	
	/*
	* @method Name : write
	* @date
	:2016. 6. 02.
	* @description : 사원추가하기
	* @param spec : EMP emp
	* @return : String
	*/
	public String write(EMP emp) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.insertEMP(emp);

		return "redirect:/getAllList.htm";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 02.
	* @description : 모든 사원 리스트 가지고오기
	* @param spec : x
	* @return : List<EMP>
	*/
	public List<EMP> list() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<EMP> list = empDao.getAllList();

		return list;
	}
	
	/*
	* @method Name : read
	* @date
	:2016. 6. 02.
	* @description : 한명 사원 리스트 가지고오기
	* @param spec : int user_no
	* @return : EMP
	*/
	public EMP read(String user_id) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		EMP emp = empDao.getEMP(user_id);
		
		return emp;
	}
	
	/*
	* @method Name : read
	* @date
	:2016. 6. 02.
	* @description : 한명 사원 리스트 가지고오기
	* @param spec : int user_no
	* @return : User_info
	*/
	public User_info readAll(String user_id) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		User_info user_info = empDao.getUser_Info(user_id);
		
		return user_info;
	}
	
	/*
	* @method Name : delete
	* @date
	:2016. 6. 02.
	* @description : 사원 삭제하기
	* @param spec : int user_no
	* @return : String
	*/
	public String delete(String user_id) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		empDao.delEMP(user_id);

		return "redirect:/getAllList.htm";
	}
	
	/*
	* @method Name : update
	* @date
	:2016. 6. 02.
	* @description : 수정할 사원 정보 가져오기
	* @param spec : int user_no
	* @return : EMP
	*/
	public EMP update(String user_id) {
		EMP dto = new EMP();
		try{
			EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
			dto = empDao.getEMP(user_id);
		}catch(Exception e){
			
		}
		
		return dto;
	}
	
	/*
	* @method Name : updateok
	* @date
	:2016. 6. 02.
	* @description : 사원 정보 수정하기
	* @param spec : EMP emp
	* @return : String
	*/
	public String updateok(EMP emp) throws SQLException {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

	
			empDao.updateEMP(emp);
		

		return "redirect:/read.htm";
	}
	
	/*
	* @method Name : insertAtte_go
	* @date
	:2016. 6. 03.
	* @description : 출근하기
	* @param spec : Atte atte
	* @return : String
	*/
	public String insertAtte_go(Atte atte,int atti_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		atte.setAtti_no(atti_no);
		empDao.insertAtte_go(atte);

		return "redirect:atteForm.htm";
	}
	
	/*
	* @method Name : insertAtti
	* @date
	:2016. 6. 03.
	* @description : 근태
	* @param spec : Atti atti
	* @return : String
	*/
	public String insertAtti(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		empDao.insertAtti(emp_no);
		

		return "redirect:atte.htm";
	}
	
	
	/*
	* @method Name : insertHoli
	* @date
	:2016. 6. 07.
	* @description : 휴가일지 작성
	* @param spec : Atti atti
	* @return : String
	*/
	public String insertHoli(Holi holi,int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		holi.setEmp_no(emp_no);
		empDao.insertHoli(holi);

		return "redirect:/emp/holiForm.htm";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 07.
	* @description : 오늘 출근,퇴근,외출,복귀 내역 보여주기
	* @param spec : x
	* @return : List<Atte>
	*/
	public List<Atte> atteList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Atte> list = empDao.atteList();

		return list;
	}
	
	/*
	* @method Name : getAtte
	* @date
	:2016. 6. 08.
	* @description : 선택한 근태 내역 가져오기
	* @param spec : int atte_no
	* @return : Atte
	*/
	public Atte getAtte(int atte_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		Atte atte = empDao.getAtte(atte_no);
		
		return atte;
	}
	
	/*
	* @method Name : updateAtte_back
	* @date
	:2016. 6. 07.
	* @description : 퇴근
	* @param spec : Atte atte
	* @return : x
	*/
	public void updateAtte_back(int emp_no) throws SQLException {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		try {
			
			empDao.updateAtte_back(emp_no);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}

	}
	
	/*
	* @method Name : updateAtte_start
	* @date
	:2016. 6. 07.
	* @description : 외출
	* @param spec : Atte atte
	* @return : x
	*/
	public void updateAtte_start(Atte atte) throws SQLException {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		try {
			empDao.updateAtte_start(atte);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}

	}
	
	/*
	* @method Name : updateAtte_start
	* @date
	:2016. 6. 07.
	* @description : 복귀
	* @param spec : Atte atte
	* @return : x
	*/
	public void updateAtte_end(Atte atte) throws SQLException {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		try {
			empDao.updateAtte_end(atte);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
			throw e;
		}

	}
	
	/*
	* @method Name : insertDoc
	* @date
	:2016. 6. 07.
	* @description : Doc 작성
	* @param spec : Doc doc
	* @return : String
	*/
	public String insertDoc(Doc doc, MultipartHttpServletRequest req,Doc_Data doc_data) throws IllegalStateException, IOException {

		String uploadpath = req.getSession().getServletContext().getRealPath("resources/doc_file");
	      
	      File dir = new File(uploadpath);
	      if(!dir.isDirectory()){
	         // 파일저장될 디렉토리 없음 만들기
	         dir.mkdirs();
	      }
	      
	      // 넘어온 파일 리스트로 저장
	      List<MultipartFile> flist = req.getFiles("file");
	      
	      if(flist.size() == 1 && flist.get(0).getOriginalFilename().equals("")){
	         
	      }else{
	         for(int i=0; i<flist.size();i++){
	            //파일명 중복 처리 
	            String genId = UUID.randomUUID().toString();
	            System.out.println("genId : " + genId);
	            
	            //원래파일명
	            String orign_file = flist.get(i).getOriginalFilename();
	            
	            // 저장되는 파일명
	            String save_file = genId + "-" + orign_file;
	            
	            doc_data.setOrign_name(orign_file);
	            doc_data.setSave_name(save_file);
	            
	            String save_path = uploadpath + "\\" + save_file;
	            
	            System.out.println("파일 저장 경로 확인 : " + save_path);
	            
	            flist.get(i).transferTo(new File(save_path)); // 파일저장
	            
	            EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
	            empDao.insertDocData(doc_data);
	     		empDao.insertDoc(doc);
	         }
	      }

		
		return "redirect:attiForm.htm";
	}
	
	/*
	* @method Name : docList
	* @date
	:2016. 6. 07.
	* @description : 모든 Doc 리스트 가지고오기
	* @param spec : x
	* @return : List<Doc>
	*/
	public List<Doc> docList(int atti_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Doc> doc = empDao.docList2(atti_no);
		
		return doc;
	}
	
	/*
	* @method Name : getDoc
	* @date
	:2016. 6. 07.
	* @description : Doc 리스트 하나 가지고오기
	* @param spec : int doc_no
	* @return : Doc
	*/
	public Doc getDoc(int doc_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		Doc doc = empDao.getDoc(doc_no);
		
		return doc;
	}
	
	/*
	* @method Name : getAtti
	* @date
	:2016. 6. 08
	* @description : 선택한 근태 모든 내역 보여주기
	* @param spec : int atti_no
	* @return : List<Atti>
	*/
	public List<AttiContent> getAtti(int atti_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<AttiContent> list = empDao.getAtti(atti_no);

		return list;
	}
	
	/*
	* @method Name : insertDoc_Kind
	* @date
	:2016. 6. 08.
	* @description : 휴가일지 작성
	* @param spec : Doc_Kind doc_kind
	* @return : String
	*/
	public String insertDoc_Kind(Doc_Kind doc_kind) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.insertDoc_Kind(doc_kind);

		return "redirect:/docList.htm";
	}
	
	/*
	* @method Name : holiList
	* @date
	:2016. 6. 08.
	* @description : 모든 Holi 리스트 가지고오기
	* @param spec : x
	* @return : List<Holi>
	*/
	public List<Holi> holiList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Holi> list = empDao.holiList();

		return list;
	}
	
	/*
	* @method Name : insertHoliDoc
	* @date
	:2016. 6. 08.
	* @description : HoliDoc 작성
	* @param spec : Doc doc
	* @return : String
	*/
	public String insertHoliDoc(Doc doc) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.insertHoliDoc(doc);

		return "redirect:/holiForm.htm";
	}
	
	/*
	* @method Name : atteList
	* @date
	:2016. 6. 09
	* @description : 선택한 출근,퇴근,외출,복귀 내역 보여주기
	* @param spec : int atti_no
	* @return : List<Atte>
	*/
	public List<Atte> atteList(int atti_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Atte> list = empDao.atteList2(atti_no);

		return list;
	}
	
	/*
	* @method Name : holiList
	* @date
	:2016. 6. 08.
	* @description : 선택한 모든 Holi 리스트 가지고오기
	* @param spec : int holi_no
	* @return : List<Holi>
	*/
	public List<Holi> holiList(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Holi> list = empDao.holiList2(emp_no);

		return list;
	}
	
	/*
	* @method Name : atti_KindWrite
	* @date
	:2016. 6. 13.
	* @description : 근태 종류 추가하기
	* @param spec : atti_kind
	* @return : String
	*/
	public String insertAtti_Kind(Atti_Kind atti_kind) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		empDao.insertAtti_Kind(atti_kind);

		return "redirect:atti_KindForm.htm";
	}
	
	/*
	* @method Name : atti_KindList
	* @date
	:2016. 6. 13.
	* @description : 선택한 모든 atti_kind 리스트 가지고오기
	* @param spec : x
	* @return : List<Atti_Kind>
	*/
	public List<Atti_Kind> atti_KindList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Atti_Kind> list = empDao.atti_KindList();

		return list;
	}
	
	/*
	* @method Name : insertAtte_start
	* @date
	:2016. 6. 13.
	* @description : 출근 후 처음 이후 외근
	* @param spec : Atte atte
	* @return : String
	*/
	public void insertAtte_start(Atte atte) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.insertAtte_start(atte);

	}
	
	/*
	* @method Name : Atte_start
	* @date
	:2016. 6. 13.
	* @description : 외근 수 뽑기
	* @param spec : Atte atte
	* @return : String
	*/
	public int Atte_start(Atte atte){
		
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		return empDao.Atte_start(atte);
			
	}
	
	/*
	* @method Name : insertAllowBasic
	* @date
	:2016. 6. 13.
	* @description : 수당 기본 항목 작성
	* @param spec : Allow allow
	* @return : String
	
	public String insertAllowBasic(Allow allow) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.insertAllowBasic(allow);

		return "redirect:allowBasic.htm";
	}*/
	
	/*
	* @method Name : allowBasicList
	* @date
	:2016. 6. 13.
	* @description : 수당 기본 사항 보여 주기
	* @param spec : x
	* @return : List<AllowList>
	*/
	public List<Allow_Basic> allowBasicList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Allow_Basic> list = empDao.allowBasicList();

		return list;
	}
	
	/*
	* @method Name : allowFormList
	* @date
	:2016. 6. 14.
	* @description : 수당 항목 리스트 보여 주기
	* @param spec : x
	* @return : List<Allow>
	*/
	public List<Allow> allowFormList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Allow> list = empDao.allowFormList();
		
		
		return list;
	}
	
	/*
	* @method Name : updateAllowForm
	* @date
	:2016. 6. 15.
	* @description : 수당 항목 작성하기
	* @param spec : Allow allow
	* @return : String
	*/
	public String updateAllowForm(Allow allow) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.updateAllowForm(allow);

		return "redirect:allowForm.htm";
	}
	
	/*
	* @method Name : updateAllowCal
	* @date
	:2016. 6. 15.
	* @description : 계산 식 저장
	* @param spec : Allow allow
	* @return : String
	*/
	public String updateAllowCal(Allow allow) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.updateAllowCal(allow);
		
		return "redirect:allowCal.htm?allow_no="+allow.getAllow_no();
	}
	
	/*
	* @method Name : updateAllowCal
	* @date
	:2016. 6. 15.
	* @description : 계산 식 저장
	* @param spec : int allow_no
	* @return : EMP
	
	public String updateAllowCal(int allow_no) {
		
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		empDao.updateAllowCal(allow_no);
		
		return "redirect:/allowForm.htm";
	}*/
	
	/*
	* @method Name : empList
	* @date
	:2016. 6. 18.
	* @description : 사원리스트보여주기
	* @param spec : x
	* @return : List<Allow_Basic>
	*/
	public List<Allow_Basic> empList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Allow_Basic> list = empDao.empList();

		return list;
	}
	
	/*
	* @method Name : attiList
	* @date
	:2016. 6. 17.
	* @description : 모든 근태 내역 내용 보여주기
	* @param spec : x
	* @return : List<Atti_List>
	*/
	public List<Atti_List> attiList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Atti_List> list = empDao.attiList();

		return list;
	}
	
	/*
	* @method Name : calcul
	* @date
	:2016. 6. 18.
	* @description : 연산자 계산하기
	* @param spec : x
	* @return : Allow
	*/
	public Allow calcul(int allow_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		Allow allow = empDao.calcul(allow_no);
		
		String calcul = allow.getAllow_calcul();
		
		String[] tonkens = new String[10];
		int index = 0;
		StringTokenizer sto2 = new StringTokenizer(calcul, "()+-*/RC");
		while (sto2.hasMoreTokens()) {
			tonkens[index++] = sto2.nextToken();
		}
		System.out.println("토큰"+tonkens.length);
		
		return allow;
	}
	
	/*
	* @method Name : retireList
	* @date
	:2016. 6. 18.
	* @description : 퇴직금 계산보여주기
	* @param spec : x
	* @return : List<Retire>
	*/
	public List<Retire> retireList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Retire> list = empDao.retireList();

		return list;
	}
	
	
	/*
	* @method Name : getAllow_Basic
	* @date
	:2016. 6. 18.
	* @description : 선택한 사원넘버로 리스트 보여주기
	* @param spec : x
	* @return : Allow_Basic
	*/
	public Allow_Basic getAllow_Basic(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		Allow_Basic allow_basic = empDao.getAllow_Basic(emp_no);
		
		return allow_basic;
	}
	
	/*
	* @method Name : allowFormList2
	* @date
	:2016. 6. 18.
	* @description : 선택한 수당 항목 리스트 보여 주기
	* @param spec : x
	* @return : List<Allow>
	*/
	public Allow allowFormList2(int allow_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		Allow allow = empDao.allowFormList2(allow_no);
		
		/*for(int i=0; i<list.size(); i++){
			String temp = list.get(i).getAllow_division().substring(0, 1);
			list.get(i).setAllow_division(temp);
		}*/
		
		return allow;
	}
	
	public int insertEMP(EMP emp) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		int result = empDao.insertEMP(emp);

		return result;
	}
	
	/*
	* @method Name : insertAtte_go
	* @date
	:2016. 6. 22.
	* @description : 출근하기
	* @param spec : Atte atte
	* @return : String
	*/
	public String insertAtte_go2(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		;
		empDao.insertAtte_go2(emp_no);

		return "redirect:atteForm.htm";
	}
	
	/*
	* @method Name : updateAtte_go
	* @date
	:2016. 6. 22.
	* @description : 출근하기
	* @param spec : Atte atte
	* @return : String
	*/
	public String updateAtte_go2(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		System.out.println("여기냐1");
		empDao.updateAtte_go2(emp_no);

		return "redirect:atteForm.htm";
	}
	
	/*
	* @method Name : attieAllList
	* @date
	:2016. 6. 22.
	* @description : 모든 출근뽑기
	* @param spec : x
	* @return : List<Atte>
	*/
	public List<Atte> atteAllList2(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Atte> list = empDao.atteAllList2(emp_no);

		return list;
	}
	
	/*
	* @method Name : attiAllList2
	* @date
	:2016. 6. 22.
	* @description : 모든 근태뽑기
	* @param spec : x
	* @return : List<Atti>
	*/
	public List<Atti> attiAllList2(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Atti> list = empDao.attiAllList2(emp_no);

		return list;
	}
	
	/*
	* @method Name : attiAllList
	* @date
	:2016. 6. 20.
	* @description : 모든 근태뽑기
	* @param spec : x
	* @return : List<Atti>
	*/
	public List<Atti> attiAllList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Atti> list = empDao.attiAllList();

		return list;
	}
	
	/*
	* @method Name : attieAllList
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<Dept> dept_List() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Dept> list = empDao.dept_List();

		return list;
	}
	
	/*
	* @method Name : insertSal_List
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트 작성
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public String insertSal_List(Sal_List sal_list) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		empDao.insertSal_List(sal_list);

		return "redirect:sal.htm";
	}
	
	/*
	* @method Name : attieAllList
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<Sal_List> sal_List() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Sal_List> list = empDao.sal_List();

		return list;
	}
	
	/*
	* @method Name : updateAllowBasic
	* @date
	:2016. 6. 18.
	* @description : 수당 기본 항목 작성
	* @param spec : EMP emp
	* @return : String
	*/
	public String updateAllowBasic(EMP emp) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.updateAllowBasic(emp);

		return "redirect:allowBasic.htm";
	}
	
	
	
	
	///////////////////////////////////////////////
	public List<Atte> atteListView(int emp_no){
		
		
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		List<Atte> list = empDao.atteListView(emp_no);

		return list;
		
	}
	
	
	public int updateHoli(Holi holi) throws Exception{
		
		int result=0;
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		if(holi.getHoli_end().equals("")){
	System.out.println("33333");
		
			result = empDao.updateHoli2(holi);

		}else{
			result = empDao.updateHoli(holi);
		}		
		
		return result;
	}
	
	
	
	public List<Holi> ajaxholilist(int emp_no){
		
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Holi> list = empDao.ajaxholilist(emp_no);
		
		return list;
	}
	
	public int deleteholi(Holi holi){
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		int result = empDao.deleteholi(holi);
		
		return result;
	}
	///////////////////////////////////////////////
	
	
	/*
	* @method Name : attieAllList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<EmpAllow> empAllowList(String dept_name) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<EmpAllow> list = empDao.empAllowList(dept_name);

		return list;
	}
	
	/*
	* @method Name : allowFormList
	* @date
	:2016. 6. 14.
	* @description : 수당 항목 리스트 보여 주기
	* @param spec : x
	* @return : List<Allow>
	*/
	public List<Allow> allowFormList3() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Allow> list = empDao.allowFormList3();
		
		return list;
	}
	
	/*
	* @method Name : insertSal_List
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트 작성
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public String insertEmpAllow(Allow_History allow_history) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		empDao.insertEmpAllow(allow_history);

		return "redirect:empAllowList.htm?emp_no="+allow_history.getEmp_no();
	}
	
	
	/*
	* @method Name : empAllowList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<TotalSal> eachSal(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<TotalSal> list = empDao.eachSal(emp_no);

		return list;
	}
	
	/*
	* @method Name : empAllowList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<EmpAllow> eachSalList(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<EmpAllow> list = empDao.eachSalList(emp_no);

		return list;
	}
	
	/*
	* @method Name : empAllowList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<TotalSal> totalSal(String dept_name) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<TotalSal> list = empDao.totalSal(dept_name);

		return list;
	}
	
	/*
	* @method Name : empAllowList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<Sal_Search> sal_SearchList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Sal_Search> list = empDao.sal_SearchList();

		return list;
	}
	
	/*
	* @method Name : empAllowList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public  List<User_name> User_name() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<User_name> list = empDao.User_name();

		return list;
	}
	
	/*
	* @method Name : empAllowList
	* @date
	:2016. 6. 22.
	* @description : 급여 리스트
	* @param spec : x
	* @return : List<Sal_List>
	*/
	public List<Step> step(String dept_name) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		
		List<Step> list = empDao.step(dept_name);

		return list;
	}
	
	/*
	* @method Name : updateAllowBasic
	* @date
	:2016. 6. 18.
	* @description : 수당 기본 항목 작성
	* @param spec : EMP emp
	* @return : String
	*/
	public String deleteAllowBasic(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.delteAllowBasic(emp_no);

		return "redirect:allowBasic.htm";
	}
	
	
	

    public int getEmp_no(EMP emp){
		

		System.out.println(sqlsession);
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		int result_id = empDao.getEmp_no(emp);
		
		return result_id;
	}

    
/*
* @method Name : sal_ListDelete
* @date
:2016. 6. 18.
* @description : 급여 리스트 삭제 하기
* @param spec : EMP emp
* @return : String
*/
public String sal_ListDelete(int sal_list_no) {

	EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

	empDao.sal_ListDelete(sal_list_no);

	return "redirect:sal.htm";
}
	
	
	public int empno(Principal principal){
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		System.out.println("principal2"+principal.getName());
		String user_id = principal.getName();
		System.out.println("principal3"+principal.getName());
		
		return empDao.empno(user_id);
	}
	///////////////////////////////////////////////////////////
	
	public String insert1EMP(EMP emp) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		empDao.insertEMP(emp);
		System.out.println(emp.getUser_id());
		System.out.println(emp.getJob_name());
		return "redirect:/emp/jobForm.htm";
	}

	public List<EMP> empUserList() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		List<EMP> list = empDao.empUserList();

		return list;
	}

	public String delJOB(String job_name) {
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		empDao.delJOB(job_name);
		return "redirect:/emp/jobwriteForm.htm";
	}

	public int getlistcount() {
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		int result = empDao.getlistcount();
		return result;
	}

	public String getEditEMP(String user_id) {
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		System.out.println("여기까진 타니?");
		empDao.getEditEMP(user_id);

		System.out.println("맵퍼 돌렸니??");
		return "redirect:/emp/writeForm.htm";
	}

	
	public List<User_info>empInlist() {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<User_info> list = empDao.empAuthList();

		return list;
	}
	
	/*
	* @method Name : updateSal_List
	* @date
	:2016. 6. 02.
	* @description : 사원 정보 수정하기
	* @param spec : EMP emp
	* @return : String
	*/
	public int updateSal_List(int sal_list_no){

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		return empDao.updateSal_List(sal_list_no);
	}
	
	/*
	* @method Name : sal_ListDelete
	* @date
	:2016. 6. 18.
	* @description : 급여 리스트 삭제 하기
	* @param spec : EMP emp
	* @return : String
	*/
	public String atti_KindDelete(int atti_kind_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);

		empDao.atti_KindDelete(atti_kind_no);

		return "redirect:atti_KindForm.htm";
	}
	
	/*
	* @method Name : holiList
	* @date
	:2016. 6. 08.
	* @description : 선택한 모든 Holi 리스트 가지고오기
	* @param spec : int holi_no
	* @return : List<Holi>
	*/
	public List<Holi2> holiList2(int emp_no) {

		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		List<Holi2> list = empDao.holiList3(emp_no);

		return list;
	}
	
	public String EditEMP(String job_name ,String user_id) {
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		empDao.EditEMP(job_name,user_id);
		return "redirect:/emp/editForm.htm";
	}
	

}
