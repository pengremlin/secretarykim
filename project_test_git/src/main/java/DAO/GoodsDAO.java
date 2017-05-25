package DAO;

import java.sql.SQLException;
import java.util.List;

import Goods.DTO.Cust;
import Goods.DTO.Cust_Acc;
import Goods.DTO.Data;
import Goods.DTO.Deliver;
import Goods.DTO.DetailDeli;
import Goods.DTO.ReqState;
import Goods.DTO.Reqlist;
import Goods.DTO.Request_Doc;
import Project.DTO.Project;

public interface GoodsDAO {
	
	// 주문상태 전체리스트 가져오기
	List<ReqState> getAllRequest(int page);

	// 주문상태 그외의 리스트 가져오기(진행중 4, 종결 5 보류 6)
	List<ReqState> getReqState(int appr_no);
	
	// 주문내역 입력하기
	int insertReq(Request_Doc req);

	// 주문내역 삭제 버튼눌렀을때 상태변경
	int changeReqState(int request_no);
		
	// 주문내역 상세 보기
	Request_Doc getReq(int request_no);
	
	// 주문내역 수정
	int updateReq(Request_Doc req) throws ClassNotFoundException,SQLException;

	// 주문리스트(진행중)에서 승인변경
	int changeReqAppr(int appr_no, int request_no);

	// ###################### 거래처 ##########################################
	// 거래처리스트 가져오기
	List<Cust> getAllCust(int page);

	// 거래처등록
	int insertCust(Cust cust);

	// 거래처 삭제 버튼 누를떄 거래처 상태 변경하기
	int changeCustState(int cust_no);

	// 거래처 정보가져오기
	Cust getCust(int cust_no);

	// 거래처수정
	int updateCust(Cust cust) throws ClassNotFoundException, SQLException;

	// ###################### 거래처 통장 ##########################################
	// 거래처 통장리스트 가져오기
	List<Cust_Acc> getAllCustAc(int page);

	// 거래처 통장등록
	int insertCustAc(Cust_Acc custacc);

	// 거래처 통장삭제
	int delCustAc(int cust_acc_no);

	// 거래처 통장정보가져오기
	Cust_Acc getCustAc(int cust_acc_no);

	// 거래처통장수정
	int updateCustAc(Cust_Acc custacc) throws ClassNotFoundException, SQLException;

	// ####### 거래처 검색 #########
	List<Cust> searchCust(String name, String search);

	// 페이지 처리 보류리스트
	List<ReqState> getPostPlist(int appr_no, int page) throws ClassCastException, SQLException;

	// 페이지수 세기
	int getListCount(int appr_no) throws ClassNotFoundException, SQLException;

	// 전체 페이지수 세기
	int getListCountAll();

	// 멀티 파일 등록
	int uploadFile(Data data);

	// 파일리스트 열기
	List<Data> openFlist(int page);

	// 파일삭제
	int delFile(int data_no);

	// 파일 갯수 세기
	int getFileCount() throws ClassNotFoundException, SQLException;

	// 고객 갯수세기
	int getCustCount() throws ClassNotFoundException, SQLException;

	// 통장 갯수 세기
	int getCustAccCount() throws ClassNotFoundException, SQLException;

	//납품명세서 등록
	int insertDeliver(Deliver deliver);

	// 납품명세서 리스트
	List<Deliver> getAllDeliver(int page);

	// 납품명세서 갯수 세기
	int getDeliCount();

	// 납품내역 상세보기
	DetailDeli getDetailDeli(int request_no);

	// 주문내역 검색하기
	//List<Request_Doc> searchReq(String name, String search);

	// 납품문서 삭제시 상태 변경
	int delDeliver(int deliver_no);

	// 주문문서 등록시 자동으로 사원 주문내역에도 등록
	int insertReqDoc(int request_no, int emp_no);

	// 주문등록시 이름으로 번호 알아오기
	int selectReqNo(String request_name);

	// 주문 등록시 프로젝트 검색
	List<Project> searchPro(String search1, String search2);

	// 프로젝트 리스트 가져오기
	Project getProject(int project_no);

	// 프로젝트 리스트에 등록하기
	int insertReqlist(int request_no, int project_no, String project_name);

	// req_no에 해당하는 프로젝트 정보 가져오기
	Reqlist getReqlist(int request_no);

}
