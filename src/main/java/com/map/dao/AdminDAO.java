package com.map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.Admin;
import com.map.pojo.District;

public class AdminDAO extends AbstractDAO{
//    int deleteByPrimaryKey(String aUsername);
//
//    int insert(Admin record);
//
//    int insertSelective(Admin record);
//
    public Admin selectByPrimaryKey(String aUsername) {
    	SqlSession session = null;
	   	 try {
	            session = this.getSqlSessionFactory().openSession();
	            List<Object> list = session.selectList(this.getSqlId(), aUsername);
	            if (list.size() > 0) {
	            	return (Admin)list.get(0);
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
//    int updateByPrimaryKeySelective(Admin record);
//
//    int updateByPrimaryKey(Admin record);
}