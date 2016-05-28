package com.map.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.DistrictSchoolAreaMapping;
import com.map.pojo.SchoolAreaSchoolMapping;

public class SchoolAreaSchoolMappingDAO extends AbstractDAO{

//    int deleteByPrimaryKey(SchoolAreaSchoolMappingKey key);
//
	 public void insert(SchoolAreaSchoolMapping mapping){
	    	mapping.setmAddtime(new Date());
	    	mapping.setmUpdatetime(new Date());
	    	 SqlSession session = null;
	         try {
	             session = this.getSqlSessionFactory().openSession();
	             session.insert(this.getSqlId(), mapping);
	         } finally {
	             if (session != null) {
	                 session.clearCache();
	                 session.close();
	             }
	         }
	    }
//
//    int insertSelective(SchoolAreaSchoolMapping record);
//
//    SchoolAreaSchoolMapping selectByPrimaryKey(SchoolAreaSchoolMappingKey key);
//
	 public void updateBySid(SchoolAreaSchoolMapping record){
	    	record.setmUpdatetime(new Date());
	    	 SqlSession session = null;
	         try {
	             session = this.getSqlSessionFactory().openSession();
	             session.update(getSqlId(), record);
	         } finally {
	             if (session != null) {
	                 session.clearCache();
	                 session.close();
	             }
	         }
	    }
}