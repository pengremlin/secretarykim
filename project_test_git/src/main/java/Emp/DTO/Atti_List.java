package Emp.DTO;

import java.sql.Date;

public class Atti_List {
	
	private int atti_no;
	private int emp_no;
	private String user_name;
	private String dept_name;
	private String job_name;
	private Date atti_date;
	public int getAtti_no() {
		return atti_no;
	}
	public void setAtti_no(int atti_no) {
		this.atti_no = atti_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public Date getAtti_date() {
		return atti_date;
	}
	public void setAtti_date(Date atti_date) {
		this.atti_date = atti_date;
	}
	
	
}
