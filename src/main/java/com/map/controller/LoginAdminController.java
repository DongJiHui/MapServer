package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.Admin;
import com.map.service.AdminService;

@Controller  
@RequestMapping("/index")  
public class LoginAdminController {
	
	@Resource
	private AdminService adminService = null;
	@RequestMapping
    public String index(HttpServletRequest request,Model model){ 
        return "indexAdmin";  
    }
	  @RequestMapping(params = "method=login")
	    public String login(HttpServletRequest request,Model model, 
	    		@RequestParam(value = "username") String username,
	    		@RequestParam(value = "pwd") String pwd,HttpSession session) {
		  if (username.equals("") || pwd.equals("")){
			  return "indexAdmin";
		  } else {
			 if (pwd.equals(adminService.getPwd(username))){
				 session.setAttribute("userName",username);
				 return "redirect:addDistrict";
			 } else {
				 return "indexAdmin";
			 }
		  }
		  
	  }
	  @RequestMapping(params = "method=logout")
	    public String logout(HttpServletRequest request,Model model,HttpSession session) {
		  session.removeAttribute("userName");
		  return "redirect:index";
	  }
}
