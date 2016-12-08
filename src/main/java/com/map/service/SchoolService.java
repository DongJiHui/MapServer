package com.map.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.map.dao.SchoolAreaSchoolMappingDAO;
import com.map.dao.SchoolDAO;
import com.map.pojo.District;
import com.map.pojo.School;
import com.map.pojo.SchoolAreaSchoolMapping;

public class SchoolService {
	@Resource
	private SchoolDAO schoolDAO = null;
	@Resource
	private SchoolAreaSchoolMappingDAO mappingDAO = null;
	
	public void insert(School school,String schoolAreaId,HttpSession session){
		UUID uuid = UUID.randomUUID();
		String sId = uuid.toString();
		school.setsId(sId);
		schoolDAO.insert(school);
		SchoolAreaSchoolMapping mapping = new SchoolAreaSchoolMapping();
		mapping.setmAddadmin((String)session.getAttribute("userName"));
		mapping.setmUpdateadmin((String)session.getAttribute("userName"));
		mapping.setSaId(schoolAreaId);
		mapping.setsId(sId);
		mappingDAO.insert(mapping);
	}
	public List<Object> simpleSelectAllBySaId(String saId){
		return schoolDAO.simpleSelectAllBySaId(saId);
	}
	public List<Object> listAll(){
		return schoolDAO.selectAll();
	}
	public List<Object> listAllBySaId(String name){
		return schoolDAO.selectAllBySaId(name);
	}
    public School selectById(String id){
		return schoolDAO.selectByPrimaryKey(id);
	}
    public School selectByName(String name){
		return schoolDAO.selectByName(name);
	}
    public List<Object> selectByType(String type){
		return schoolDAO.selectByType(type);
	}
    public void update(School school,String schoolAreaId,HttpSession session){
		schoolDAO.update(school);
		SchoolAreaSchoolMapping mapping = new SchoolAreaSchoolMapping();
		mapping.setmUpdateadmin((String)session.getAttribute("userName"));
		mapping.setSaId(schoolAreaId);
		mapping.setsId(school.getsId());
		mappingDAO.updateBySid(mapping);
	}
    public void deleteById(String id){
    	schoolDAO.deleteByPrimaryKey(id);
    }
}
