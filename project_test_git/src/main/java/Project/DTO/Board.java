package Project.DTO;

import java.util.Date;
/*
* @FileName : Board.java
* @Project
* @Date
: Project.DTO
: 2016. 6. 02.
*/
public class Board {

	private int board_no;
	private String board_title;
	private String board_content;
	private Date board_date;
	private String board_end;
	private String user_id;
	private int list_no;
	private int project_no;
	private String list_name;
	private int board_state;
	
	

	public int getBoard_state() {
		return board_state;
	}
	public void setBoard_state(int board_state) {
		this.board_state = board_state;
	}
	public String getList_name() {
		return list_name;
	}
	public void setList_name(String list_name) {
		this.list_name = list_name;
	}
	public int getProject_no() {
		return project_no;
	}
	public void setProject_no(int project_no) {
		this.project_no = project_no;
	}
	public int getBoard_order() {
		return board_order;
	}
	public void setBoard_order(int board_order) {
		this.board_order = board_order;
	}
	private int board_order;
	
	
	public int getBoard_no() {
		return board_no;
	}
	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getList_no() {
		return list_no;
	}
	public void setList_no(int list_no) {
		this.list_no = list_no;
	}
	public String getBoard_end() {
		return board_end;
	}
	public void setBoard_end(String board_end) {
		this.board_end = board_end;
	}

	
	
	
}
