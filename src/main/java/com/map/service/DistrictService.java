package com.map.service;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import com.map.dao.DistrictDAO;
import com.map.pojo.District;



public class DistrictService {
	@Resource 
	private DistrictDAO dao = null;
	
	public void insert(District district) {
		 UUID uuid = UUID.randomUUID();
    	 district.setdId(uuid.toString());
		dao.insert(district);
	}
	
	public void update(District district){
		dao.update(district);
	}
	public List<Object> listAll(){
		return dao.selectAll();
	}
	
	public District selectById(String id){
		return dao.selectByPrimaryKey(id);
	}
	public void deleteById(String id){
		dao.deleteByPrimaryKey(id);
	}
	
    
}
