package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.map.service.SchoolAreaService;

@Controller  
@RequestMapping("/listSchoolArea")  
public class ListSchoolAreaAdminController {

	@Resource
	SchoolAreaService schoolAreaService = null;
	@RequestMapping
    public String init(HttpServletRequest request,Model model){ 
		model.addAttribute("schoolAreas", schoolAreaService.simpleListAll());
        return "listSchoolAreaAdmin";  
    }
}
