package com.map.dao;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.District;

public class DistrictDAO extends AbstractDAO{

    public void insert(District district){
    	
    	 district.setdAddtime(new Date());
    	 district.setdUpdatetime(new Date());
        SqlSession session = null;
        try {
            session = this.getSqlSessionFactory().openSession();
            session.insert(this.getSqlId(), district);
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
    public District selectByPrimaryKey(String dId){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            List<Object> list = session.selectList(this.getSqlId(), dId);
	            if (list.size() > 0) {
	            	return (District)list.get(0);
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
    public District selectByName(String name){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            List<Object> list = session.selectList(this.getSqlId(), name);
	            if (list.size() > 0) {
	            	return (District)list.get(0);
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
   public void deleteByPrimaryKey(String id){
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            session.delete(getSqlId(), id);
	        } finally {
	            if (session != null) {
	                session.clearCache();
	                session.close();
	            }
       }
    }
    
   public void update(District district){
    	 district.setdUpdatetime(new Date());
    	  SqlSession session = null;
          try {
              session = this.getSqlSessionFactory().openSession();
              session.update(getSqlId(), district);
          } finally {
              if (session != null) {
                  session.clearCache();
                  session.close();
              }
          }
    }
}