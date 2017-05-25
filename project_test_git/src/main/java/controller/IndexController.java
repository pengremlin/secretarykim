package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
 //index.htm 요청 들어오면 View 페이지 제공
	
	@RequestMapping("/index.htm")
	public String index(){
	  
	  // Tiles 적용
	  return "home.index";  // return view (UrlBase)
	}
	
	@RequestMapping("/join.htm")
	public String join(){

	  // Tiles 적용
	  return "joinus.join";  // return view (UrlBase)
	}
	
	@RequestMapping("/login.htm")
	public String login(){

	  // Tiles 적용
	  return "joinus.login";  // return view (UrlBase)
	}
}
