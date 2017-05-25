package Emp.DTO;

import java.sql.Date;

public class Allow_List {
	private int allow_no;
	private Date allow_start;
	private Date allow_end;
	private Date allow_okdate;
	private String allow_content;
	public int getAllow_no() {
		return allow_no;
	}
	public void setAllow_no(int allow_no) {
		this.allow_no = allow_no;
	}
	public Date getAllow_start() {
		return allow_start;
	}
	public void setAllow_start(Date allow_start) {
		this.allow_start = allow_start;
	}
	public Date getAllow_end() {
		return allow_end;
	}
	public void setAllow_end(Date allow_end) {
		this.allow_end = allow_end;
	}
	public Date getAllow_okdate() {
		return allow_okdate;
	}
	public void setAllow_okdate(Date allow_okdate) {
		this.allow_okdate = allow_okdate;
	}
	public String getAllow_content() {
		return allow_content;
	}
	public void setAllow_content(String allow_content) {
		this.allow_content = allow_content;
	}
	
}
