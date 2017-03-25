package com.map.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.SchoolSchoolAllocation;
import com.map.pojo.SchoolSchoolAllocationKey;


public class SchoolSchoolAllocationDAO extends AbstractDAO{
   public void deleteByPrimaryKey(SchoolSchoolAllocationKey key){
	 SqlSession session = null;
     try {
         session = this.getSqlSessionFactory().openSession();
         session.delete(getSqlId(), key);
     } finally {
         if (session != null) {
             session.clearCache();
             session.close();
         }
     }
}
	 public void insert(SchoolSchoolAllocation allocation){
		 allocation.setAlAddtime(new Date());
		 allocation.setAlUpdatetime(new Date());
	    	 SqlSession session = null;
	         try {
	             session = this.getSqlSessionFactory().openSession();
	             session.insert(this.getSqlId(), allocation);
	         } finally {
	             if (session != null) {
	                 session.clearCache();
	                 session.close();
	             }
	         }
	    }
	 public SchoolSchoolAllocation selectByPrimaryKey(SchoolSchoolAllocationKey key){
		 SqlSession session = null;
		 List<Object> list;
         try {
             session = this.getSqlSessionFactory().openSession();
              list= session.selectList(this.getSqlId(), key);
         } finally {
             if (session != null) {
                 session.clearCache();
                 session.close();
             }
         }
         if (null == list || list.isEmpty()){
        	 return null;
         } else {
        	 return (	SchoolSchoolAllocation)list.get(0);
         }
	 }
	 public List<Object> selectAllByDName(String DName){
		   SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           return session.selectList(this.getSqlId(),DName);
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
}