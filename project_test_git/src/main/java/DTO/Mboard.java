package DTO;

import java.sql.Date;
/*
* @FileName : MBoard.java
* @Project
* @Date
: DTO
: 2016. 6. 02.
*/
public class Mboard {
	private String mboard_no;
	private String mboard_title;
	private String mboard_content;
	private int mboard_read_num;
	private Date mboard_date;
	private String user_id;
	
	public String getMboard_no() {
		return mboard_no;
	}
	public void setMboard_no(String mboard_no) {
		this.mboard_no = mboard_no;
	}
	public String getMboard_title() {
		return mboard_title;
	}
	public void setMboard_title(String mboard_title) {
		this.mboard_title = mboard_title;
	}
	public String getMboard_content() {
		return mboard_content;
	}
	public void setMboard_content(String mboard_content) {
		this.mboard_content = mboard_content;
	}
	public int getMboard_read_num() {
		return mboard_read_num;
	}
	public void setMboard_read_num(int mboard_read_num) {
		this.mboard_read_num = mboard_read_num;
	}
	public Date getMboard_date() {
		return mboard_date;
	}
	public void setMboard_date(Date mboard_date) {
		this.mboard_date = mboard_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
