package Goods.DTO;

import java.sql.Date;

/*
* @FileName : Deliver.java
* @Project : Goods.DTO
* @Date : 2016. 6. 19.
*/
public class Deliver {
	private int deliver_no;
	private String deliver_name;
	private String deliver_cont;
	private String deliver_date;
	private int deliver_state;
	private int deliver_pay;
	private int cust_no;
	private int request_no;
	private int appr_no;
	
	public int getDeliver_no() {
		return deliver_no;
	}
	public void setDeliver_no(int deliver_no) {
		this.deliver_no = deliver_no;
	}
	public String getDeliver_name() {
		return deliver_name;
	}
	public void setDeliver_name(String deliver_name) {
		this.deliver_name = deliver_name;
	}
	public String getDeliver_cont() {
		return deliver_cont;
	}
	public void setDeliver_cont(String deliver_cont) {
		this.deliver_cont = deliver_cont;
	}
	
	public String getDeliver_date() {
		return deliver_date;
	}
	public void setDeliver_date(String deliver_date) {
		this.deliver_date = deliver_date;
	}
	public int getDeliver_state() {
		return deliver_state;
	}
	public void setDeliver_state(int deliver_state) {
		this.deliver_state = deliver_state;
	}
	public int getDeliver_pay() {
		return deliver_pay;
	}
	public void setDeliver_pay(int deliver_pay) {
		this.deliver_pay = deliver_pay;
	}
	public int getCust_no() {
		return cust_no;
	}
	public void setCust_no(int cust_no) {
		this.cust_no = cust_no;
	}
	public int getRequest_no() {
		return request_no;
	}
	public void setRequest_no(int request_no) {
		this.request_no = request_no;
	}
	public int getAppr_no() {
		return appr_no;
	}
	public void setAppr_no(int appr_no) {
		this.appr_no = appr_no;
	}
	
	
}
