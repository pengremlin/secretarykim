package DAO;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import DTO.Message;

public interface MessageDAO {
	
	//받은 쪽지 리스트
	public List<Message> getMSG(String receiver) throws ClassNotFoundException, SQLException;
	//보낸 쪽지 리스트
	public List<Message> setMSG(String sender) throws ClassNotFoundException, SQLException;
	//쪽지 보내기
	public int composeMSG(Message message) throws ClassNotFoundException, SQLException;
	//쪽지 보내기2
	public int composeMSG2(Message message) throws ClassNotFoundException, SQLException;
	//받은 쪽지 삭제
	public int deleteMSG(int message_num) throws ClassNotFoundException, SQLException;
	//보낸 쪽지 삭제
	public int deleteMSG2(int message_num) throws ClassNotFoundException, SQLException;

}
