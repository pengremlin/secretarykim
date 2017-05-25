package Goods.DTO;

import java.sql.Date;

/*
* @FileName : Request.java
* @Project : Goods.DTO
* @Date : 2016. 6. 18
*/

public class Request_Doc {
	private int request_no;
	private String request_name;
	private String request_cont;
	private String start_date;
	private String end_date;
	private int request_state;
	private int expact_pay;
	private int data_no;
	private int cust_no;
	private int appr_no;
	
	public int getRequest_no() {
		return request_no;
	}
	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}
	
	public String getRequest_name() {
		return request_name;
	}
	public void setRequest_name(String request_name) {
		this.request_name = request_name;
	}
	public String getRequest_cont() {
		return request_cont;
	}
	public void setRequest_cont(String request_cont) {
		this.request_cont = request_cont;
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
	public int getRequest_state() {
		return request_state;
	}
	public void setRequest_state(int request_state) {
		this.request_state = request_state;
	}
	public int getExpact_pay() {
		return expact_pay;
	}
	public void setExpact_pay(int expact_pay) {
		this.expact_pay = expact_pay;
	}
	public int getData_no() {
		return data_no;
	}
	public void setData_no(int data_no) {
		this.data_no = data_no;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public int getAppr_no() {
		return appr_no;
	}
	public void setAppr_no(int appr_no) {
		this.appr_no = appr_no;
	}
	
	
	
}
