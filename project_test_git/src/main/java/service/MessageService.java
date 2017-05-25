package service;


import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import DAO.MessageDAO;
import DTO.Message;


@Service
public class MessageService {

	@Autowired
	private SqlSession sqlSession;


	
	public List<Message> rmsg(Principal receiver) throws ClassNotFoundException, SQLException {

		MessageDAO messageDao = sqlSession.getMapper(MessageDAO.class);
		List<Message> list = messageDao.getMSG(receiver.getName());
		
		return list;
	}
	
	public List<Message> smsg(Principal sender) throws ClassNotFoundException, SQLException {

		MessageDAO messageDao = sqlSession.getMapper(MessageDAO.class);
		List<Message> list = messageDao.setMSG(sender.getName());
		
		return list;
	}
	
	public String composeMSG(Message message) 
			throws ClassNotFoundException, SQLException{
			

		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		messageDAO.composeMSG(message);

		return "redirect:messageBox.htm";
		
		
	}
	
	public String composeMSG2(Message message) 
			throws ClassNotFoundException, SQLException{
			

		MessageDAO messageDAO = sqlSession.getMapper(MessageDAO.class);
		messageDAO.composeMSG2(message);

		return "redirect:messageBox.htm";
		
		
	}
	

	public String deleteMSG(int message_num) throws ClassNotFoundException, SQLException {

		MessageDAO messageDao = sqlSession.getMapper(MessageDAO.class);
		messageDao.deleteMSG(message_num);

		return "redirect:messageBox.htm";
	}
	
	public String deleteMSG2(int message_num) throws ClassNotFoundException, SQLException {

		MessageDAO messageDao = sqlSession.getMapper(MessageDAO.class);
		messageDao.deleteMSG2(message_num);

		return "redirect:sendMSG.htm";
	}

}
