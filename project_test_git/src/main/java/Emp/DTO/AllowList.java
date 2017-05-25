package Emp.DTO;

import java.sql.Date;

public class AllowList {
	 private int emp_no;
	 private String user_name;
	 private String job_name;
	 private String dept_name;
	 private String acc_num;
	 private int sal_sum;
	 private Date emp_date;
	 private int sal;
	 
	public Date getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(Date emp_date) {
		this.emp_date = emp_date;
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
	public String getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
	}
	public int getSal_sum() {
		return sal_sum;
	}
	public void setSal_sum(int sal_sum) {
		this.sal_sum = sal_sum;
	}
	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	
	 
}
