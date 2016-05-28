package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.SchoolArea;
import com.map.service.DistrictService;
import com.map.service.SchoolAreaService;

@Controller  
@RequestMapping("/addSchoolArea")  
public class AddSchoolAreaAdminController {
	@Resource
    private DistrictService districtService= null;
	
	@Resource
	private SchoolAreaService schoolAreaService = null;
	
	@RequestMapping
    public String init(HttpServletRequest request,Model model, 
    		@RequestParam(value = "id", required = false) String id){ 
		model.addAttribute("districts", districtService.listAll());
		if (id!=null) {
			SchoolArea schoolArea = schoolAreaService.selectById(id);
    		model.addAttribute("schoolArea",schoolArea );
    	}
        return "addSchoolAreaAdmin";  
    }
	
	 @RequestMapping(params = "method=add_update")
	    public String add_update(HttpServletRequest request,Model model, 
	    		@RequestParam(value = "id") String id,
	    		@RequestParam(value = "name") String name,
	    		@RequestParam(value = "districtId") String districtId,
	    		@RequestParam(value = "desc") String desc,
	    		@RequestParam(value = "middlePoint") String middlePoint,
	    		@RequestParam(value = "points") String points,
	    		@RequestParam(value = "scaleNum") String scaleNum
	    		,HttpSession session) {
			 SchoolArea schoolArea = new SchoolArea();
			 schoolArea.setSaName(name);
	 		schoolArea.setSaDescription(desc);
	 		schoolArea.setSaMiddlepoint(middlePoint);
	 		schoolArea.setSaPoints(points);
	 		schoolArea.setSaUpdateadmin((String)session.getAttribute("userName"));
	 		if (scaleNum != null && !scaleNum.equals("")){
	 			schoolArea.setSaScaleparam(Integer.parseInt(scaleNum ));
	 		}
	    	if (id.equals("")|| id==null){
	    		schoolArea.setSaAddadmin((String)session.getAttribute("userName"));
	    		schoolAreaService.insert(schoolArea,districtId,session);
	    	} else {
	    		schoolArea.setSaId(id);
	    		schoolAreaService.update(schoolArea,districtId,session);
	    	}
	    	return "successAdmin";
	    }
	 
	 @RequestMapping(params = "method=delete")
	    public String delete(HttpServletRequest request,Model model, 
	    		@RequestParam(value = "id") String id) {
		 schoolAreaService.deleteById(id);
	    	return "redirect:listSchoolArea";
	    }
}
