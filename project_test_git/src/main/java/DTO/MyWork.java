package DTO;

import java.util.Date;

public class MyWork {

	private String work_num;
	private String user_id;
	private String work_content;
	private Date work_date;
	
	public String getWork_num() {
		return work_num;
	}
	public void setWork_num(String work_num) {
		this.work_num = work_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getWork_content() {
		return work_content;
	}
	public void setWork_content(String work_content) {
		this.work_content = work_content;
	}
	public Date getWork_date() {
		return work_date;
	}
	public void setWork_date(Date work_date) {
		this.work_date = work_date;
	}

	
}
