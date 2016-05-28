package com.map.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.map.dao.DistrictSchoolAreaMappingDAO;
import com.map.dao.SchoolAreaDAO;
import com.map.pojo.DistrictSchoolAreaMapping;
import com.map.pojo.SchoolArea;



public class SchoolAreaService {
	@Resource 
	private SchoolAreaDAO schoolAreaDao = null;
	
	@Resource
	private DistrictSchoolAreaMappingDAO mappingDao = null;
	
	public void insert(SchoolArea schoolArea,String districtId,HttpSession session) {
		UUID uuid = UUID.randomUUID();
		String saId = uuid.toString();
	   	schoolArea.setSaId(saId);
		schoolAreaDao.insert(schoolArea);
		DistrictSchoolAreaMapping mapping = new DistrictSchoolAreaMapping();
		mapping.setmAddadmin((String)session.getAttribute("userName"));
		mapping.setmUpdateadmin((String)session.getAttribute("userName"));
		mapping.setdId(districtId);
		mapping.setSaId(saId);
		mappingDao.insert(mapping);
	}
	public List<Object> listAll(){
		return schoolAreaDao.selectAll();
	}
	public List<Object> listAllByDName(String name){
		return schoolAreaDao.selectAllByDName(name);
	}

	
	public List<Object> simpleListAll(){
		return schoolAreaDao.simpleSelectAll();
	}
	public void update(SchoolArea schoolArea,String districtId,HttpSession session){
		schoolAreaDao.update(schoolArea);
		DistrictSchoolAreaMapping mapping = new DistrictSchoolAreaMapping();
		mapping.setmUpdateadmin((String)session.getAttribute("userName"));
		mapping.setdId(districtId);
		mapping.setSaId(schoolArea.getSaId());
		mappingDao.updateBySaid(mapping);
	}
	public SchoolArea selectById(String id){
		return schoolAreaDao.selectByPrimaryKey(id);
	}
	public void deleteById(String id){
		schoolAreaDao.deleteByPrimaryKey(id);
	}
	
    
}
