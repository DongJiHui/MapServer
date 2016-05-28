package com.map.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.map.dao.ResourceDAO;
import com.map.dao.SchoolAreaResourceMappingDAO;
import com.map.pojo.EduResource;
import com.map.pojo.School;
import com.map.pojo.SchoolAreaResourceMapping;
import com.map.pojo.SchoolAreaSchoolMapping;

public class ResourceService {
	@Resource
	private ResourceDAO resourceDAO = null;
	@Resource
	private SchoolAreaResourceMappingDAO mappingDAO = null;
	
	public void insert(EduResource resource,String shcoolAreaId,HttpSession session){
		UUID uuid = UUID.randomUUID();
		String rId = uuid.toString();
		resource.setrId(rId);
		resourceDAO.insert(resource);
		SchoolAreaResourceMapping mapping = new SchoolAreaResourceMapping();
		mapping.setmAddadmin((String)session.getAttribute("userName"));
		mapping.setmUpdateadmin((String)session.getAttribute("userName"));
		mapping.setSaId(shcoolAreaId);
		mapping.setrId(rId);
		mappingDAO.insert(mapping);
	}
	public List<Object> simpleSelectAllBySaId(String saId){
		return resourceDAO.simpleSelectAllBySaId(saId);
	}
	public List<Object> listAll(){
		return resourceDAO.selectAll();
	}
	public List<Object> listAllBySaId(String name){
		return resourceDAO.selectAllBySaId(name);
	}
    public 	EduResource selectById(String id){
		return resourceDAO.selectByPrimaryKey(id);
	}
    public List<Object> selectByType(String type){
		return resourceDAO.selectByType(type);
	}
    public void update(EduResource resource,String schoolAreaId,HttpSession session){
    	resourceDAO.update(resource);
    	SchoolAreaResourceMapping mapping = new SchoolAreaResourceMapping();
		mapping.setmUpdateadmin((String)session.getAttribute("userName"));
		mapping.setSaId(schoolAreaId);
		mapping.setrId(resource.getrId());
		mappingDAO.updateByRid(mapping);
	}
    public void deleteById(String id){
    	resourceDAO.deleteByPrimaryKey(id);
    }
}
