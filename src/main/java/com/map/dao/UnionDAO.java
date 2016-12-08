package com.map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.Union;

public class UnionDAO extends AbstractDAO{
	public void insert(Union record) {
		 SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           session.insert(this.getSqlId(), record);
	       } finally {
	           if (session != null) {
	               session.clearCache();
	               session.close();
	           }
	       }
	}
	
	public List<Object> listAll() {
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
	public void deleteByPrimaryKey(String unId) {
		SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           session.delete(this.getSqlId(),unId);
	       } finally {
	           if (session != null) {
	               session.clearCache();
	               session.close();
	           }
	       }
	}
	 public  Union selectByPrimaryKey(String unId) {
		 SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           List<Object> list = session.selectList(getSqlId(),unId);
	           if (null != list && list.size() == 1){
	        	   return (Union)list.get(0);
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
   /* 
    int insertSelective(Union record);
   
    int updateByPrimaryKeySelective(Union record);

    int updateByPrimaryKey(Union record);*/
}