package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.map.constant.UnionTypeConstant;
import com.map.service.UnionService;

@Controller  
@RequestMapping("/listUnion")  
public class ListUnionAdminController {
	 @Resource
	  private UnionService unionService= null;
	 
	 @RequestMapping
	    public String init(HttpServletRequest request,Model model){
		 	model.addAttribute("unions", unionService.listAll());
		 	model.addAttribute("types", UnionTypeConstant.UNION_TYPE_ARRAY);
	        return "listUnionAdmin";  
	    }

}
