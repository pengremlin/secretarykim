package Emp.DTO;
/*
* @FileName : Dept.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 02.
*/
public class Dept {
	private String dept_name;
	private int comp_no;
	private int dept_ph;
	private int dept_no;
	
	public int getDept_no() {
		return dept_no;
	}
	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public int getComp_no() {
		return comp_no;
	}
	public void setComp_no(int comp_no) {
		this.comp_no = comp_no;
	}
	public int getDept_ph() {
		return dept_ph;
	}
	public void setDept_ph(int dept_ph) {
		this.dept_ph = dept_ph;
	}
	
}
