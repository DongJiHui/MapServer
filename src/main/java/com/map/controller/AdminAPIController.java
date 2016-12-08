package com.map.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.map.pojo.District;
import com.map.pojo.EduResource;
import com.map.pojo.School;
import com.map.pojo.SchoolArea;
import com.map.pojo.UnionSchoolMapping;
import com.map.service.DistrictService;
import com.map.service.ResourceService;
import com.map.service.SchoolAreaService;
import com.map.service.SchoolService;
import com.map.service.UnionService;

@Controller  
@RequestMapping("/adminApi")  
public class AdminAPIController {
	@Resource
    private DistrictService districtService= null;
	
	@Resource
	private SchoolAreaService schoolAreaService = null;
	
	@Resource
	private SchoolService schoolService = null;
	
	@Resource
	private ResourceService resourceService = null;
	
	@Resource
	private UnionService unionService = null;
	
	@RequestMapping(value="/schoolByType")
    public @ResponseBody Object schoolAreaList(HttpServletRequest request
    		,@RequestParam(value = "type", required = true) String type){
		if (type == null ){
			return null;
		} else {
			List list =(List) schoolService.selectByType(type);
			return list;
		}
	}
	@RequestMapping(value="/schoolByUnId")
    public @ResponseBody Object schoolByUnId(HttpServletRequest request
    		,@RequestParam(value = "unId", required = true) String unId){
		List<Object> list = unionService.listMappingByUnId(unId);
		List<School> resultList = new ArrayList<School>();
		for (int i=0; i<list.size(); i++){
			UnionSchoolMapping mapping = (UnionSchoolMapping)list.get(i);
			School school = schoolService.selectById(mapping.getsId());
			resultList.add(school);
		}
		return resultList;
	}
	@RequestMapping(value="/allSchool")
    public @ResponseBody Object allSchool(HttpServletRequest request){
			List list =(List) schoolService.listAll();
			return list;
	}
	@RequestMapping(value="/districtCheck")
    public @ResponseBody Object districtCheck(HttpServletRequest request
    		,@RequestParam(value = "name", required = false) String name, HttpServletResponse response){
		District district = districtService.selectByName(name);
		if (district == null) {
			return true;
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return null;
		}
	}
	@RequestMapping(value="/schoolAreaCheck")
    public @ResponseBody Object schoolAreaCheck(HttpServletRequest request
    		,@RequestParam(value = "name", required = true) String name, HttpServletResponse response){
		SchoolArea schoolArea = schoolAreaService.selectByName(name);
		if (schoolArea == null) {
			return true;
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return null;
		}
	}
	@RequestMapping(value="/schoolCheck")
    public @ResponseBody Object schoolCheck(HttpServletRequest request
    		,@RequestParam(value = "name", required = true) String name, HttpServletResponse response){
		School school = schoolService.selectByName(name);
		if (school == null) {
			return true;
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return null;
		}
	}
	@RequestMapping(value="/resourceCheck")
    public @ResponseBody Object resourceCheck(HttpServletRequest request
    		,@RequestParam(value = "name", required = true) String name, HttpServletResponse response){
		EduResource resource = resourceService.selectByName(name);
		if (resource == null) {
			return true;
		} else {
			response.setStatus(HttpServletResponse.SC_NOT_ACCEPTABLE);
			return null;
		}
	}
	


}
