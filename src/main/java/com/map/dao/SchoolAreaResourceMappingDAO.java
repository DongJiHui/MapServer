package com.map.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.SchoolAreaResourceMapping;

public class SchoolAreaResourceMappingDAO extends AbstractDAO{

//    int deleteByPrimaryKey(SchoolAreaSchoolMappingKey key);
//
	 public void insert(SchoolAreaResourceMapping mapping){
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
	 public void updateByRid(SchoolAreaResourceMapping record){
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