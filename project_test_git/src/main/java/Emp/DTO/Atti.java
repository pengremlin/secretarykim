package Emp.DTO;

import java.sql.Date;

public class Atti {
	private int atti_no;
	private Date atti_date;
	private int emp_no;
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getAtti_no() {
		return atti_no;
	}
	public void setAtti_no(int atti_no) {
		this.atti_no = atti_no;
	}
	public Date getAtti_date() {
		return atti_date;
	}
	public void setAtti_date(Date atti_date) {
		this.atti_date = atti_date;
	}
	
	
}
