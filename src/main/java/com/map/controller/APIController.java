package com.map.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.map.constant.VersionConstant;
import com.map.jsonBean.AllocationBean;
import com.map.jsonBean.Point;
import com.map.jsonBean.ResultBean;
import com.map.jsonBean.SchoolAreaBean;
import com.map.jsonBean.SchoolBean;
import com.map.pojo.School;
import com.map.pojo.SchoolArea;
import com.map.pojo.SchoolSchoolAllocation;
import com.map.pojo.SchoolSchoolConnect;
import com.map.pojo.Union;
import com.map.service.AllocateSchoolService;
import com.map.service.ConnectSchoolService;
import com.map.service.DistrictService;
import com.map.service.SchoolAreaService;
import com.map.service.SchoolService;
import com.map.service.UnionService;
import com.map.util.PointUtil;
import com.map.util.SchoolConnectUtil;

@Controller  
@RequestMapping("/api")  
public class APIController {
	@Resource
    private DistrictService districtService= null;
	
	@Resource
	private SchoolAreaService schoolAreaService = null;
	
	@Resource
	private SchoolService schoolService = null;
	
	@Resource
	private ConnectSchoolService connectSchoolService = null;
	
	@Resource
	private UnionService unionService = null;
	
	@Resource
	private AllocateSchoolService allocateSchoolService = null;
	
	
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
	
	
	@RequestMapping(value="/union")
    public @ResponseBody Object union(HttpServletRequest request
    		,@RequestParam(value = "sId", required = true) String sId){
		Map<String,List> map = unionService.selectBySId(sId);
		List resultArray = new ArrayList();
		for (String key : map.keySet()) {
			Union union = unionService.getUnionBaseInfo(key);
			Map tmp = new HashMap();
			tmp.put("unId",union.getUnId());
			tmp.put("unName", union.getUnName());
			tmp.put("unType", union.getUnType());
			tmp.put("unMember", map.get(key));
			resultArray.add(tmp);
		}
		return resultArray;
	}
	@RequestMapping(value="/schoolMapping")
    public @ResponseBody Object schoolMapping(HttpServletRequest request
    		,@RequestParam(value = "sId", required = true) String sId,@RequestParam(value = "connectType", required = false) String connectType){
		List<Object> list = connectSchoolService.selectBySIdWithSchool(sId);
		List<Map> returnList = new ArrayList<Map>();
		for (int i=0; i<list.size(); i++){
			Map map = new HashMap<String,String>();
			SchoolSchoolConnect connect = (SchoolSchoolConnect)list.get(i);
			map.put("connectType",SchoolConnectUtil.typeMapping(connect.getcType()) );
			SchoolBean schoolBean = null;
			if (connect.getsId1().equals(sId)) {
				schoolBean = new SchoolBean(connect.getSchool2());
			} else if (connect.getsId2().equals(sId)) {
				schoolBean = new SchoolBean(connect.getSchool1());
			}
			map.put("school",schoolBean );
			if ( connectType == null){
				returnList.add(map);
			} else {
				if (map.get("connectType").equals(connectType)){
					returnList.add(map);
				}
			}
			
		}
		ResultBean resultBean = new ResultBean();
		if (list == null || list.isEmpty()){
			resultBean.setResultCode(-1);
			resultBean.setResultMsg("该学校不存在关系");
		} else {
			resultBean.setResultCode(0);
			resultBean.setResultMsg("找到学校关系");
			resultBean.setResult(returnList);
		}
		return resultBean;
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
	@RequestMapping(value="/version")
	 public @ResponseBody Object version(HttpServletRequest request){
		Map map = new HashMap<String,String>();
		map.put("versionCode", VersionConstant.versionCode);
		map.put("versionDesc", VersionConstant.versionDecs);
		return map;
	}
	@RequestMapping(value="/appDownload")
	public void appDownload(HttpServletResponse response) {
		File file = new File(VersionConstant.address);
		if (file== null || !file.exists()){
			System.out.println("aa");
			return;
		}
		OutputStream out = null;
		try {
			response.reset();
			response.setContentType("application/octet-stream; charset=utf-8");
			response.setHeader("Content-Disposition","attachment; filename="+file.getName());
			out = response.getOutputStream();
			out.write(FileUtils.readFileToByteArray(file));
			out.flush();
		} catch (IOException e){
			e.printStackTrace();
		} finally{
			if (out != null) {
				try {
					out.close();
				}catch (IOException e){
					e.printStackTrace();
				}
			}
		}
	}
	@RequestMapping(value="/quotaAllocation")
	 public @ResponseBody Object quotaAllocation(HttpServletRequest request,
			 @RequestParam(value = "districtName", required = true) String districtName){
		ResultBean resultBean = new ResultBean();
		List<Object> list = allocateSchoolService.selectByDNameWithSchool(districtName);
		if (list == null && list.isEmpty()){
			resultBean.setResultCode(-1);
			resultBean.setResultMsg("无结果");
		}else {
			resultBean.setResultCode(0);
			resultBean.setResultMsg("成功");
			Map<String,AllocationBean> resMap = new HashMap<String,AllocationBean>();
			for (Object al  : list){
				SchoolSchoolAllocation allocation = (SchoolSchoolAllocation) al;
				String key = allocation.getAlMsId();
				if (resMap.containsKey(key)){
					List tmpList = resMap.get(key).getHighSchools();
					Map<String,Object> tmpMap = new HashMap<String,Object>();
					tmpMap.put("highSchoolId", allocation.getAlHsId());
					tmpMap.put("highSchoolName", allocation.getHighSchool().getsName());
					tmpMap.put("quota", allocation.getAlQuota());
					tmpList.add(tmpMap);
				}else {
					List<Map> tmpList = new ArrayList<Map>();
					Map<String,Object> tmpMap = new HashMap<String,Object>();
					tmpMap.put("highSchoolId", allocation.getAlHsId());
					tmpMap.put("highSchoolName", allocation.getHighSchool().getsName());
					tmpMap.put("quota", allocation.getAlQuota());
					tmpList.add(tmpMap);
					AllocationBean allocationBean = new AllocationBean(allocation.getAlMsId(),allocation.getMiddleSchool().getsName(),tmpList);
					resMap.put(key, allocationBean);
				}
			}
			resultBean.setResult(resMap.values());
		}
		return resultBean;
	}

}
