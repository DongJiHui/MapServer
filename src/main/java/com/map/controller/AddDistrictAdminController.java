package com.map.controller;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.District;
import com.map.service.DistrictService;

  
@Controller  
@RequestMapping("/addDistrict")  
public class AddDistrictAdminController {  
    @Resource
    private DistrictService districtService= null;
    
    @RequestMapping
    public String init(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id", required = false) String id){ 
    	if (id!=null) {
    		model.addAttribute("district",districtService.selectById(id) );
    	}
        return "addDistrictAdmin";  
    }
    @RequestMapping(params = "method=add_update")
    public String add_update(HttpServletRequest request,Model model,HttpSession session,
    		@RequestParam(value = "id") String id,
    		@RequestParam(value = "name") String name) {
    	if (id.equals("")|| id==null){
    		District district = new District();
	    	district.setdName(name);
	    	district.setdAddadmin((String)session.getAttribute("userName"));
	    	district.setdUpadateadmin((String)session.getAttribute("userName"));
	    	districtService.insert(district);
    	} else {
    		District district = new District();
    		district.setdId(id);
    		district.setdUpadateadmin((String)session.getAttribute("userName"));
	    	districtService.update(district);
    	}
    	return "successAdmin";
    }
    @RequestMapping(params = "method=delete")
    public String delete(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id") String id) {
    	districtService.deleteById(id);
    	return "redirect:listDistrict";
    }
    
   }  