package com.map.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.District;
import com.map.pojo.School;

public class SchoolDAO extends AbstractDAO{
	public void deleteByPrimaryKey(String sId){
		SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            session.delete(getSqlId(), sId);
	        } finally {
	            if (session != null) {
	                session.clearCache();
	                session.close();
	            }
     }
	}

    public void insert(School school){
    	 school.setsAddtime(new Date());
    	 school.setsUpdatetime(new Date());
    	
	       SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           session.insert(this.getSqlId(), school);
	       } finally {
	           if (session != null) {
	               session.clearCache();
	               session.close();
	           }
	       }
    }
    public List<Object> selectAll(){
    	SqlSession session = null;
    	 try {
             session = this.getSqlSessionFactory().openSession();
             return session.selectList(this.getSqlId());
         } finally {
             if (session != null) {
                 session.clearCache();
                 session.close();
             }
         }
    }
    public List<Object> selectByType(String type){
    	SqlSession session = null;
    	 try {
             session = this.getSqlSessionFactory().openSession();
             return session.selectList(this.getSqlId(),type);
         } finally {
             if (session != null) {
                 session.clearCache();
                 session.close();
             }
         }
    }
    public List<Object> selectAllBySaId(String name){
    	SqlSession session = null;
    	 try {
             session = this.getSqlSessionFactory().openSession();
             return session.selectList(this.getSqlId(),name);
         } finally {
             if (session != null) {
                 session.clearCache();
                 session.close();
             }
         }
    }
    public School selectByName(String name){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            List<Object> list = session.selectList(this.getSqlId(), name);
	            if (list.size() > 0) {
	            	return (School)list.get(0);
	            } else {
	            	return null;
	            }
	        } finally {
	            if (session != null) {
	                session.clearCache();
	                session.close();
	            }
        }
    }
    public List<Object> simpleSelectAllBySaId(String saId){
    	SqlSession session = null;
    	 try {
             session = this.getSqlSessionFactory().openSession();
             return session.selectList(this.getSqlId(),saId);
         } finally {
             if (session != null) {
                 session.clearCache();
                 session.close();
             }
         }
    }
    public School selectByPrimaryKey(String sId){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            List<Object> list = session.selectList(this.getSqlId(), sId);
	            if (list.size() > 0) {
	            	return (School)list.get(0);
	            } else {
	            	return null;
	            }
	        } finally {
	            if (session != null) {
	                session.clearCache();
	                session.close();
	            }
      }
    }
//
//    int updateByPrimaryKeySelective(School record);
//
   public void update(School school){
    	school.setsUpdatetime(new Date());
    	SqlSession session = null;
        try {
            session = this.getSqlSessionFactory().openSession();
            session.update(getSqlId(), school);
        } finally {
            if (session != null) {
                session.clearCache();
                session.close();
            }
        }
    }
//
//    int updateByPrimaryKey(School record);
}