package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {
	
	// http://localhost:8080
	@RequestMapping("/")
	public  String  home( ) {
		
		return  "home";   // jsp 파일을 찾는다
	}
	
	// http://localhost:8080/test
	@RequestMapping("/test")
	@ResponseBody              // 서버가 data(html) 을 내려보낸다
	public  String  test() {
		return  "<h2>Test 입니다</h2>";
	}
	
	
}






