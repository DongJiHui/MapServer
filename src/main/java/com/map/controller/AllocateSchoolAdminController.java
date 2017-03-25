package com.map.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.map.pojo.SchoolSchoolAllocation;
import com.map.pojo.SchoolSchoolAllocationKey;
import com.map.service.AllocateSchoolService;
import com.map.service.DistrictService;
import com.map.service.SchoolAreaService;

@Controller  
@RequestMapping("/allocateSchool")  
public class AllocateSchoolAdminController {
	
	@Resource
	private AllocateSchoolService allocateSchoolService = null;
	
	@Resource
	SchoolAreaService schoolAreaService = null;
	
	@Resource
	DistrictService districtService = null;
	
	@RequestMapping
	  public String init(HttpServletRequest request,Model model){ 
			model.addAttribute("allocations", allocateSchoolService.selectAllWithData());
			model.addAttribute("districts", districtService.listAll());
			return "allocateSchoolAdmin";
	}
	@RequestMapping(params = "method=add")
	  public String add(HttpServletRequest request,Model model,
			  @RequestParam(value = "msId") String msId,
	    		@RequestParam(value = "hsId") String hsId,
	    		@RequestParam(value = "quota") int quota,
	    		@RequestParam(value = "dName") String dName
	    		,HttpSession session){ 
		SchoolSchoolAllocation allocation = new SchoolSchoolAllocation();
		allocation.setAlMsId(msId);
		allocation.setAlHsId(hsId);
		allocation.setAlQuota(quota);
		allocation.setAlDName(dName);
		allocation.setAlAddadmin((String)session.getAttribute("userName"));
		allocation.setAlUpdateadmin((String)session.getAttribute("userName"));
		allocateSchoolService.insert(allocation);
		model.addAttribute("allocations", allocateSchoolService.selectAllWithData());
		model.addAttribute("districts", districtService.listAll());
		return "allocateSchoolAdmin";
	}
	
	@RequestMapping(params = "method=delete")
	  public String delete(HttpServletRequest request,Model model,
			  @RequestParam(value = "msId") String msId,
	    		@RequestParam(value = "hsId") String hsId){
		
		SchoolSchoolAllocationKey key = new SchoolSchoolAllocationKey();
		key.setAlMsId(msId);
		key.setAlHsId(hsId);
		allocateSchoolService.deleteByPrimaryKey(key);
		model.addAttribute("allocations", allocateSchoolService.selectAllWithData());
		model.addAttribute("districts", districtService.listAll());
		return "allocateSchoolAdmin";
	}

}
