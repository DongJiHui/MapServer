package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.School;
import com.map.pojo.SchoolArea;
import com.map.service.SchoolAreaService;
import com.map.service.SchoolService;

@Controller  
@RequestMapping("/addSchool")  
public class AddSchoolAdminController {
	@Resource
	SchoolService schoolService = null;
	
	@Resource
	SchoolAreaService schoolAreaService = null;
	
	@RequestMapping
    public String init(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id", required = false) String id){ 
		model.addAttribute("schoolAreas", schoolAreaService.simpleListAll());
		if (id!=null) {
			School school = schoolService.selectById(id);
    		model.addAttribute("school",school );
    	}
        return "addSchoolAdmin";  
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
    		@RequestParam(value = "character") String character,
    		@RequestParam(value = "type") String type,
    		@RequestParam(value = "phone") String phone,
    		@RequestParam(value = "url") String url,HttpSession session) {
		School school = new School();
		school.setsName(name);
		school.setsAddress(address);
		school.setsDescription(desc);
		school.setsScore(score);
		school.setsMiddlepoint(middlePoint);
		school.setsCharacter(character);
		school.setsType(type);
		school.setsPhone(phone);
		school.setsUrl(url);
		if (id.equals("")|| id==null){
			school.setsAddadmin((String)session.getAttribute("userName"));
			school.setsUpdateadmin((String)session.getAttribute("userName"));
			schoolService.insert(school, schoolAreaId,session);
		} else {
			school.setsId(id);
			school.setsUpdateadmin((String)session.getAttribute("userName"));
			schoolService.update(school, schoolAreaId,session);
		}
		return "successAdmin";
	}
	
	 @RequestMapping(params = "method=delete")
	    public String delete(HttpServletRequest request,Model model, 
	    		@RequestParam(value = "id") String id) {
		 schoolService.deleteById(id);
	    	return "redirect:listSchool";
	    }
}
