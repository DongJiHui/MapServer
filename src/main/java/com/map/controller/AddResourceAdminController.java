package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.EduResource;
import com.map.service.ResourceService;
import com.map.service.SchoolAreaService;

@Controller  
@RequestMapping("/addResource")  
public class AddResourceAdminController {
	@Resource
	ResourceService resourceService = null;
	
	@Resource
	SchoolAreaService schoolAreaService = null;
	
	@RequestMapping
    public String init(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id", required = false) String id){ 
		model.addAttribute("schoolAreas", schoolAreaService.simpleListAll());
		if (id!=null) {
			EduResource resource = resourceService.selectById(id);
    		model.addAttribute("resource",resource );
    	}
        return "addResourceAdmin";  
    }
	@RequestMapping(params = "method=add_update")
    public String add_update(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id") String id,
    		@RequestParam(value = "name") String name,
    		@RequestParam(value = "address") String address,
    		@RequestParam(value = "desc") String desc,
    		@RequestParam(value = "score") String score,
    		@RequestParam(value = "middlePoint") String middlePoint,
    		@RequestParam(value = "schoolAreaId") String schoolAreaId,
    		@RequestParam(value = "type") String type,
    		@RequestParam(value = "phone") String phone,
    		@RequestParam(value = "url") String url,HttpSession session) {
		EduResource resource = new EduResource();
		resource.setrName(name);
		resource.setrAddress(address);
		resource.setrDescription(desc);
		resource.setrScore(score);
		resource.setrMiddlepoint(middlePoint);
		resource.setrType(type);
		resource.setrPhone(phone);
		resource.setrUrl(url);
		if (id.equals("")|| id==null){
			resource.setrAddadmin((String)session.getAttribute("userName"));
			resource.setrUpdateadmin((String)session.getAttribute("userName"));
			resourceService.insert(resource, schoolAreaId,session);
		} else {
			resource.setrId(id);
			resource.setrUpdateadmin((String)session.getAttribute("userName"));
			resourceService.update(resource, schoolAreaId,session);
		}
		return "successAdmin";
	}
	
	 @RequestMapping(params = "method=delete")
	    public String delete(HttpServletRequest request,Model model, 
	    		@RequestParam(value = "id") String id) {
		 resourceService.deleteById(id);
	    	return "redirect:listSchool";
	    }
}
