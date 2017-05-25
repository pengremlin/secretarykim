package Emp.DTO;

import java.sql.Date;
/*
* @FileName : Doc.java
* @Project
* @Date
: Emp.DTO
: 2016. 6. 02.
*/
public class Doc {	
	private int doc_no;
	private String doc_title;
	private String doc_content;
	private Date doc_date;
	private Date doc_start;
	private Date doc_end;
	private int atti_kind_no;
	private int holi_no;
	
	public int getHoli_no() {
		return holi_no;
	}
	public void setHoli_no(int holi_no) {
		this.holi_no = holi_no;
	}
	public int getDoc_no() {
		return doc_no;
	}
	public void setDoc_no(int doc_no) {
		this.doc_no = doc_no;
	}
	public String getDoc_title() {
		return doc_title;
	}
	public void setDoc_title(String doc_title) {
		this.doc_title = doc_title;
	}
	public String getDoc_content() {
		return doc_content;
	}
	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
	}
	public Date getDoc_date() {
		return doc_date;
	}
	public void setDoc_date(Date doc_date) {
		this.doc_date = doc_date;
	}
	public Date getDoc_start() {
		return doc_start;
	}
	public void setDoc_start(Date doc_start) {
		this.doc_start = doc_start;
	}
	public Date getDoc_end() {
		return doc_end;
	}
	public void setDoc_end(Date doc_end) {
		this.doc_end = doc_end;
	}
	public int getAtti_kind_no() {
		return atti_kind_no;
	}
	public void setAtti_kind_no(int atti_kind_no) {
		this.atti_kind_no = atti_kind_no;
	}
	
	
}
