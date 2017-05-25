package controller;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import DTO.Message;
import service.MessageService;

@Controller
@RequestMapping("/mypage/")
public class MessageController {
	// index.htm 요청 들어오면 View 페이지 제공

	@Autowired
	private MessageService messageservice;

	@RequestMapping("/notification.htm")
	public String notification() {

		// Tiles 적용
		return "mypage.notification"; // return view (UrlBase)
	}

	
	
/*	@RequestMapping("/messageBox.htm")
	public String messageBox(Model model) throws ClassNotFoundException, SQLException {

		List<Message> list = messageservice.msgList();

		model.addAttribute("list", list);

		
		return "mypage.messageBox"; 
	}*/
	
	@RequestMapping("/messageBox.htm")
	public String message(Principal receiver, Model model) throws ClassNotFoundException, SQLException {
		
		List<Message> list = messageservice.rmsg(receiver);
		model.addAttribute("message", list);
		
		return "mypage.messageBox";
	}
	
	@RequestMapping("/sendMSG.htm")
	public String smessage(Principal sender, Model model) throws ClassNotFoundException, SQLException {
		
		List<Message> list = messageservice.smsg(sender);
		model.addAttribute("message", list);
		
		return "mypage.sendMSG";
	}
	
	


	@RequestMapping(value = "/composeMSG.htm", method = RequestMethod.GET)
	public String composeMSG() {

		return "mypage.composeMSG";
	}

	@RequestMapping(value = "/composeMSG.htm", method = RequestMethod.POST)
	public String composeMSG(Message message) throws ClassNotFoundException, SQLException {

		
		messageservice.composeMSG(message);
		
		return messageservice.composeMSG2(message);
	}
	
	@RequestMapping("/deleteMSG.htm")
	public String deleteMSG(int message_num) throws ClassNotFoundException, SQLException {
		
		return messageservice.deleteMSG(message_num);
		
	}
	
	@RequestMapping("/deleteMSG2.htm")
	public String deleteMSG2(int message_num) throws ClassNotFoundException, SQLException {
		
		return messageservice.deleteMSG2(message_num);
		
	}

}
