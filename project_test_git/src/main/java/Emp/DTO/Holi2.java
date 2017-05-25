package Emp.DTO;

import java.sql.Date;

public class Holi2 {
	private int holi_no;
	private Date holi_start;
	private Date holi_end;
	private String holi_content;
	private int atti_no; 
	private String atti_kind_no;
	private int emp_no;
	public int getHoli_no() {
		return holi_no;
	}
	public void setHoli_no(int holi_no) {
		this.holi_no = holi_no;
	}
	public Date getHoli_start() {
		return holi_start;
	}
	public void setHoli_start(Date holi_start) {
		this.holi_start = holi_start;
	}
	public Date getHoli_end() {
		return holi_end;
	}
	public void setHoli_end(Date holi_end) {
		this.holi_end = holi_end;
	}
	public String getHoli_content() {
		return holi_content;
	}
	public void setHoli_content(String holi_content) {
		this.holi_content = holi_content;
	}
	public int getAtti_no() {
		return atti_no;
	}
	public void setAtti_no(int atti_no) {
		this.atti_no = atti_no;
	}
	public String getAtti_kind_no() {
		return atti_kind_no;
	}
	public void setAtti_kind_no(String atti_kind_no) {
		this.atti_kind_no = atti_kind_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	
}

