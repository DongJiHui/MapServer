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

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.map.jsonBean.Point;
import com.map.jsonBean.ResultBean;
import com.map.jsonBean.SchoolAreaBean;
import com.map.jsonBean.SchoolBean;
import com.map.pojo.School;
import com.map.pojo.SchoolArea;
import com.map.service.DistrictService;
import com.map.service.SchoolAreaService;
import com.map.service.SchoolService;
import com.map.util.PointUtil;

@Controller  
@RequestMapping("/api")  
public class APIController {
	@Resource
    private DistrictService districtService= null;
	
	@Resource
	private SchoolAreaService schoolAreaService = null;
	
	@Resource
	private SchoolService schoolService = null;
	
	@RequestMapping(value="/schoolAreaList")
    public @ResponseBody Object schoolAreaList(HttpServletRequest request
    		,@RequestParam(value = "districtName", required = false) String name){
		List<Object> list = null;
		if (name == null ){
			list = schoolAreaService.listAll();
		} else {
			list = schoolAreaService.listAllByDName(name);
		}
		if (list == null){
			return new ResultBean("失败",-1,list);
		} else {
			if (list.size() == 0){
				return new ResultBean("该行政区内没有学区或该行政区不存在",0,list);
			} else {
				List<Object> tempList = new ArrayList<Object>();
				for (int i=0; i<list.size(); i++){
					tempList.add(new SchoolAreaBean((SchoolArea)list.get(i)));
				}
				return new ResultBean("成功",0,tempList);
			}
		}
	}
	@RequestMapping(value="/schoolList")
    public @ResponseBody Object schoolList(HttpServletRequest request
    		,@RequestParam(value = "saId", required = false) String saId){
		List<Object> list = null;
		if (saId == null ){
			list = schoolService.listAll();
		} else {
			list = schoolService.listAllBySaId(saId);
		}
		if (list == null){
			return new ResultBean("失败",-1,list);
		} else {
			if (list.size() == 0){
				return new ResultBean("输入学区Id错误或该学区内没有学校",0,list);
			} else {
				List<Object> tempList = new ArrayList<Object>();
				for (int i=0; i<list.size(); i++){
					tempList.add(new SchoolBean((School)list.get(i)));
				}
				return new ResultBean("成功",0,tempList);
			}
		}
	}
	@RequestMapping(value="/schoolArea")
    public @ResponseBody Object schoolArea(HttpServletRequest request
    		,@RequestParam(value = "saId", required = true) String saId){
		SchoolArea schoolArea = schoolAreaService.selectById(saId);
		if (schoolArea == null) {
			return new ResultBean("不存在该学区",-1,null);
		} else {
			SchoolAreaBean schoolAreaBean = new SchoolAreaBean(schoolArea);
			return new ResultBean("成功",0,schoolAreaBean);
		}
		
	}
	@RequestMapping(value="/search")
	 public @ResponseBody Object search(HttpServletRequest request
	    		,@RequestParam(value = "lng", required = true) float lng,
	    		@RequestParam(value = "lat", required = true) float lat,
	    		@RequestParam(value = "tag", required = false) String tag){
		List<Object> list = schoolAreaService.listAll();
		Boolean findTag = false;
		int i ;
		for (i=0; i<list.size(); i++){
			String pointsString = ((SchoolArea)list.get(i)).getSaPoints();
			Point point = new Point(lng,lat);
			if (pointsString != null && !pointsString.equals("")){
				Gson gson = new Gson();
				ArrayList<Point> points = gson.fromJson(pointsString, new TypeToken<List<Point>>(){}.getType());
				if (PointUtil.pointIsInPolygon(point,points) == 1) {
					findTag = true;
					break;
				}
			}			
		}
		
		if (findTag){
			Map map = new HashMap();
			SchoolArea schoolArea = (SchoolArea)list.get(i);
			map.put("schoolArea", new SchoolAreaBean(schoolArea));
			if ("1".equals(tag)){
				String saId = schoolArea.getSaId();
				String districtId = schoolAreaService.selectById(saId).getDistrictId();
				String dName = districtService.selectById(districtId).getdName();
				map.put("districtName", dName);
			} 
			return new ResultBean("找到学区",0,map);
		} else {
			return new ResultBean("未找到该学区",-1,null);
		}
	}

}
