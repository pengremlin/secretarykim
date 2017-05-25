package controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import Goods.DTO.Cust;
import Goods.DTO.Cust_Acc;
import Goods.DTO.Data;
import Goods.DTO.Deliver;
import Goods.DTO.DetailDeli;
import Goods.DTO.ReqState;
import Goods.DTO.Reqlist;
import Goods.DTO.Request_Doc;
import Project.DTO.Project;
import service.GoodsService;

/*
* @FileName : GoodsController.java
* @Project : controller
* @Date : 2016. 06. 18
*/

@Controller
@RequestMapping("/goods/")
public class GoodsController {
	
	@Autowired
	private GoodsService goodservice;
	
	@Autowired
	private View jsonView;
	
	/*
	* @method Name : requestList
	* @date :2016. 06. 19
	* @description : 주문물품내역 페이지 보여주기
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping(value="reqlist.htm")
	public ModelAndView requestListP(String pg, String pg2, String pg3, String pg4) throws ClassCastException, SQLException, ClassNotFoundException{
		
		// ############################## 보류처리 appr_no =6  #######################################
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		// 페이지 처리 보류리스트
		List<ReqState> postlist = goodservice.getPostlist(page);
		// 보류리스트 갯수 세기
		int postCount = goodservice.getListCount();
		
		maxpage = (int) ((double) postCount / 5 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		// ############################ 전체리스트  ######################
		int page2 = 1;
		int startpage2 = 0;
		int endpage2 = 0;
		int maxpage2 = 0;
		
		if(pg2 != null){
			System.out.println("전체에서 확인 : " + pg2 );
			page2 = Integer.parseInt(pg2);
			System.out.println("변환된 : " + page2);
		}
		
		// 페이지 처리 전체리스트
		List<ReqState> alllist = goodservice.getAlllist(page2);
		//System.out.println("all list : " + alllist.get(0).getAppr_name());
		// 전체리스트 갯수 세기
		int allCount = goodservice.getListCountAll();
		
		maxpage2 = (int) ((double) allCount / 5 + 0.95);
		System.out.println("max2 : " + maxpage2);
		startpage2 = (((int) ((double) page2 / 10 + 0.9)) - 1) * 10 + 1; //1 10
		endpage2 = startpage2 + 10 - 1;

		if (endpage2 > maxpage2) {
			endpage2 = maxpage2;
		}
		
		//  ######################### 진행중리스트 appr_no  = 4   ############################
		int page3 = 1;
		int startpage3 = 0;
		int endpage3 = 0;
		int maxpage3 = 0;
		
		if(pg3 != null){
			page3 = Integer.parseInt(pg3);
		}
		
		// 페이지 처리 진행중리스트
		List<ReqState> inglist = goodservice.getInglist(page3);
		
		// 진행중리스트 갯수 세기
		int ingCount = goodservice.getIngCount();
		
		maxpage3 = (int) ((double) ingCount / 5 + 0.95);
		startpage3 = (((int) ((double) page3 / 10 + 0.9)) - 1) * 10 + 1;
		endpage3 = startpage3 + 10 - 1;

		if (endpage3 > maxpage3) {
			endpage3 = maxpage3;
		}
		
		// 3################### 종결리스트 appr_no = 5 ###################################3
		int page4 = 1;
		int startpage4 = 0;
		int endpage4 = 0;
		int maxpage4 = 0;
		
		if(pg4 != null){
			page4 = Integer.parseInt(pg4);
		}
		
		// 페이지 처리 종결리스트
		List<ReqState> endlist = goodservice.getEndlist(page4);
		// 종결리스트 갯수 세기
		int endCount = goodservice.getEndCount();
		
		maxpage4 = (int) ((double) endCount / 5 + 0.95);
		startpage4 = (((int) ((double) page4 / 10 + 0.9)) - 1) * 10 + 1;
		endpage4 = startpage4 + 10 - 1;

		if (endpage4 > maxpage4) {
			endpage4 = maxpage4;
		}
		
		ModelAndView mav = new ModelAndView("goods.reqlist");
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		
		// 전체 페이지
		mav.addObject("page2", page2);
		mav.addObject("maxpage2", maxpage2);
		mav.addObject("startpage2", startpage2);
		mav.addObject("endpage2", endpage2);
		
		// 진행중 페이지
		mav.addObject("page3", page3);
		mav.addObject("maxpage3", maxpage3);
		mav.addObject("startpage3", startpage3);
		mav.addObject("endpage3", endpage3);
		
		// 종결 페이지
		mav.addObject("page4", page4);
		mav.addObject("maxpage4", maxpage4);
		mav.addObject("startpage4", startpage4);
		mav.addObject("endpage4", endpage4);
		
		mav.addObject("postlist", postlist);
		mav.addObject("alllist", alllist);
		mav.addObject("inglist", inglist);
		mav.addObject("endlist", endlist);
		
 		return mav;
	}
	
	/*
	* @method Name : regReq
	* @date :2016. 06. 19
	* @description : 신규주문등록 페이지
	* @param spec : Model model
	* @return : String
	*/
	@RequestMapping(value="/newreg.htm")
	public String regReqP(){
		System.out.println("페이지 컨트롤러");
		return "goods.regreq";
	}
	
	/*
	* @method Name : regReq
	* @date :2016. 06. 19
	* @description : 신규주문등록 
	* @param spec : Request_Doc req
	* @return : String
	*/
	
	@RequestMapping(value="/newreg.htm", method=RequestMethod.POST)
	public String regReq(@RequestParam("before_pay") String before_pay, Request_Doc req, Principal principal,
			Project project){
		
		System.out.println("입력된 값 확인 : " + before_pay);
		System.out.println("가져온 data번호 확인 : " + req.getData_no());
		
		String[] remove_comma = before_pay.split(",");
		
		String result = "";
		for(int i=0; i < remove_comma.length; i++ ){
			result += remove_comma[i];
		}
		
		System.out.println("result : " + result);
		int expact_pay = Integer.parseInt(result);
		
		req.setExpact_pay(expact_pay);
		
		System.out.println("변경된 값 확인 : " + req.getExpact_pay());
		System.out.println("신규주문 내역 작성");
		
		System.out.println("사용자가 클릭한거 가져온 값 확인 : " + project.getProject_name() + " " + project.getProject_no());
		
		return goodservice.regRequest(req, principal, project);
	}
	
	/*
	* @method Name : modiReqP
	* @date :2016. 06. 19
	* @description : 수정할 내역 정보 가져와서 페이지에 뿌려주기
	* @param spec : int request_no, Model model
	* @return : String
	*/
	@RequestMapping(value="/modiReq.htm", method=RequestMethod.GET)
	public String modiReqP(@RequestParam("request_no") int request_no, Model model){
		System.out.println("주문 내역 수정 페이지로 넘어가야함. 사용자가 요청한 정보가지고");
		System.out.println("가져온 번호 우선 확인 : " + request_no);
		
		Request_Doc reqdto = goodservice.detailReq(request_no);
		
		// request_no에 해당하는 프로젝트 정보 가져오기 
		Reqlist reqlist = goodservice.getProlist(request_no);
		// emp_no 가져오기 
		System.out.println("가져온 이름 확인 : " + reqdto.getRequest_name());
		model.addAttribute("reqdto", reqdto);
		model.addAttribute("reqlist", reqlist);
		
		
		return "goods.detailreq";
	}
	
	/*
	* @method Name : modiReq
	* @date :2016. 06. 19
	* @description : 신규주문등록 
	* @param spec : Request_Doc req
	* @return : String
	*/
	@RequestMapping(value="/modiReq.htm", method=RequestMethod.POST)
	public String modiReq(Request_Doc req) throws ClassNotFoundException, SQLException{
		System.out.println("주문 내역 수정 컨트롤러 ");
		System.out.println("수정된 파일 번호 확인 : " + req.getData_no());
		System.out.println("0625 수정 내용 확인 : " + req.getRequest_cont());
		
		return goodservice.updateReq(req);
	}
	
	/*
	* @method Name : chReqPostpone
	* @date :2016. 06. 20
	* @description : 승인을 보류처리로 변경 
	* @param spec : int request_no
	* @return : String
	*/
	@RequestMapping(value="/changeReqPostponse.htm")
	public String chReqPostpone(@RequestParam("request_no") int request_no){
		System.out.println("승인을 보류 처리 사용자가 요청한 정보가지고");
		System.out.println(" 보류는 appr_no = 6");
		System.out.println("가져온 번호 우선 확인 : " + request_no);
		
		return goodservice.changeReqPospone(request_no);
	}
	
	/*
	* @method Name : chReqEnd
	* @date :2016. 06. 20
	* @description : 승인을 종결처리로 변경 
	* @param spec : int request_no
	* @return : String
	*/
	@RequestMapping(value="/changeReqEnd.htm")
	public String chReqEnd(@RequestParam("request_no") int request_no){
		System.out.println("승인을 종결 처리 사용자가 요청한 정보가지고");
		System.out.println(" 보류는 appr_no = 5");
		System.out.println("가져온 번호 우선 확인 : " + request_no);
		
		return goodservice.changeReqEnd(request_no);
	}
	
	
	// ############################### 거래처 ##############################
	/*
	 * @method Name : custList
	 * @date :2016. 06. 08
	 * @description : 거래처 리스트
	 * @param spec : Model model
	 * @return : String
	 */
	@RequestMapping("/custlist.htm")
	public ModelAndView custList(String pg) throws ClassNotFoundException, SQLException {

		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		// 페이지 처리 보류리스트
		List<Cust> list = goodservice.custlist(page);
		// 보류리스트 갯수 세기
		int custCount = goodservice.getCustCount();
		
		maxpage = (int) ((double) custCount / 5 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		ModelAndView mav = new ModelAndView("goods.custlist");
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("list", list);

		return mav;
	}

	/*
	 * @method Name : custModi
	 * @date :2016. 6. 8
	 * @description : cust Modi
	 * @param spec : Sell sell
	 * @return : String
	 */
	@RequestMapping(value = "/custModi.htm")
	public String custModi(Cust cust) throws SQLException, ClassNotFoundException {

		System.out.println(" cust Modi controller ");
		
		return goodservice.custModi(cust);
	}

	/*
	 * @method Name : custDel
	 * @date :2016. 06. 8
	 * @description : 거래처 삭제요청
	 * @param spec : int cust_no
	 * @return : String
	 */
	@RequestMapping(value = "/custDel.htm")
	public String custDel(int cust_no) {
		return  goodservice.changeCustState(cust_no);
	}

	/*
	 * @method Name : detailCust
	 * @date :2016. 06. 08
	 * @description : detail cust
	 * @param spec : Model model, int cust_no
	 * @return : View
	 */
	@RequestMapping(value = "/detailCust.htm", method = RequestMethod.POST)
	public View detailCust(@RequestParam("cust_no") int cust_no, ModelMap map) {
		
		System.out.println("detail controller : cust_no : " + cust_no);
		Cust cust = goodservice.detailCust(cust_no);
		map.addAttribute("dto", cust);

		return jsonView;
	}

	/*
	 * @method Name : regCustP
	 * @date :2016. 06. 08
	 * @description : 거래처요청페이지
	 * @return : String
	 */
	@RequestMapping(value = "/regCust.htm", method = RequestMethod.GET)
	public String regCustP() {
		
		return "goods.custreg";
	}

	/*
	 * @method Name : regCust
	 * @date :2016. 06. 08
	 * @description : cust register request
	 * @param spec : Cust cust
	 * @return : String
	 */
	@RequestMapping(value = "/regCust.htm", method = RequestMethod.POST)
	public String regCust(Cust cust) {
		System.out.println("cust register request controller");

		return goodservice.regCust(cust);
	}
		
	// ############################### cust_acc 거래처 통장 ##############################
	/*
	 * @method Name : custAccList
	 * @date :2016. 06. 08
	 * @description : show custacclist
	 * @param spec : Model model
	 * @return : String
	 */
	@RequestMapping("/custacclist.htm")
	public ModelAndView custAccList(String pg) throws ClassNotFoundException, SQLException {

		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		// 페이지 처리 보류리스트
		List<Cust_Acc> list = goodservice.custAcclist(page);
		// 보류리스트 갯수 세기
		int custAccCount = goodservice.getCustAccCount();
		
		maxpage = (int) ((double) custAccCount / 5 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		ModelAndView mav = new ModelAndView("goods.custacclist");
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("list", list);
		
		return mav;
	}

	/*
	 * @method Name : custAccModi
	 * @date :2016. 6. 8
	 * @description : custacc Modi
	 * @param spec : Cust_Acc custacc
	 * @return : String
	 */
	@RequestMapping(value = "/custaccModi.htm")
	public String custAccModi(Cust_Acc custacc) throws SQLException, ClassNotFoundException {

		System.out.println("custacc Modi controller ");
		System.out.println("custacc Modi " + custacc.getCust_acc_bank());

		return goodservice.custAccModi(custacc);
	}

	/*
	 * @method Name : custaccDel
	 * @date :2016. 06. 8
	 * @description : Delete cust acc
	 * @param spec : int cust_acc_no
	 * @return : String
	 */
	@RequestMapping(value = "/custaccDel.htm")
	public String custaccDel(int cust_acc_no) {
		System.out.println("controller Delete cust acc : " + cust_acc_no);

		return goodservice.delCustAcc(cust_acc_no);
	}

	/*
	 * @method Name : detailCustAcc
	 * @date :2016. 06. 08
	 * @description : show detail cust_acc
	 * @param spec : Model model, int cust_acc_no
	 * @return : View
	 */
	@RequestMapping(value = "/detailCustAcc.htm", method = RequestMethod.POST)
	public View detailCustAcc(@RequestParam("cust_acc_no") int cust_acc_no, ModelMap map) {

		System.out.println("0626 jsp send cust_acc_no : " + cust_acc_no);

		Cust_Acc custacc = goodservice.detailCustAcc(cust_acc_no);

		map.addAttribute("dto", custacc);

		return jsonView;
	}

	/*
	 * @method Name : regCustAccP
	 * @date :2016. 06. 08
	 * @description : show cust_acc page
	 * @return : String
	 */
	@RequestMapping(value ="/regCustAcc.htm", method = RequestMethod.GET)
	public String regCustAccP() {
		System.out.println("controller cust_acc page");
		return "goods.custaccreg";
	}

	/*
	 * @method Name : regCustAcc
	 * @date :2016. 06. 08
	 * @description : register cust_acc request
	 * @param spec : Cust_Acc custacc
	 * @return : String
	 */
	@RequestMapping(value ="/regCustAcc.htm", method = RequestMethod.POST)
	public String regCustAcc(Cust_Acc custacc) {
		System.out.println("register cust_acc request controller");
		return goodservice.regCustAcc(custacc);
	}
	
	/*
	 * @method Name : searchCust
	 * @date :2016. 06. 09
	 * @description : search cust with cust_name
	 * @param spec : String search, Model model
	 * @return : View
	 */
	@RequestMapping(value= "/searchCust.htm", method=RequestMethod.POST)
	public View searchCust(@RequestParam("search") String search, Model model){
		
		System.out.println("search cust with cust_name controller");
		List<Cust> lists = goodservice.searchCust(search);
		model.addAttribute("list", lists);
		
		return jsonView;
	}
	
	
	// 파일업로드
	@RequestMapping(value="/uploadFile.htm", method=RequestMethod.POST)
	public String fileReg(Data data, MultipartHttpServletRequest request) throws IllegalStateException, IOException{
		
		return goodservice.uploadFile(data, request);
	}
	
	// 파일리스트 열기
	@RequestMapping(value="openFilelist.htm")
	public ModelAndView openFlist(String pg) throws ClassNotFoundException, SQLException{
		
		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		// 파일리스트 페이지 처리
		List<Data> dlist = goodservice.openFilelist(page);
		// 파일리스트 총 갯수 세기
		int fileCount = goodservice.getFileCount();
		
		maxpage = (int) ((double) fileCount / 5 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		ModelAndView mav = new ModelAndView("goods.filelist");
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("dlist", dlist);
		
		return mav;
		
	}
	
	/*
	* @method Name : delFile
	* @date :2016. 06. 22
	* @description : 파일삭제시 상태 변경
	* @param spec : int data_no
	* @return : String
	*/
	@RequestMapping(value="delFile.htm")
	public String delFile(@RequestParam("data_no") int data_no){
		
		return goodservice.delFile(data_no);
	}
	
	
	
	/*
	* @method Name : downFile
	* @date :2016. 06. 23
	* @description : 파일 다운로드
	* @param spec : HttpServletRequest request, HttpServletResponse response
	* @return : void
	*/
	@RequestMapping(value="downFile.htm")
	public void downFile(HttpServletRequest request, HttpServletResponse response) throws Exception{
		//===전달 받은 정보를 가지고 파일객체 생성(S)===//
		
		String save_name = request.getParameter("save_name"); //저장된 파일이름
		String orign_name = request.getParameter("orign_name"); //원래 파일이름
		//orign_name = new String(orign_name.getBytes("ISO8859_1"),"UTF-8"); 
		//서버설정(server.xml)에 따로 인코딩을 지정하지 않았기 때문에 get방식으로 받은 값에 대해 인코딩 변환

		System.out.println("원본파일 : " + orign_name);
		System.out.println("저장파일 : " + save_name);
		
		//웹사이트 루트디렉토리의 실제 디스크상의 경로 알아내기.
		String path = request.getServletContext().getRealPath("resources/upload_file");
		String fullPath = path+"\\"+save_name;
		
		System.out.println("fullPath : "  + fullPath);
		File downloadFile = new File(fullPath);
		
		//파일 사이즈 지정
		response.setContentLength((int)downloadFile.length());
		
		//다운로드 창을 띄우기 위한 헤더 조작
		response.setContentType("application/octet-stream; charset=utf-8");
		response.setHeader("Content-Disposition", "attachment;filename="
										+ new String(orign_name.getBytes(), "ISO8859_1"));
		
		response.setHeader("Content-Transfer-Encoding","binary");
		
		FileInputStream fin = new FileInputStream(downloadFile);
		ServletOutputStream sout = response.getOutputStream();

		byte[] buf = new byte[1024];
		int size = -1;

		while ((size = fin.read(buf, 0, buf.length)) != -1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();
	}
	
	/*
	* @method Name : regDeliverP
	* @date :2016. 06. 23
	* @description : 납품내역 등록 페이지 요청
	* @param spec : x
	* @return : String
	*/
	@RequestMapping(value="deliverreg.htm")
	public String regDeliverP(@RequestParam("request_no") int request_no, Model model){
		System.out.println("납품 등록 페이지 요청 컨트롤러 : " + request_no);
		
		// 납품등록 요청 페이지 하면 페이지 보여줘야함
		if(request_no < 0){
			request_no = 0;
		}
		
		Request_Doc reqdto = goodservice.detailReq(request_no);
		
		
		if(reqdto != null){
			model.addAttribute("deliver_name", reqdto.getRequest_name());
			model.addAttribute("request_no", reqdto.getRequest_no());
			model.addAttribute("cust_no", reqdto.getCust_no());
			model.addAttribute("before_pay", reqdto.getExpact_pay());
			model.addAttribute("end_date", reqdto.getEnd_date());
			return "goods.deliverreg";	
		}
		return "goods.deliverreg";	
	}
	
	/*
	* @method Name : regDeliver
	* @date :2016. 06. 23
	* @description : 납품내역 등록 
	* @param spec : x
	* @return : String
	*/
	@RequestMapping(value="deliverreg.htm", method=RequestMethod.POST)
	public String regDeliver(@RequestParam("before_deliver") String before, Deliver deliver){

		System.out.println("입력된 값 확인 : " + before);
		
		String[] remove_comma = before.split(",");
		
		String result = "";
		for(int i=0; i < remove_comma.length; i++ ){
			result += remove_comma[i];
		}
		
		System.out.println("result : " + result);
		int deliver_pay = Integer.parseInt(result);
		
		deliver.setDeliver_pay(deliver_pay);
		
		System.out.println("변경된 값 확인 : " + deliver.getDeliver_pay());
		System.out.println("신규납품 내역 작성");
		
		return goodservice.insertDeliver(deliver);
	}
	
	
	/*
	* @method Name : sendDeliver
	* @date :2016. 06. 23
	* @description : 납품내역 등록시 주문명세서 상세보기
	* @param spec : int request_no, ModelMap map
	* @return : View
	*/
	@RequestMapping(value="/detailReq.htm", method=RequestMethod.GET)
	public String sendDeliver(@RequestParam("request_no") int request_no, ModelMap map){
		
		System.out.println("종결 ajax jsp에서 넘긴 request_no : " + request_no);
		
		Request_Doc reqdto = goodservice.detailReq(request_no);
		
		map.addAttribute("dto", reqdto);
		
		return "goods.nonModiDetailReq";
	}
	
	/*
	* @method Name : deliverList
	* @date :2016. 06. 23
	* @description :납품명세서 보기
	* @param spec : int request_no, ModelMap map
	* @return : View
	*/
	@RequestMapping(value="/deliverlist.htm")
	public ModelAndView deliverList(String pg) throws ClassNotFoundException, SQLException {

		int page = 1;
		int startpage = 0;
		int endpage = 0;
		int maxpage = 0;
		
		if(pg != null){
			page = Integer.parseInt(pg);
		}
		
		// 페이지 처리 보류리스트
		List<Deliver> list = goodservice.deliverlist(page);
		// 보류리스트 갯수 세기
		int deliCount = goodservice.getDeliCount();
		
		maxpage = (int) ((double) deliCount / 5 + 0.95);
		startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		endpage = startpage + 10 - 1;

		if (endpage > maxpage) {
			endpage = maxpage;
		}
		
		ModelAndView mav = new ModelAndView("goods.deliverlist");
		mav.addObject("page", page);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("list", list);

		return mav;
	}
	
	/*
	* @method Name : detailDeliver
	* @date :2016. 06. 23
	* @description :납품명세서 상세 보기
	* @param spec : int deliver_no, Model model
	* @return : String
	*/
	@RequestMapping(value="detailDeliver.htm")
	public String detailDeliver(@RequestParam("request_no") int request_no, Model model){
		System.out.println("가져온 값 확인 : " + request_no);
		
		DetailDeli dto = goodservice.getDeliver(request_no);
		System.out.println("이름 확인 : " + dto.getDeliver_name());
		
		model.addAttribute("dto", dto);
		
		return "goods.detaildeliver";
	}
	
	/*
	* @method Name : searchReq
	* @date :2016. 06. 23
	* @description :주문문서 검색
	* @param spec : String search, Model model
	* @return : String
	*/
	/*@RequestMapping(value= "/searchReq.htm", method=RequestMethod.POST)
	public View searchReq(@RequestParam("search") String search, Model model){
		
		List<Request_Doc> lists = goodservice.searchReq(search);
		model.addAttribute("list", lists);
		
		return jsonView;
	}*/
	
	/*
	* @method Name : detailReq
	* @date :2016. 06.24
	* @description : 수정할 수 없는 주문 문서
	* @param spec : int request_no, Model model
	* @return : String
	*/
	@RequestMapping(value="/nondetailReq.htm")
	public String detailReq(@RequestParam("request_no") int request_no, Model model){
		
		Request_Doc dto = goodservice.detailReq(request_no);
		model.addAttribute("dto", dto);
		
		return "goods.nonModiDetailReq";
	}
	
	/*
	* @method Name : delDeliver
	* @date :2016. 06. 24
	* @description : 납품문서 삭제시 상태변경
	* @param spec : int deliver_no
	* @return : String
	*/
	@RequestMapping(value="/deldeliver.htm")
	public String delDeliver(@RequestParam("deliver_no") int deliver_no){
		
		return goodservice.delDeli(deliver_no);
	}
	
	/*
	 * @method Name : searchPro
	 * @date :2016. 06. 25
	 * @description : search cust with cust_name
	 * @param spec : String search, Model model
	 * @return : View
	 */
	@RequestMapping(value= "/searchPro.htm", method=RequestMethod.POST)
	public View searchPro(@RequestParam("search1") String search1, 
							@RequestParam("search2") String search2,Model model){
		
		System.out.println("search pro with cust_name controller");
		
		List<Project> list = goodservice.searchPro(search1, search2);
		model.addAttribute("list", list);
		
		return jsonView;
	}
	
	@RequestMapping(value= "/getProDetail.htm", method=RequestMethod.POST)
	public View getProject(@RequestParam("project_no") int project_no, Model model){
		
		System.out.println("project 가져오기");
		
		Project pro = goodservice.getProject(project_no);
		model.addAttribute("pro", pro);
		
		System.out.println("json 에러인가 ? ");
		
		return jsonView;
	}
	
}
