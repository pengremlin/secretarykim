package DTO;

import java.sql.Date;
/*
* @FileName : Reply.java
* @Project
* @Date
: DTO
: 2016. 6. 02.
*/
public class Reply {
	private int Reply_no;
	private String Reply_content;
	private Date Reply_date;
	private int mboard_no;
	private String user_id;
	public int getReply_no() {
		return Reply_no;
	}
	public void setReply_no(int reply_no) {
		Reply_no = reply_no;
	}
	public String getReply_content() {
		return Reply_content;
	}
	public void setReply_content(String reply_content) {
		Reply_content = reply_content;
	}
	public Date getReply_date() {
		return Reply_date;
	}
	public void setReply_date(Date reply_date) {
		Reply_date = reply_date;
	}
	public int getMboard_no() {
		return mboard_no;
	}
	public void setMboard_no(int mboard_no) {
		this.mboard_no = mboard_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
}
