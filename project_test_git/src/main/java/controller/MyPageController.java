package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/")
public class MyPageController {
	
	@RequestMapping("/mypage.htm")
	public String join(){
	 
	  return "mypage.mypage";  
	}
	
}
