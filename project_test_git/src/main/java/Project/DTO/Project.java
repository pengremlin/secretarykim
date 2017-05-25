package Project.DTO;

import java.sql.Date;
/*
* @FileName : Project.java
* @Project
* @Date
: Project.DTO
: 2016. 6. 02.
*/
public class Project {
	private int project_no;
	private String project_name;
	private Date project_start;
	private Date project_end;
	private String user_id;
	private String user_name;
	private int board_state;
	
	
	
	public int getBoard_state() {
		return board_state;
	}
	public void setBoard_state(int board_state) {
		this.board_state = board_state;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	private int completion;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public Date getProject_start() {
		return project_start;
	}
	public void setProject_start(Date project_start) {
		this.project_start = project_start;
	}
	public Date getProject_end() {
		return project_end;
	}
	public void setProject_end(Date project_end) {
		this.project_end = project_end;
	}
	public int getCompletion() {
		return completion;
	}
	public void setCompletion(int completion) {
		this.completion = completion;
	}
	
}
