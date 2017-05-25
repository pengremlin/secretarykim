package Goods.DTO;

import org.springframework.web.multipart.MultipartFile;

/*
* @FileName : Data.java
* @Project : Goods.DTO
* @Date : 2016. 6. 19.
*/

public class Data {
	
	private int data_no;
	private String orign_name; // 실제 파일이름 
	private String save_name; // 저장된 이름
	private String data_content;
	private int data_state;
	
	
	public int getData_no() {
		return data_no;
	}
	public void setData_no(int data_no) {
		this.data_no = data_no;
	}
	
	public String getOrign_name() {
		return orign_name;
	}
	public void setOrign_name(String orign_name) {
		this.orign_name = orign_name;
	}
	public String getSave_name() {
		return save_name;
	}
	public void setSave_name(String save_name) {
		this.save_name = save_name;
	}
	
	
	public String getData_content() {
		return data_content;
	}
	public void setData_content(String data_content) {
		this.data_content = data_content;
	}
	public int getData_state() {
		return data_state;
	}
	public void setData_state(int data_state) {
		this.data_state = data_state;
	}
	
	
	
	
}
