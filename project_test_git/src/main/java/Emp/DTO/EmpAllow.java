package Emp.DTO;

public class EmpAllow {
	private int emp_no;
	private String user_name;
	private String dept_name;
	private String step;
	
	public String getStep() {
		return step;
	}
	public void setStep(String step) {
		this.step = step;
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
	
}
