package com.map.service;

import java.util.List;

import javax.annotation.Resource;

import com.map.dao.SchoolAreaDAO;
import com.map.dao.SchoolDAO;
import com.map.dao.SchoolSchoolAllocationDAO;
import com.map.pojo.School;
import com.map.pojo.SchoolArea;
import com.map.pojo.SchoolSchoolAllocation;
import com.map.pojo.SchoolSchoolAllocationKey;



public class AllocateSchoolService {
	@Resource 
	private SchoolSchoolAllocationDAO schoolAllocateDAO = null;
	
	@Resource
	private SchoolDAO schoolDAO = null;
	
	@Resource
	private SchoolAreaDAO schoolAreaDAO = null;
	
	public void insert(SchoolSchoolAllocation allocation) {
		if (schoolAllocateDAO.selectByPrimaryKey(allocation) == null){
			schoolAllocateDAO.insert(allocation);
		}
		
	}
	public List<Object> selectAllWithData() {
		List<Object> list = schoolAllocateDAO.selectAll();
		for (int i=0; i<list.size(); i++){
			SchoolSchoolAllocation allocation =(SchoolSchoolAllocation)list.get(i);
			School school = schoolDAO.selectByPrimaryKey(allocation.getAlMsId());
			allocation.setMiddleSchool(school);
			school = schoolDAO.selectByPrimaryKey(allocation.getAlHsId());
			allocation.setHighSchool(school);
		}
		return list;
	}
//	public List<Object> selectBySIdWithSchool (String sId){
//		List<Object> list = schoolConnectDAO.selectBySId(sId);
//		for (int i=0; i<list.size(); i++){
//			SchoolSchoolConnect connect =(SchoolSchoolConnect)list.get(i);
//			School school = schoolDAO.selectByPrimaryKey(connect.getsId1());
//			connect.setSchool1(school);
//			school = schoolDAO.selectByPrimaryKey(connect.getsId2());
//			connect.setSchool2(school);
//		}
//		return list;
//	}
	public void deleteByPrimaryKey(SchoolSchoolAllocationKey key){
		schoolAllocateDAO.deleteByPrimaryKey(key);
	}
	
	
}
