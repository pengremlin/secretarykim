package Emp.DTO;

import java.sql.Date;

public class EmpList {
	private int emp_no;
	private int dept_no;
	private int emp_state;
	private Date emp_date;
	private String user_name;
	private String job_name;
	private String dept_name;
	private int sal_etc;
	private int sal_division;
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public int getEmp_state() {
		return emp_state;
	}
	public void setEmp_state(int emp_state) {
		this.emp_state = emp_state;
	}
	public Date getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(Date emp_date) {
		this.emp_date = emp_date;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getSal_etc() {
		return sal_etc;
	}
	public void setSal_etc(int sal_etc) {
		this.sal_etc = sal_etc;
	}
	public int getSal_division() {
		return sal_division;
	}
	public void setSal_division(int sal_division) {
		this.sal_division = sal_division;
	}
	
}
