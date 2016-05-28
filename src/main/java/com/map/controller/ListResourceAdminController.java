package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.service.ResourceService;
import com.map.service.SchoolAreaService;

@Controller  
@RequestMapping("/listResource")  
public class ListResourceAdminController {
	
	@Resource
	SchoolAreaService schoolAreaService = null;
	
	@Resource
	ResourceService resourceService = null;
	
	@RequestMapping
    public String init(HttpServletRequest request,Model model,
    		@RequestParam(value = "schoolAreaId", required = false) String schoolAreaId){
		model.addAttribute("schoolAreas", schoolAreaService.simpleListAll());
		model.addAttribute("schoolAreaId", schoolAreaId);
		if (schoolAreaId!=null) {
			model.addAttribute("resources", resourceService.simpleSelectAllBySaId(schoolAreaId));
    	}
        return "listResourceAdmin";  
    }
}
