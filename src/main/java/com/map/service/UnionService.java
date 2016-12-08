package com.map.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import com.map.dao.SchoolDAO;
import com.map.dao.UnionDAO;
import com.map.dao.UnionSchoolMappingDAO;
import com.map.pojo.School;
import com.map.pojo.Union;
import com.map.pojo.UnionSchoolMapping;

public class UnionService {
	@Resource
	private UnionDAO unionDAO = null;
	@Resource
	private SchoolDAO schoolDAO = null;
	@Resource
	private UnionSchoolMappingDAO mappingDAO = null;
	
	public Map<String,List> selectBySId(String sId){
		Map<String,List> map = new HashMap();
		List<Object> list = mappingDAO.selectBySId(sId);
		for (int i = 0; i<list.size(); i++){
			UnionSchoolMapping mapping = (UnionSchoolMapping)list.get(i);
			if (!map.containsKey(mapping.getUnId())) {
				List<School> tmp = new ArrayList<>();
				List<Object> unionSchoolMappingList =  mappingDAO.selectByUnId(mapping.getUnId());
				for  (int j = 0; j<unionSchoolMappingList.size(); j++) {
					UnionSchoolMapping m = (UnionSchoolMapping)unionSchoolMappingList.get(j);
					schoolDAO.selectByPrimaryKey(m.getsId());
					tmp.add(schoolDAO.selectByPrimaryKey(m.getsId()));
				}
				map.put(mapping.getUnId(), tmp);
			} 
		}
		return map;
	}
	
	public List<Object> listAll() {
		return unionDAO.listAll();
	}
	public void deleteByUnId(String unId){
		mappingDAO.deleteByUnId(unId);
		unionDAO.deleteByPrimaryKey(unId);
	}
	public List<Object> listMappingByUnId(String unId){
		return mappingDAO.selectByUnId(unId);
	}
	
	public Union getUnionBaseInfo(String unId){
		return unionDAO.selectByPrimaryKey(unId);
	}
	public void insert(Union union ,String [] schoolList ,HttpSession session){
		UUID uuid = UUID.randomUUID();
		String unId = uuid.toString();
	    union.setUnId(unId);
		unionDAO.insert(union);
		for (int i=0;  i<schoolList.length; i++){
			UnionSchoolMapping mapping = new UnionSchoolMapping();
			mapping.setPriority(i);
			mapping.setsId(schoolList[i]);
			mapping.setUnId(union.getUnId());
			mappingDAO.insert(mapping);
		}
	}
	
}
