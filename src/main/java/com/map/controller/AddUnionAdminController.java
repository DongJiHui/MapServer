package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.constant.UnionTypeConstant;
import com.map.pojo.Union;
import com.map.service.SchoolService;
import com.map.service.UnionService;

@Controller  
@RequestMapping("/addUnion")
public class AddUnionAdminController {
	@Resource
	SchoolService schoolService = null;
	
	@Resource
	UnionService unionService = null;
	
	@RequestMapping
    public String init(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id", required = false) String id){ 
		model.addAttribute("types", UnionTypeConstant.UNION_TYPE_ARRAY);
		if (id!=null) {
			/*Union union = unionService.selectById(id);
    		model.addAttribute("union",union );*/
    	}
        return "addUnionAdmin";  
    }
	
	@RequestMapping(params = "method=add_update")
    public String add_update(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id") String id,
    		@RequestParam(value = "name") String name,
    		@RequestParam(value = "type") int type,
    		@RequestParam(value = "schools")String schools , HttpSession session) {
		Union union = new Union();
		union.setUnName(name);
		union.setUnType(type);
		if (id.equals("")|| id==null){
			unionService.insert(union, schools.split("\\|"),session);
		} else {
			union.setUnId(id);
			/*union.update(school, schoolAreaId,session);*/
		}
		return "successAdmin";
	}
	@RequestMapping(params = "method=delete")
    public String delete(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id") String id) {
    	unionService.deleteByUnId(id);
    	return "redirect:listUnion";
    }
}
