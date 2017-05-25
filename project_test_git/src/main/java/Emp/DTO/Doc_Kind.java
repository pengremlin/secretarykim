package Emp.DTO;
/*
* @FileName : Doc_Kind.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 03.
*/

import java.sql.Date;

public class Doc_Kind {
	private int atti_no;
	private int doc_no;
	private int emp_no;
	private Date doc_okdate;
	private int appr_no;
	
	public Date getDoc_okdate() {
		return doc_okdate;
	}
	public void setDoc_okdate(Date doc_okdate) {
		this.doc_okdate = doc_okdate;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getAppr_no() {
		return appr_no;
	}
	public void setAppr_no(int appr_no) {
		this.appr_no = appr_no;
	}
	public int getAtti_no() {
		return atti_no;
	}
	public void setAtti_no(int atti_no) {
		this.atti_no = atti_no;
	}
	public int getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}
	
}
