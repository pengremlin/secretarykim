package Emp.DTO;

import java.sql.Date;
/*
* @FileName : Atte.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 02.
*/

public class Atte {
	private int atte_no;
/////////////////////////////////////////////////////
	private String atti_kind_no;
/////////////////////////////////////////////////////
	private int atti_no;
	private Date atte_start;
	private Date atte_end;
	private Date atte_date;
	private String atte_go;
	private String atte_back;
	private int emp_no;
	
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getAtte_no() {
		return atte_no;
	}
	public void setAtte_no(int atte_no) {
		this.atte_no = atte_no;
	}
	public String getAtti_kind_no() {
		return atti_kind_no;
	}
	public void setAtti_kind_no(String atti_kind_no) {
		this.atti_kind_no = atti_kind_no;
	}
	public int getAtti_no() {
		return atti_no;
	}
	public void setAtti_no(int atti_no) {
		this.atti_no = atti_no;
	}
	public Date getAtte_start() {
		return atte_start;
	}
	public void setAtte_start(Date atte_start) {
		this.atte_start = atte_start;
	}
	public Date getAtte_end() {
		return atte_end;
	}
	public void setAtte_end(Date atte_end) {
		this.atte_end = atte_end;
	}
	public Date getAtte_date() {
		return atte_date;
	}
	public void setAtte_date(Date atte_date) {
		this.atte_date = atte_date;
	}
	public String getAtte_go() {
		return atte_go;
	}
	public void setAtte_go(String atte_go) {
		this.atte_go = atte_go;
	}
	public String getAtte_back() {
		return atte_back;
	}
	public void setAtte_back(String atte_back) {
		this.atte_back = atte_back;
	}
	
	
	
	
	
}
