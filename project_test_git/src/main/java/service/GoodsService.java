package service;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ericsson.research.trap.utils.UUID;

import DAO.EMPDAO;
import DAO.GoodsDAO;
import Goods.DTO.Cust;
import Goods.DTO.Cust_Acc;
import Goods.DTO.Data;
import Goods.DTO.Deliver;
import Goods.DTO.DetailDeli;
import Goods.DTO.ReqState;
import Goods.DTO.Reqlist;
import Goods.DTO.Request_Doc;
import Project.DTO.Project;

/*
* @FileName : GoodsService.java
* @Project : service
* @Date : 2016. 6. 19
*/

@Component
@Service
public class GoodsService {
	
	@Autowired
	private SqlSession sqlsession;

	/*
	* @method Name : getAlllist
	* @date :2016. 6. 19
	* @description : Request전체 리스트가져오기
	* @return : List<Request>
	*/
	public List<ReqState> getAlllist(int page) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<ReqState> alllist = goodsdao.getAllRequest(page);
		return alllist;
	}
	
	/*
	* @method Name : getEndlist
	* @date :2016. 6. 19
	* @description : Request 종결 리스트가져오기
	* @return : List<Request>
	*/
	public List<ReqState> getEndlist(int page) throws ClassCastException, SQLException {
		int appr_no = 5;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<ReqState> endlist = goodsdao.getPostPlist(appr_no, page);
		return endlist;
	}
	
	/*
	* @method Name : getInglist
	* @date :2016. 6. 19
	* @description : Request 진행중 리스트가져오기
	* @return : List<Request>
	*/
	public List<ReqState> getInglist(int page) throws ClassCastException, SQLException {
		int appr_no = 4;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<ReqState> inglist = goodsdao.getPostPlist(appr_no, page);
		return inglist;
	}
	
	/*
	 * @method Name : getPostlist
	 * @date :2016. 6. 20
	 * @description : 보류처리 리스트 가져오기
	 * @param spec : x
	 * @return : String
	 */
	/*public List<ReqState> getPostlist() {
		
		int appr_no = 6;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<ReqState> postlist = goodsdao.getReqState(appr_no);
		return postlist;
	}
	*/

	/*
	 * @method Name : getPostlist
	 * @date :2016. 6. 20
	 * @description : 보류처리 리스트 가져오기
	 * @param spec : x
	 * @return : String
	 */
	public List<ReqState> getPostlist(int page) throws ClassCastException, SQLException {
		int appr_no = 6;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getPostPlist(appr_no, page);
	}

	// 보류 리스트 갯수 세기
	public int getListCount() throws ClassNotFoundException, SQLException{
		int appr_no = 6;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getListCount(appr_no);
	}
	
	// 전체 리스트 갯수 세기
	public int getListCountAll() throws ClassNotFoundException, SQLException{
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getListCountAll();
	}

	// 종결리스트 갯수세기 appr_no = 5
	public int getEndCount() throws ClassNotFoundException, SQLException {
		int appr_no = 5;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getListCount(appr_no);
	}

	// 진행중 리스트 갯수  appr_no = 4 진행중
	public int getIngCount() throws ClassNotFoundException, SQLException {
		int appr_no = 4;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getListCount(appr_no);
	}
	/*
	* @method Name : regRequest
	* @date :2016. 6. 19
	* @description : 신규 주문 등록
	* @return : List<Request>
	*/
	/*public String regRequest(Request_Doc req) {
		
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.insertReq(req);
		System.out.println("신규등록 서비스 끝");
		
		return "redirect:reqlist.htm";
	}*/
	
	public String regRequest(Request_Doc req, Principal principal, Project project) {
		
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.insertReq(req);
		System.out.println("신규등록 서비스 끝 0626");
		
		// emp_reqDoc에 등록해야함 ( request_no, emp_no)
		// int empno(String user_id); 사용
		EMPDAO empDao = sqlsession.getMapper(EMPDAO.class);
		int emp_no = empDao.empno(principal.getName());
		int request_no = goodsdao.selectReqNo(req.getRequest_name());
		
		// 주문리스트에 등록해야함
		int result_list = goodsdao.insertReqlist(request_no, project.getProject_no(), project.getProject_name());
		System.out.println("값이 잘 들어 갔니? 리스트에 " + result_list);
		
		int result = goodsdao.insertReqDoc(request_no, emp_no);
		System.out.println("emp_reqDoc 확인 : " + result);
		
		return "redirect:reqlist.htm";
	}
	
	/*
	 * @method Name : detailReq
	 * @date :2016. 6. 19
	 * @description : 주문정보 가져오기
	 * @param spec : int request_no
	 * @return : Request_Doc
	 */
	// 종결 클릭시 정보 받아서 넘겨주기
	public Request_Doc detailReq(int request_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		Request_Doc reqdto = goodsdao.getReq(request_no);
		
		return reqdto;
	}

	/*
	 * @method Name : updateReq
	 * @date :2016. 6. 19
	 * @description : 주문정보 수정하기
	 * @param spec : int request_no
	 * @return : Request_Doc
	 */
	public String updateReq(Request_Doc req) throws ClassNotFoundException, SQLException {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.updateReq(req);
		System.out.println("서비스에서 가져온거 확인 : " + req.getRequest_cont());
		
		return "redirect:reqlist.htm";
	}
	

	/*
	 * @method Name : changeReqPospone
	 * @date :2016. 6. 20
	 * @description : 승인을 보류처리로 변경
	 * @param spec : int request_no
	 * @return : String
	 */
	public String changeReqPospone(int request_no) {
		int appr_no = 6; // 보류가 6임
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.changeReqAppr(appr_no, request_no);
		return "redirect:reqlist.htm";
	}
	
	/*
	 * @method Name : changeReqEnd
	 * @date :2016. 6. 20
	 * @description : 승인을 종결처리로 변경
	 * @param spec : int request_no
	 * @return : String
	 */
	public String changeReqEnd(int request_no) {
		System.out.println("종결처리로 상태 변경");
		int appr_no = 5;
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.changeReqAppr(appr_no, request_no);
		return "redirect:reqlist.htm";
	}
	
	
	// ############################## 거래처 ########################
	/*
	 * @method Name : custlist
	 * @date :2016. 6. 8
	 * @description : 거래처리스트
	 * @param spec : x
	 * @return : List<Cust>
	 */
	public List<Cust> custlist(int page) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<Cust> list = goodsdao.getAllCust(page);
		
		return list;
	}

	/*
	 * @method Name : custModi
	 * @date :2016. 6. 8
	 * @description : 거래처수정
	 * @param spec : Cust cust
	 * @return : String
	 */
	public String custModi(Cust cust) throws ClassNotFoundException, SQLException {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.updateCust(cust);
		return "redirect:custlist.htm";
	}

	/*
	 * @method Name : changeCustState
	 * @date :2016. 6. 10
	 * @description : 거래처 삭제시 상태변경
	 * @param spec : int cust_no
	 * @return : List<Cust>
	 */
	public String changeCustState(int cust_no) {
		
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.changeCustState(cust_no);
		return "redirect:custlist.htm";
	}
	
	/*
	 * @method Name : detailCust
	 * @date :2016. 6. 8
	 * @description : 거래처 상세보기
	 * @param spec : int cust_no
	 * @return : String
	 */
	public Cust detailCust(int cust_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		Cust cust = goodsdao.getCust(cust_no);
		return cust;
	}

	/*
	 * @method Name : regCust
	 * @date :2016. 6. 8
	 * @description : 거래처 등록
	 * @param spec : Cust cust
	 * @return : String
	 */
	public String regCust(Cust cust) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.insertCust(cust);
		return "redirect:custlist.htm";
	}
	
	/*
	 * @method Name : custAcclist
	 * @date :2016. 6. 8
	 * @description : 거래처 통장 리스트
	 * @return : List<Cust_Acc>
	 */
	public List<Cust_Acc> custAcclist(int page) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<Cust_Acc> list = goodsdao.getAllCustAc(page);
		return list;
	}

	/*
	 * @method Name : custAccModi
	 * @date :2016. 6. 8
	 * @description : 거래처 통장수정
	 * @param spec : Cust_Acc custacc
	 * @return : String
	 */
	public String custAccModi(Cust_Acc custacc) throws ClassNotFoundException, SQLException {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.updateCustAc(custacc);
		
		return "redirect:custacclist.htm";
	}

	/*
	 * @method Name : delCustAcc
	 * @date :2016. 6. 8
	 * @description : 거래처 통장삭제
	 * @param spec : int cust_acc_no
	 * @return : String
	 */
	public String delCustAcc(int cust_acc_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.delCustAc(cust_acc_no);
		return "redirect:custacclist.htm";
	}

	/*
	 * @method Name : detailCustAcc
	 * @date :2016. 6. 8
	 * @description : 거래처통장 상세보기
	 * @param spec : int cust_acc_no
	 * @return : String
	 */
	public Cust_Acc detailCustAcc(int cust_acc_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		Cust_Acc custacc = goodsdao.getCustAc(cust_acc_no);
		return custacc;
	}

	/*
	 * @method Name : regCustAcc
	 * @date :2016. 6. 8
	 * @description : 거래처 통장 등록
	 * @param spec : Cust_Acc custacc
	 * @return : String
	 */
	public String regCustAcc(Cust_Acc custacc) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.insertCustAc(custacc);
		
		return "redirect:custacclist.htm";
	}

	/*
	 * @method Name : searchCust
	 * @date :2016. 6. 9
	 * @description : 거래처 검색
	 * @param spec : String search
	 * @return : List<Cust>
	 */
	public List<Cust> searchCust(String search) {
		
		String name = "cust_name";
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<Cust> list = goodsdao.searchCust(name, search);
		
		return list;
	}

	/*
	 * @method Name : uploadFile
	 * @date :2016. 6. 22
	 * @description : 파일올리기
	 * @param spec : Data data, MultipartHttpServletRequest request
	 * @return : String
	 */
	public String uploadFile(Data data, MultipartHttpServletRequest request) throws IllegalStateException, IOException {
		
		String uploadpath = request.getSession().getServletContext().getRealPath("resources/upload_file");
		
		File dir = new File(uploadpath);
		if(!dir.isDirectory()){
			// 파일저장될 디렉토리 없음 만들기
			dir.mkdirs();
		}
		
		// 넘어온 파일 리스트로 저장
		List<MultipartFile> flist = request.getFiles("file");
		
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
				
				data.setOrign_name(orign_file);
				data.setSave_name(save_file);
				
				String save_path = uploadpath +	"\\" + save_file;
				
				System.out.println("파일 저장 경로 확인 : " + save_path);
				
				flist.get(i).transferTo(new File(save_path)); // 파일저장
				
				 GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
				 goodsdao.uploadFile(data);
			}
		}
		return "redirect:openFilelist.htm";
	}

	// 파일리스트 열기
	public List<Data> openFilelist(int page) {
	     GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		 List<Data> dlist = goodsdao.openFlist(page);
		 return dlist;
	}

	// 파일 삭제
	public String delFile(int data_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.delFile(data_no);
		return "redirect:openFilelist.htm";
	}
	
	// 파일 갯수 세기
	public int getFileCount() throws ClassNotFoundException, SQLException {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getFileCount();
	}

	// 고객 갯수 세기
	public int getCustCount() throws ClassNotFoundException, SQLException {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getCustCount();
	}

	// 거래처 통장 갯수 세기
	public int getCustAccCount() throws ClassNotFoundException, SQLException {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getCustAccCount();
	}

	// 납품명세서 입력하기
	public String insertDeliver(Deliver deliver) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.insertDeliver(deliver);
		
		return "redirect:deliverlist.htm"; 
	}

	// 납품명세서 리스트
	public List<Deliver> deliverlist(int page) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<Deliver> list = goodsdao.getAllDeliver(page);
		
		return list;
	}

	// 납품명세서 총 갯수 세기
	public int getDeliCount() {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		return goodsdao.getDeliCount();
	}

	// 납품물품내역 상세보기 
	public DetailDeli getDeliver(int request_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		
		return goodsdao.getDetailDeli(request_no);
	}

	// 주문 문서 등록
	/*public List<Request_Doc> searchReq(String search) {
		String name = "request_name";
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<Request_Doc> list = goodsdao.searchReq(name, search);
		
		return list;
	}*/

	// 납품문서 삭제시 상태 변경
	public String delDeli(int deliver_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		goodsdao.delDeliver(deliver_no);
		
		return "redirect:deliverlist.htm";
	}

	// 주문문서 등록시 프로젝트 검색
	public List<Project> searchPro(String search1, String search2) {
		
		System.out.println("service 에서 받은 값 확인 : " + search1 + " " + search2);
		
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		List<Project> list = goodsdao.searchPro(search1, search2);
		
		return list;
	}

	// 프로젝트 리스트 가져오기 
	public Project getProject(int project_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		Project pro = goodsdao.getProject( project_no);
		System.out.println("서비스에서 디테일 프로젝트 가져옴 ");
		
		return pro;
	}

	// request_no에 해당하는 request list 가져오기
	public Reqlist getProlist(int request_no) {
		GoodsDAO goodsdao = sqlsession.getMapper(GoodsDAO.class);
		Reqlist reqlist = goodsdao.getReqlist(request_no);
		return reqlist;
	}


}
