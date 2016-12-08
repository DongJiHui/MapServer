package com.map.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.map.pojo.School;
import com.map.service.SchoolService;

@Controller  
@RequestMapping("/mobile")  
public class MobileController {
	@Resource
    private SchoolService schoolService = null;
	
	@RequestMapping(value="/heatMap")
    public String heatMap(HttpServletRequest request,Model model){ 
	    String sdata="";
	    List<Object> ds= schoolService.listAll();
	    Gson gson =new Gson();
	    List<Map> list = new ArrayList<Map>();
	    for(Object obj: ds)
	    {
	    	School temp = (School)obj;
	      String data= temp.getsMiddlepoint(); // 获取经纬度变量（x,y）
	      Map map = new HashMap<String,String>();  
	      Map pointMap  = gson.fromJson(data,Map.class);
	      map.put("lng", pointMap.get("lng"));
	      map.put("lat", pointMap.get("lat"));
	     String score = temp.getsScore();
	     if (score == null || score == ""){
	    	 map.put("count", 0);
	     } else {
	    	 map.put("count", Double.parseDouble(score));
	     }
	      list.add(map);
	    }
	    model.addAttribute("sdata",gson.toJson(list));
	    return "heatMapMobile";
    }

}
