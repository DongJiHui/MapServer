package com.map.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.SchoolSchoolConnect;
import com.map.pojo.SchoolSchoolConnectKey;

public class SchoolSchoolConnectDAO extends AbstractDAO{
   public void deleteByPrimaryKey(SchoolSchoolConnectKey key){
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

    public void insert(SchoolSchoolConnect connect){
    	connect.setcAddtime(new Date());
    	connect.setcUpdatetime(new Date());
    	 SqlSession session = null;
         try {
             session = this.getSqlSessionFactory().openSession();
             session.insert(this.getSqlId(), connect);
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
//
//    int insertSelective(SchoolSchoolConnect record);
//
//    SchoolSchoolConnect selectByPrimaryKey(SchoolSchoolConnectKey key);
//
//    int updateByPrimaryKeySelective(SchoolSchoolConnect record);
//
//    int updateByPrimaryKey(SchoolSchoolConnect record);
}