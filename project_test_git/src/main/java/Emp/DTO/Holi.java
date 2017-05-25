package Emp.DTO;

import java.sql.Date;
/*
* @FileName : Holi.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 02.
*/
public class Holi {
	private int holi_no;
	private String holi_start;
	private String holi_end;
	private int atti_no;
	private int atti_kind_no;
	private int emp_no;
	private String holi_content;
	
	public String getHoli_content() {
		return holi_content;
	}
	public void setHoli_content(String holi_content) {
		this.holi_content = holi_content;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getHoli_no() {
		return holi_no;
	}
	public void setHoli_no(int holi_no) {
		this.holi_no = holi_no;
	}
	public String getHoli_start() {
		return holi_start;
	}
	public void setHoli_start(String holi_start) {
		this.holi_start = holi_start;
	}
	public String getHoli_end() {
		return holi_end;
	}
	public void setHoli_end(String holi_end) {
		this.holi_end = holi_end;
	}
	public int getAtti_no() {
		return atti_no;
	}
	public void setAtti_no(int atti_no) {
		this.atti_no = atti_no;
	}
	public int getAtti_kind_no() {
		return atti_kind_no;
	}
	public void setAtti_kind_no(int atti_kind_no) {
		this.atti_kind_no = atti_kind_no;
	}
	@Override
	public String toString() {
		return "Holi [holi_no=" + holi_no + ", holi_start=" + holi_start + ", holi_end=" + holi_end + ", atti_no="
				+ atti_no + ", atti_kind_no=" + atti_kind_no + ", emp_no=" + emp_no + ", holi_content=" + holi_content
				+ "]";
	}
	
	
	
	
}
