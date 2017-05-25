package Emp.DTO;

import java.sql.Date;

public class Allow_Basic {
	
	private int emp_no;
	private int dept_no;
	private String user_name;
	private String dept_name;
	private Date emp_date;
	private String acc_num;
	private String step;
	private String job_name;
	private String emp_division;
	
	public String getEmp_division() {
		return emp_division;
	}
	public void setEmp_division(String emp_division) {
		this.emp_division = emp_division;
	}
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
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
	public Date getEmp_date() {
		return emp_date;
	}
	public void setEmp_date(Date emp_date) {
		this.emp_date = emp_date;
	}
	public String getAcc_num() {
		return acc_num;
	}
	public void setAcc_num(String acc_num) {
		this.acc_num = acc_num;
	}
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
	}
	
	
}
