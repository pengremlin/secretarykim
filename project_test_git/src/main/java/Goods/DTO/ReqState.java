package Goods.DTO;

public class ReqState {

	private int NUM;
	private int request_no;
	private String cust_name;
	private String request_name;
	private String start_date;
	private String end_date;
	private int expact_pay;
	private String appr_name;
	// private String user_name;
	
	
	public int getRequest_no() {
		return request_no;
	}
	public int getNUM() {
		return NUM;
	}
	
	public void setNUM(int nUM) {
		NUM = nUM;
	}
	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}
	public String getCust_name() {
		return cust_name;
	}
	public void setCust_name(String cust_name) {
		this.cust_name = cust_name;
	}
	public String getRequest_name() {
		return request_name;
	}
	public void setRequest_name(String request_name) {
		this.request_name = request_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public int getExpact_pay() {
		return expact_pay;
	}
	public void setExpact_pay(int expact_pay) {
		this.expact_pay = expact_pay;
	}
	public String getAppr_name() {
		return appr_name;
	}
	public void setAppr_name(String appr_name) {
		this.appr_name = appr_name;
	}
	
	
	
}
