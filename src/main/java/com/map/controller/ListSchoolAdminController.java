package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.SchoolArea;
import com.map.service.SchoolAreaService;
import com.map.service.SchoolService;

@Controller  
@RequestMapping("/listSchool")  
public class ListSchoolAdminController {
	
	@Resource
	SchoolAreaService schoolAreaService = null;
	
	@Resource
	SchoolService schoolService = null;
	
	@RequestMapping
    public String init(HttpServletRequest request,Model model,
    		@RequestParam(value = "schoolAreaId", required = false) String schoolAreaId){
		model.addAttribute("schoolAreas", schoolAreaService.simpleListAll());
		model.addAttribute("schoolAreaId", schoolAreaId);
		if (schoolAreaId!=null) {
			model.addAttribute("schools", schoolService.simpleSelectAllBySaId(schoolAreaId));
    	}
        return "listSchoolAdmin";  
    }
}
