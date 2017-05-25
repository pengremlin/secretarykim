package Emp.DTO;

import java.sql.Date;

/*
* @FileName : Sal_History.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 03.
*/
public class Sal_History {
	private int sal_no;
	private int emp_no;
	private int sal_list_no;

	

	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
	public int getSal_list_no() {
		return sal_list_no;
	}
	public void setSal_list_no(int sal_list_no) {
		this.sal_list_no = sal_list_no;
	}
	public int getSal_no() {
		return sal_no;
	}
	public void setSal_no(int sal_no) {
		this.sal_no = sal_no;
	}
	
}
