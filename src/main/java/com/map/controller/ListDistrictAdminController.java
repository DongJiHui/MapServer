package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.service.DistrictService;

@Controller  
@RequestMapping("/listDistrict")  
public class ListDistrictAdminController {
	 @Resource
	  private DistrictService districtService= null;
	 
	 @RequestMapping
	    public String init(HttpServletRequest request,Model model){
		 	model.addAttribute("districts", districtService.listAll());
	        return "listDistrictAdmin";  
	    }

}
