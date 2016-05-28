package com.map.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.SchoolArea;

public class SchoolAreaDAO extends AbstractDAO{
    

    public void insert(SchoolArea schoolArea){
    
	   	 schoolArea.setSaAddtime(new Date());
	   	 schoolArea.setSaUpdatetime(new Date());
	       SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           session.insert(this.getSqlId(), schoolArea);
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
    public List<Object> selectAllByDName(String name){
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
    public List<Object> simpleSelectAll(){
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
    public void deleteByPrimaryKey(String saId){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            session.delete(getSqlId(), saId);
	        } finally {
	            if (session != null) {
	                session.clearCache();
	                session.close();
	            }
      }
    }
//
//    int insertSelective(SchoolArea record);
//
    public SchoolArea selectByPrimaryKey(String saId){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            List<Object> list = session.selectList(this.getSqlId(), saId);
	            if (list.size() > 0) {
	            	return (SchoolArea)list.get(0);
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


   public void update(SchoolArea schoolArea){
    	schoolArea.setSaUpdatetime(new Date());SqlSession session = null;
        try {
            session = this.getSqlSessionFactory().openSession();
            session.update(getSqlId(), schoolArea);
        } finally {
            if (session != null) {
                session.clearCache();
                session.close();
            }
        }
    }
}