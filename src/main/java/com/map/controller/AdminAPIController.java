package com.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.map.pojo.School;
import com.map.service.DistrictService;
import com.map.service.SchoolAreaService;
import com.map.service.SchoolService;

@Controller  
@RequestMapping("/adminApi")  
public class AdminAPIController {
	@Resource
    private DistrictService districtService= null;
	
	@Resource
	private SchoolAreaService schoolAreaService = null;
	
	@Resource
	private SchoolService schoolService = null;
	
	@RequestMapping(value="/schoolByType")
    public @ResponseBody Object schoolAreaList(HttpServletRequest request
    		,@RequestParam(value = "type", required = true) String type){
		if (type == null ){
			return null;
		} else {
			List list =(List) schoolService.selectByType(type);
			List<Map> returnList = new ArrayList<Map>();
			for (int i=0; i<list.size(); i++){
				School temp = (School)list.get(i);
				Map map = new HashMap<String, String>();
				map.put("id", temp.getsId());
				map.put("name", temp.getsName());
				returnList.add(map);
			}
			return returnList;
		}
	}
	


}
