package DTO;

import java.util.Date;

public class Message {

	private String message_num;
	private String receiver;
	private String sender;
	private String message_content;
	private Date date_of_receiving;
	private Date date_of_sending;
	
	
	public String getMessage_num() {
		return message_num;
	}
	public void setMessage_num(String message_num) {
		this.message_num = message_num;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getDate_of_receiving() {
		return date_of_receiving;
	}
	public void setDate_of_receiving(Date date_of_receiving) {
		this.date_of_receiving = date_of_receiving;
	}
	public Date getDate_of_sending() {
		return date_of_sending;
	}
	public void setDate_of_sending(Date date_of_sending) {
		this.date_of_sending = date_of_sending;
	}

	
}
