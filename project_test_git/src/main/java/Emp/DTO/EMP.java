package Emp.DTO;

import java.sql.Date;

/*
* @FileName : EMP.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 02.
*/
public class EMP {
	private int emp_no;
	private String user_id;
	private String job_name;
	private int dept_no;
	private int emp_state;
	private Date emp_date;
	private Date emp_end;
	private String emp_division;
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public Date getEmp_end() {
		return emp_end;
	}
	public void setEmp_end(Date emp_end) {
		this.emp_end = emp_end;
	}
	public String getEmp_division() {
		return emp_division;
	}
	public void setEmp_division(String emp_division) {
		this.emp_division = emp_division;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	
	
	
	
}
