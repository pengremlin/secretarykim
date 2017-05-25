package Project.DTO;

import java.sql.Date;
/*
* @FileName : List.java
* @Project
* @Date
: Project.DTO
: 2016. 6. 02.
*/
public class List {
	private int list_no;
	private String list_name;
	private Date list_end;
	private int Content_no;
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	public String getList_name() {
		return list_name;
	}
	public void setList_name(String list_name) {
		this.list_name = list_name;
	}
	public Date getList_end() {
		return list_end;
	}
	public void setList_end(Date list_end) {
		this.list_end = list_end;
	}
	public int getContent_no() {
		return Content_no;
	}
	public void setContent_no(int content_no) {
		Content_no = content_no;
	}
	
}
