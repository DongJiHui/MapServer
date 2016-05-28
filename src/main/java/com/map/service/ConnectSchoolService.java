package com.map.service;

import java.util.List;

import javax.annotation.Resource;

import com.map.dao.SchoolDAO;
import com.map.dao.SchoolSchoolConnectDAO;
import com.map.pojo.School;
import com.map.pojo.SchoolSchoolConnect;
import com.map.pojo.SchoolSchoolConnectKey;



public class ConnectSchoolService {
	@Resource 
	private SchoolSchoolConnectDAO schoolConnectDAO = null;
	
	@Resource
	private SchoolDAO schoolDAO = null;
	
	public void insert(SchoolSchoolConnect connect) {
		schoolConnectDAO.insert(connect);
	}
	public List<Object> selectAllWithSchool() {
		List<Object> list = schoolConnectDAO.selectAll();
		for (int i=0; i<list.size(); i++){
			SchoolSchoolConnect connect =(SchoolSchoolConnect)list.get(i);
			School school = schoolDAO.selectByPrimaryKey(connect.getsId1());
			connect.setSchool1(school);
			school = schoolDAO.selectByPrimaryKey(connect.getsId2());
			connect.setSchool2(school);
		}
		return list;
	}
	public void deleteByPrimaryKey(SchoolSchoolConnectKey key){
		schoolConnectDAO.deleteByPrimaryKey(key);
	}
	
	
}
