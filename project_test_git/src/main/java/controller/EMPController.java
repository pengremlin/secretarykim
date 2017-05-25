package controller;

import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.View;

import com.fasterxml.jackson.databind.ObjectMapper;

import DTO.Auth;
import Emp.DTO.Allow;
import Emp.DTO.Allow_Basic;
import Emp.DTO.Allow_History;
import Emp.DTO.Atte;
import Emp.DTO.Atti;
import Emp.DTO.Atti_Kind;
import Emp.DTO.Atti_List;
import Emp.DTO.Dept;
import Emp.DTO.Doc;
import Emp.DTO.Doc_Data;
import Emp.DTO.EMP;
import Emp.DTO.EmpAllow;
import Emp.DTO.Holi;
import Emp.DTO.Holi2;
import Emp.DTO.Job;
import Emp.DTO.Retire;
import Emp.DTO.Sal_List;
import Emp.DTO.Sal_Search;
import Emp.DTO.TotalSal;
import Emp.DTO.User_name;
import User.DTO.User_info;
import service.AuthService;
import service.EmpService;
import service.JobService;
import service.UserService;
/*
* @FileName : EMPController.java
* @Project
* @Date
: controller
: 2016. 6. 02.
*/
@Controller
@RequestMapping("/emp")
public class EMPController {

	@Autowired
	private EmpService empservice;
    
	@Autowired
	private UserService userservice;
	
	@Autowired
	private JobService jobservice;
	
	@Autowired
	private AuthService authservice;
    
	@Autowired
	private View jsonView;
	
	
	
	@RequestMapping(value="/jobForm.htm" , method=RequestMethod.GET)
	public String jobForm(Model model) {
		List<EMP> list = empservice.list();
		model.addAttribute("list", list);
		return "emp.jobform";

	}
	//
	@RequestMapping(value="/jobForm.htm" , method=RequestMethod.POST)
	public View getAjaxauth(@RequestParam("user_id") String user_id ,ModelMap map){
		
		List <Job> joblist = jobservice.job();
		User_info user_list = new User_info();
		List <Auth> authlist = authservice.projectGetauth(user_id);
		System.out.println(authlist.size());
		user_list = userservice.getUser(user_id);
		map.addAttribute("userlist", user_list);
	    map.addAttribute("joblist",joblist);
	    map.addAttribute("authlist",authlist);
		return jsonView;
	}
	
	@RequestMapping(value="/jobsubmit.htm" , method=RequestMethod.POST)
	public String joinSubmit(EMP emp ,Auth auth ,ModelMap map) throws IOException{
		List <Job> joblist = jobservice.job();
		authservice.regAuth(auth);
		User_info user_list = new User_info();
		map.addAttribute("userlist", user_list);
	    map.addAttribute("joblist",joblist);

		return empservice.insert1EMP(emp);
	}
	
	@RequestMapping(value="/deljobsubmit.htm" , method=RequestMethod.POST)
	public String deljoinSubmit(EMP emp ,Auth auth ,ModelMap map) throws IOException{
		
		return authservice.delAuth(auth);
	}
	/*
	* @method Name : writeForm
	* @date
	:2016. 6. 02.
	* @description : writeform으로 이동
	* @param spec : x
	* @return : String
	*/
	@RequestMapping(value="/writeForm.htm" , method=RequestMethod.GET)
	public String writeForm(Model model) {
		List<EMP>emplist = empservice.empUserList();
		model.addAttribute("emplist",emplist);
		return "emp.writeform";

	}
	
	@RequestMapping(value="/writeForm.htm" , method=RequestMethod.POST)
	public View writeAjaxForm(@RequestParam("user_id") String user_id, ModelMap map) {
		List<EMP>emplist = empservice.empUserList();
		List <Job> joblist = jobservice.job();
		List <Auth> authlist = authservice.projectGetauth(user_id);
		EMP dto= empservice.read(user_id);
		map.addAttribute("emplist",emplist);
		map.addAttribute("joblist",joblist);
		map.addAttribute("writelist", dto);
		map.addAttribute("authlist",authlist);
		
		return jsonView;
	}

	/*
	* @method Name : write
	* @date
	:2016. 6. 02.
	* @description : empservice에 사원정보 보내기
	* @param spec : EMP dto
	* @return : String
	*/
	@RequestMapping(value="/write.htm" , method=RequestMethod.POST)
	public String write(String job_name,String user_id , Auth auth) throws ClassNotFoundException, SQLException {
		return empservice.EditEMP(job_name,user_id);
	}

	
	@RequestMapping(value="/jobwriteForm.htm" , method=RequestMethod.GET)
	public String jobWrite(Model model) {
		List <Job> joblist = jobservice.job();
		model.addAttribute("joblist",joblist);
		return "emp.jobwrite";

	}
	
	@RequestMapping(value="/jobwriteForm.htm" , method=RequestMethod.POST)
	public View jobAjaxWrite(@RequestParam("job_name") String job_name, ModelMap map) {
		Job jobUserlist = jobservice.userJob(job_name);
		map.addAttribute("jobUserlist",jobUserlist);
		return jsonView;

	}
	
	@RequestMapping(value="/jobRegsubmit.htm" , method=RequestMethod.POST)
	public String submitJob(Job job , HttpServletResponse res , Model model) throws IOException {
		jobservice.submitJob(job);
		List <Job> joblist = jobservice.job();
		model.addAttribute("joblist",joblist);
		/*res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('부서가 개설 되었습니다.');");
		out.println("location.href='/momento/emp/jobwrite.htm';");
		out.println("</script>");
		out.close();*/
		return "emp.jobwrite";

	}
	
	@RequestMapping(value="/jobReg.htm" , method=RequestMethod.POST)
	public String JobReg(Job job ) throws IOException {
		jobservice.JobReg(job);
		/*res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('부서가 개설 되었습니다.');");
		out.println("location.href='/momento/emp/jobwrite.htm';");
		out.println("</script>");
		out.close();*/
		return "emp.jobwrite";

	}
	
	@RequestMapping(value="/jobDel.htm" , method=RequestMethod.POST)
	public String JobDel(String job_name) throws IOException {
		/*res.setContentType("text/html;charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('부서가 개설 되었습니다.');");
		out.println("location.href='/momento/emp/jobwrite.htm';");
		out.println("</script>");
		out.close();*/
		return empservice.delJOB(job_name);

	}
	@RequestMapping(value="/editForm.htm" , method=RequestMethod.GET)
	public String editwriteForm(Model model) {
		List<EMP>emplist = empservice.empUserList();
		model.addAttribute("emplist",emplist);
		return "emp.autheditform";

	}
	
	@RequestMapping(value="/editForm.htm" , method=RequestMethod.POST)
	public View editAjaxForm(@RequestParam("user_id") String user_id,Principal principal ,ModelMap map) throws IOException {
		
		EMP emplist = empservice.read(user_id);
		List <Job> joblist = jobservice.job();
		List <Auth> authlist = authservice.projectGetauth(user_id);
		EMP dto= empservice.read(user_id);
		map.addAttribute("emplist",emplist);
		map.addAttribute("joblist",joblist);
		map.addAttribute("writelist", dto);
		map.addAttribute("authlist",authlist);
		return jsonView;

	}
	
	@RequestMapping(value="editdel.htm" , method=RequestMethod.POST)
	public String deleteSubmit(EMP emp ,Auth auth ,ModelMap map) throws IOException{
		return authservice.del1Auth(auth);
	}
	
	@RequestMapping(value="subsubmit.htm" , method=RequestMethod.POST)
	public String subjoinSubmit(EMP emp ,Auth auth ,ModelMap map) throws IOException{
		User_info user_list = new User_info();
		map.addAttribute("userlist",user_list);
		return authservice.regAuth(auth);
	}
	
	@RequestMapping(value="/editSubmit.htm" , method=RequestMethod.POST)
	public String editFormSubmit(@RequestParam("user_id") String user_id, Auth auth ,ModelMap map) throws IOException {
		return empservice.getEditEMP(user_id);
	}
	
	@RequestMapping(value="/emplistForm.htm" , method=RequestMethod.GET)
	public String editlistForm(Model model) {
		List<EMP>emplist = empservice.empUserList();
		model.addAttribute("emplist",emplist);
		return "emp.updateeditform";

	}
	
	@RequestMapping(value="/emplistForm.htm" , method=RequestMethod.POST)
	public View ajaxlistForm(@RequestParam("user_id") String user_id,Principal principal ,ModelMap map) throws IOException {
		
		EMP emplist = empservice.read(user_id);
		List <Job> joblist = jobservice.job();
		List <Auth> authlist = authservice.projectGetauth(user_id);
		EMP dto= empservice.read(user_id);
		map.addAttribute("emplist",emplist);
		map.addAttribute("joblist",joblist);
		map.addAttribute("writelist", dto);
		map.addAttribute("authlist",authlist);
		return jsonView;

	}
	
	@RequestMapping(value="/deleteSubmit.htm" , method=RequestMethod.POST)
	public String deleteFormSubmit(@RequestParam("user_id") String user_id, Auth auth ,ModelMap map) throws IOException {
		return authservice.del1Auth(auth);
	}
    
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 02.
	* @description : view단에 모든 사원정보 보내기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/getAllList.htm")
	public String list(Model model) {

		List<EMP> list = empservice.list();

		model.addAttribute("list", list);
		
		return "emp.list";
	}
	
	/*
	* @method Name : read
	* @date
	:2016. 6. 02.
	* @description : view단에 한명의 사원정보 보내기
	* @param spec : int user_no, Model model
	* @return : String
	*/
	@RequestMapping("/read.htm")
	public String read(String user_id, Model model) {

		User_info user_info = empservice.readAll(user_id);
		model.addAttribute("u", user_info);
		
		EMP emp = empservice.read(user_id);
		model.addAttribute("e",emp);
		
		return "emp.read";
	}

	/*
	* @method Name : update
	* @date
	:2016. 6. 02.
	* @description : view단에 수정할 사원정보 보내기
	* @param spec : int user_no, Model model
	* @return : String
	*/
	@RequestMapping("/update.htm")
	public String update(String user_id, Model model) {
		EMP dto = empservice.update(user_id);
		
		model.addAttribute("b",dto);
		return "emp.updateform";
	}

	/*
	* @method Name : updateok
	* @date
	:2016. 6. 02.
	* @description : 사원 정보 수정완료, view단에 사원 정보 보내기
	* @param spec : EMP emp, Model model
	* @return : String
	*/
	/*@RequestMapping("/updateok.htm")
	public String updateok(EMP emp, Model model) {

		try {
			empservice.updateok(emp);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		model.addAttribute("user_no", emp.getUser_no());

		return "redirect:/read.htm";
	}*/

	/*
	* @method Name : delete
	* @date
	:2016. 6. 02.
	* @description : 사원 번호를 입력 받아 사원 삭제하기
	* @param spec : int user_no, Model model
	* @return : String
	*/
	@RequestMapping("/delete.htm")
	public String delete(String user_id, Model model) {

		return empservice.delete(user_id);
	}
	
	/*
	* @method Name : search
	* @date
	:2016. 6. 02.
	* @description : 사원 번호를 입력 받아 사원 조회하기
	* @param spec : int user_no, Model model
	* @return : String
	*/
	@RequestMapping("/search.htm")
	public String search(String user_id, Model model) {

		EMP dto = empservice.read(user_id);

		model.addAttribute("b", dto);
		return "emp.read";
	}

	
	SimpleDateFormat trans = new SimpleDateFormat("yyyy-MM-dd");
	public java.util.Date today = new java.util.Date();     //오늘 날짜 
	public String today1 = trans.format(today); //오늘 날짜를 스트링으로 변환 
	
	/*
	* @method Name : atti
	* @date
	:2016. 6. 03.
	* @description : 출근
	* @param spec : Atti atti
	* @return : String
	*/
	@RequestMapping("/atti.htm")
	public String atti(Atti atti,Principal principal){
		int emp_no = empservice.empno(principal);
		List<Atti> list = empservice.attiAllList2(emp_no);
		System.out.println("list"+list.size());
		if(list.size()==0){
			return empservice.insertAtti(emp_no);
		}else{
			System.out.println("여기냐3");
			return "redirect:atte.htm";
		}

	}
	
	/*
	* @method Name : atte
	* @date
	:2016. 6. 20.
	* @description : 출근
	* @param spec : Atte atte
	* @return : String
	*/
	@RequestMapping("/atte.htm")
	public String atte(Atte atte,Principal principal){
		int emp_no = empservice.empno(principal);
		List<Atte> list = empservice.atteAllList2(emp_no);
		System.out.println("list"+list.size());
		
		if(list.size()==0){
			return empservice.insertAtte_go2(emp_no);
		}else{
			System.out.println("여기냐2");
			return empservice.updateAtte_go2(emp_no);
		}
	}
	
	/*
	* @method Name : atteList
	* @date
	:2016. 6. 07.
	* @description : view단에 오늘 atte 내용 보여주기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/atteForm.htm")
	public String atteList(Model model) {
		
		return "emp.atte";
	}
	
	
	///////////////////////////////////////////////////////
	@RequestMapping("/viewatteForm.htm")
	public void atteListView(HttpServletResponse response,Principal principal) {
		int emp_no=empservice.empno(principal);
		
		List<Atte> list = empservice.atteListView(emp_no);
		
		
		ObjectMapper mapper = new ObjectMapper();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/////////////////////////////////////////////////////
	
	/*
	* @method Name : readAtte
	* @date
	:2016. 6. 02.
	* @description : view단에 선택한 근태 내역 보여주기
	* @param spec : int atte_no, Model model
	* @return : String
	*/
	@RequestMapping("/readAtte.htm")
	public String readAtte(int atte_no, Model model) {

		Atte atte = empservice.getAtte(atte_no);
		model.addAttribute("a", atte);
		
		return "emp.readatte";
	}
	
	
	/*
	* @method Name : atte_Back
	* @date
	:2016. 6. 07.
	* @description : 퇴근
	* @param spec : Atte atte
	* @return : String
	*/
	@RequestMapping("/atte_Back.htm")
	public String atte_Back(Atte atte,Principal principal){
		int emp_no = empservice.empno(principal);
		try {
			empservice.updateAtte_back(emp_no);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:atteForm.htm"; 

	}
	
	/*
	* @method Name : atte_Out
	* @date
	:2016. 6. 07.
	* @description : 외출
	* @param spec : Atte atte
	* @return : String
	*/
	@RequestMapping("/atte_Out.htm")
	public String atti_Out(Atte atte){
		if(empservice.Atte_start(atte)>0){
			empservice.insertAtte_start(atte);
		}else{
			try {
				empservice.updateAtte_start(atte);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "redirect:atteForm.htm"; 

	}
	
	/*
	* @method Name : atte_Com
	* @date
	:2016. 6. 07.
	* @description : 복귀
	* @param spec : Atte atte
	* @return : String
	*/
	@RequestMapping("/atte_Com.htm")
	public String atte_Com(Atte atte){
		
		try {
			empservice.updateAtte_end(atte);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "redirect:/atteForm.htm"; 

	}
	
	/*
	* @method Name : docForm
	* @date
	:2016. 6. 07.
	* @description : docform으로 이동
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/docForm.htm")
	public String docForm() {
		return "emp.docform";

	}
	
	/*
	* @method Name : docWrite
	* @date
	:2016. 6. 07.
	* @description : empservice에 doc 보내기
	* @param spec : EMP dto
	* @return : String
	*/
	@RequestMapping(value="/docWrite.htm", method=RequestMethod.POST)
	public String docWrite(Doc doc, MultipartHttpServletRequest req,Doc_Data doc_data) throws IllegalStateException, IOException {
		System.out.println("타니");
		return empservice.insertDoc(doc, req,doc_data);
	}
	
	/*
	* @method Name : docList
	* @date
	:2016. 6. 07.
	* @description : view단에 모든 Doc 정보 보내기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/docList.htm")
	public String docList(Model model,int atti_no) {

		List<Doc> list = empservice.docList(atti_no);

		model.addAttribute("list", list);
		
		return "emp.docList";
	}
	
	/*
	* @method Name : readDoc
	* @date
	:2016. 6. 07.
	* @description : view단에 Doc 하나 정보 보내기
	* @param spec : int doc_no, Model model
	* @return : String
	*/
	@RequestMapping("/readDoc.htm")
	public String readDoc(int atti_no, Model model) {

		List<Doc> doc = empservice.docList(atti_no);
		model.addAttribute("d", doc);
		
		return "emp.readdoc";
	}
	
	/*
	* @method Name : attiList
	* @date
	:2016. 6. 08.
	* @description : view단에 모든 근태 내역 내용 보여주기
	* @param spec : Model model
	* @return : String
	
	@RequestMapping("/attiForm.htm")
	public String attiList(Model model) {

		List<Atti> list = empservice.attiList();

		model.addAttribute("list", list);
		
		return "emp/atti";
	}*/
	
	/*
	* @method Name : readAtti
	* @date
	:2016. 6. 09.
	* @description : view단에 선택한 모든 근태 내역 내용 보여주기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/readAtti.htm")
	public String readAtti(Model model,int atti_no) {

		List<Atte> list1 = empservice.atteList(atti_no);

		model.addAttribute("list1", list1);
		
		List<Holi2> list2 = empservice.holiList2(atti_no);

		model.addAttribute("list2", list2);
		
		return "emp.readatti";
	}
	
	
	/*
	* @method Name : holi
	* @date
	:2016. 6. 08.
	* @description : 휴가일지 작성
	* @param spec : Holi holi
	* @return : String
	*/
	@RequestMapping("/holi.htm")
	public String holi(Holi holi,Principal principal){
		int emp_no=empservice.empno(principal);
		return empservice.insertHoli(holi,emp_no);

	}
	
	/*
	* @method Name : holiWrite
	* @date
	:2016. 6. 08.
	* @description : 휴가일지 문서 작성
	* @param spec : Doc doc
	* @return : String
	*/
	@RequestMapping("/holiWrite.htm")
	public String holiWrite(Doc doc,Model model){
		
		return empservice.insertHoliDoc(doc);

	}
	
	/*
	* @method Name : holiForm
	* @date
	:2016. 6. 08.
	* @description : view단에 모든 Holi 정보 보내기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/holiForm.htm")
	public String holiForm(Model model,Principal principal) {
		int emp_no = empservice.empno(principal);
		List<Holi> list = empservice.holiList(emp_no);

		model.addAttribute("list", list);
		
		return "emp.holiform";
	}
	
	/*
	* @method Name : atti_KindWrite
	* @date
	:2016. 6. 13.
	* @description : 근태 종류 추가 하기
	* @param spec : att_kind
	* @return : String
	*/
	@RequestMapping("/atti_KindWrite.htm")
	public String atti_KindWrite(Atti_Kind atti_kind,Model model){
		
		return empservice.insertAtti_Kind(atti_kind);

	}
	
	/*
	* @method Name : atti_KindForm
	* @date
	:2016. 6. 13.
	* @description : atti_KindForm으로 이동
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/atti_KindForm.htm")
	public String atti_KindForm(Model model) {
		
		List<Atti_Kind> list = empservice.atti_KindList();

		model.addAttribute("list", list);
		
		return "emp.atti_KindForm";

	}
	

	/*
	* @method Name : allowBasicWrite
	* @date
	:2016. 6. 20.
	* @description : 급여 사항 작성하기
	* @param spec : Allow_Basic allow_basic
	* @return : String
	*/
	@RequestMapping("/allowBasicWrite.htm")
	public String allowBasicWrite(EMP emp) {

		return empservice.updateAllowBasic(emp);
	}

	/*
	* @method Name : allowBasic
	* @date
	:2016. 6. 14.
	* @description : view단에 모든 급여 사항 보내기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/allowBasic.htm")
	public String allowBasic(Model model) {

		List<Allow_Basic> list = empservice.allowBasicList();

		model.addAttribute("list", list);
		
		return "emp.allowBasic";
	}
	
	/*
	* @method Name : allowForm
	* @date
	:2016. 6. 14.
	* @description : view단에 모든 수당 사항 보내기
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/allowForm.htm")
	public String allowForm(Model model) {
		
		List<Allow> list = empservice.allowFormList();

		model.addAttribute("list", list);
		
		return "emp.allowForm";

	}
	
	/*
	* @method Name : retire
	* @date
	:2016. 6. 14.
	* @description : retire으로 이동
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/retire.htm")
	public String retire() {
		return "emp.retire";

	}
	
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/sal.htm")
	public String sal_List(Model model) {

		List<Sal_List> list = empservice.sal_List();

		model.addAttribute("list", list);
		
		return "emp.sal";
	}
	
	/*
	* @method Name : allowCal
	* @date
	:2016. 6. 15.
	* @description : 계산 내역 등록 페이지
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/allowCal.htm")
	public String allowCal(Model model,int allow_no) {
		
		List<Allow> list = empservice.allowFormList();
		
		Allow allow = empservice.allowFormList2(allow_no);
		System.out.println(allow.getAllow_no());
		model.addAttribute("list", list);
		model.addAttribute("a", allow);
		
		return "empop.allowCal";

	}
	
	/*
	* @method Name : allowFormWrite
	* @date
	:2016. 6. 15.
	* @description : 수당 항목 등록하기
	* @param spec : Allow allow,int allow_no
	* @return : String
	*/
	@RequestMapping("/allowFormWrite.htm")
	public String allowFormWrite(Allow allow,int allow_no) {
		
		allow.setAllow_no(allow_no);
		
		return empservice.updateAllowForm(allow);
	}
	
	/*
	* @method Name : allowCalWrite
	* @date
	:2016. 6. 15.
	* @description : 계산식 등록
	* @param spec : Allow allow,int allow_no
	* @return : String
	*/
	@RequestMapping("/allowCalWrite.htm")
	public String allowCalWrite(Allow allow,int allow_no) {
		
		allow.setAllow_no(allow_no);
		System.out.println(allow.getAllow_no());
		System.out.println(allow.getAllow_calcul());

		return empservice.updateAllowCal(allow);

	}
	
	/*
	* @method Name : allowCalWrite
	* @date
	:2016. 6. 15.
	* @description : view단에 수정할 사원정보 보내기
	* @param spec : int user_no, Model model
	* @return : String
	
	@RequestMapping("/allowCalWrite.htm")
	public String allowCalWrite(int allow_no, Model model) {
		Allow allow = empservice.updateAllowCal(allow_no);
		
		model.addAttribute("b",allow);
		return "emp/updateform";
	}*/
	
	/*
	* @method Name : allowResult
	* @date
	:2016. 6. 14.
	* @description : allowResult으로 이동
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/endCal.htm")
	public String endCal() {
		return "empop.endCal";

	}
	
	/*
	* @method Name : empList
	* @date
	:2016. 6. 18.
	* @description : view단에 모든 사원정보 보내기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/empList.htm")
	public String empList(Model model) {

		List<Allow_Basic> list = empservice.empList();

		model.addAttribute("list", list);
		
		return "empop.empList";
	}
	
	/*
	* @method Name : attiList
	* @date
	:2016. 6. 17.
	* @description : view단에 모든 근태 내역 내용 보여주기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/attiForm.htm")
	public String attiList(Model model) {

		List<Atti_List> list = empservice.attiList();

		model.addAttribute("list", list);
		
		List<Atti_Kind> list2 = empservice.atti_KindList();

		model.addAttribute("list2", list2);
		
		return "emp.attiForm";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/deptList.htm")
	public String dept_List(Model model) {

		List<Dept> list = empservice.dept_List();

		model.addAttribute("list", list);
		
		return "empop.deptList";
	}
	
	/*
	* @method Name : sal_ListWrite
	* @date
	:2016. 6. 20.
	* @description : empservice에 사원정보 보내기
	* @param spec : Sal_List sal_list
	* @return : String
	*/
	@RequestMapping("/sal_ListWrite.htm")
	public String sal_ListWrite(Sal_List sal_list) {

		return empservice.insertSal_List(sal_list);
	}
	
	/*
	* @method Name : retireList
	* @date
	:2016. 6. 18.
	* @description : retire단에 모든 사원정보 보내기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/retireList.htm")
	public String retireList(Model model) {

		List<Retire> list = empservice.retireList();

		model.addAttribute("list", list);
		
		return "emp.retire";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 모든 근태뽑기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/attiAllList.htm")
	public String attiAllList(Model model) {

		List<Atti> list = empservice.attiAllList();

		model.addAttribute("list", list);
		
		return "emp.list";
	}
	
	
	////////////////////////////////////////////////////
	@RequestMapping("/holidropUpdate.htm")
	public int holidropUpdateCal(Holi holi){
		int result = 0;
		try {
			result = empservice.updateHoli(holi);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	@RequestMapping("/ajaxholilist.htm")
	public void ajaxholilist(HttpServletResponse response,Principal principal){
		int emp_no = empservice.empno(principal);
		List<Holi> list = empservice.ajaxholilist(emp_no);

		ObjectMapper mapper = new ObjectMapper();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			response.getWriter().print(mapper.writeValueAsString(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@RequestMapping("/deleteholi.htm")
	public void deleteholi(Holi holi , HttpServletResponse response){
		int result = 0;
		try {
			result = empservice.deleteholi(holi);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		
		ObjectMapper mapper = new ObjectMapper();

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		try {
			response.getWriter().print(mapper.writeValueAsString(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	////////////////////////////////////////////////////
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/empAllow.htm")
	public String empAllow(Model model,String dept_name) {
		
		List<EmpAllow> list = empservice.empAllowList(dept_name);
		System.out.println(dept_name);
		System.out.println(list.get(0).getEmp_no());
		System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("dept_name", dept_name);
		
		return "empop.empAllow";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/empAllowList.htm")
	public String empAllowList(Model model,int emp_no) {
		
		List<Allow> list = empservice.allowFormList3();
		System.out.println("emp_no"+emp_no);
		model.addAttribute("list", list);
		model.addAttribute("emp_no", emp_no);

		System.out.println("list"+list.get(0).getAllow_calcul());
		System.out.println("list"+list.size());
		System.out.println(list.get(0).getAllow_name());
		
		
		return "empop.empAllowList";
	}
	
	/*
	* @method Name : inserEmpAllow
	* @date
	:2016. 6. 22.
	* @description : empservice에 사원정보 보내기
	* @param spec : Sal_List sal_list
	* @return : String
	*/
	@RequestMapping("/insertEmpAllow.htm")
	public String inserEmpAllow(Allow_History allow_history,int emp_no,int allow_no) {
		allow_history.setAllow_no(allow_no);
		allow_history.setEmp_no(emp_no);
		System.out.println("allow_no"+allow_history.getAllow_no());
		System.out.println("emp_no"+allow_history.getEmp_no());
		return empservice.insertEmpAllow(allow_history);
	}
	
	@RequestMapping("/test2.htm")
	public String test1(Model model,Principal principal) {
		principal.getName();
		return "emp.salSearch";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/eachSal.htm")
	public String eachSal(Model model,Principal principal) {
		System.out.println("principal1"+principal.getName());
		int emp_no=empservice.empno(principal);
		
		List<TotalSal> list1 = empservice.eachSal(emp_no);
		System.out.println(emp_no);
		System.out.println(list1.size());
		System.out.println(list1.get(0).getSal());

		model.addAttribute("sal", list1.get(0).getSal());
		
		List<EmpAllow> list2 = empservice.eachSalList(emp_no);
		model.addAttribute("list", list2);
		
		List<Allow> list3 = empservice.allowFormList();

		model.addAttribute("list3", list3);
		
		return "emp.eachSal";
	}
	
	/*
	* @method Name : list
	* @date
	:2016. 6. 20.
	* @description : 급여 리스트
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping("/totalSal.htm")
	public String totalSal(Model model,String dept_name) {
		
		List<TotalSal> list = empservice.totalSal(dept_name);
		System.out.println(dept_name);
		System.out.println(list.get(0).getSal());
		System.out.println(list.size());
		model.addAttribute("list", list);
		model.addAttribute("dept_name", dept_name);
		
		return "emp.sal";
	}
	

	/*
	* @method Name : allowForm
	* @date
	:2016. 6. 14.
	* @description : view단에 모든 수당 사항 보내기
	* @param spec : x
	* @return : String
	*/
	@RequestMapping("/salSearch.htm")
	public String salSearch(Model model) {
		
		List<Allow> list = empservice.allowFormList();
		System.out.println("allow list"+list.size());
		model.addAttribute("list", list);
		
		List<Sal_Search> list2 = empservice.sal_SearchList();
		System.out.println("Sal_Search list"+list2.size());
		model.addAttribute("list2", list2);
		
		List<User_name> list3 = empservice.User_name();
		System.out.println("User_name"+list3.size());
		model.addAttribute("list3", list3);
		
		return "empop.salSearch";

	}
	
	/*
	* @method Name : allowBasicDelete
	* @date
	:2016. 6. 20.
	* @description : 급여 사항 작성하기
	* @param spec : Allow_Basic allow_basic
	* @return : String
	*/
	@RequestMapping("/allowBasicDelete.htm")
	public String allowBasicDelete(int emp_no,Model model) {

		return empservice.deleteAllowBasic(emp_no);
	}
	
	/*
	* @method Name : allowBasicDelete
	* @date
	:2016. 6. 24.
	* @description : 급여 리스트 삭제
	* @param spec : int emp_no
	* @return : String
	*/
	@RequestMapping("/sal_ListDelete.htm")
	public String sal_ListDelete(int sal_list_no,Model model) {

		return empservice.sal_ListDelete(sal_list_no);
	}
	
	/*
	* @method Name : update
	* @date
	:2016. 6. 02.
	* @description : view단에 수정할 사원정보 보내기
	* @param spec : int user_no, Model model
	* @return : String
	*/
	@RequestMapping("/updateSal_List.htm")
	public int updateSal_List(int sal_list_no) {
	
		return empservice.updateSal_List(sal_list_no);
		
	}
	
	/*
	* @method Name : allowBasicDelete
	* @date
	:2016. 6. 20.
	* @description : 급여 사항 작성하기
	* @param spec : Allow_Basic allow_basic
	* @return : String
	*/
	 @RequestMapping("/atti_KindDelete.htm")
	public String atti_KindDelete(int atti_kind_no,Model model) {

		return empservice.atti_KindDelete(atti_kind_no);
	}

}
