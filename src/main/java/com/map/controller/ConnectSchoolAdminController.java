package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.SchoolSchoolConnect;
import com.map.pojo.SchoolSchoolConnectKey;
import com.map.service.ConnectSchoolService;

@Controller  
@RequestMapping("/connectSchool")  
public class ConnectSchoolAdminController {
	
	@Resource
	private ConnectSchoolService connectSchoolService = null;
	
	@RequestMapping
	  public String init(HttpServletRequest request,Model model){ 
			model.addAttribute("connects", connectSchoolService.selectAllWithSchool());
			return "connectSchoolAdmin";
	}
	@RequestMapping(params = "method=add")
	  public String add(HttpServletRequest request,Model model,
			  @RequestParam(value = "sId1") String sId1,
	    		@RequestParam(value = "sId2") String sId2,
	    		@RequestParam(value = "type") String type,HttpSession session){ 
		SchoolSchoolConnect connect = new SchoolSchoolConnect();
		connect.setsId1(sId1);
		connect.setsId2(sId2);
		connect.setcType(type);
		connect.setcAddadmin((String)session.getAttribute("userName"));
		connect.setcUpdateadmin((String)session.getAttribute("userName"));
		connectSchoolService.insert(connect);
		model.addAttribute("connects", connectSchoolService.selectAllWithSchool());
		return "connectSchoolAdmin";
	}
	
	@RequestMapping(params = "method=delete")
	  public String delete(HttpServletRequest request,Model model,
			  @RequestParam(value = "sId1") String sId1,
	    		@RequestParam(value = "sId2") String sId2){
		
		SchoolSchoolConnectKey key = new SchoolSchoolConnectKey();
		key.setsId1(sId1);
		key.setsId2(sId2);
		connectSchoolService.deleteByPrimaryKey(key);
		model.addAttribute("connects", connectSchoolService.selectAllWithSchool());
		return "connectSchoolAdmin";
	}

}
