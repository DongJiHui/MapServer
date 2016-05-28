package com.map.dao;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.DistrictSchoolAreaMapping;
import com.map.pojo.DistrictSchoolAreaMappingKey;

public class DistrictSchoolAreaMappingDAO extends AbstractDAO{
   
    public void insert(DistrictSchoolAreaMapping mapping){
    	mapping.setmAddtime(new Date());
    	mapping.setmUpadatetime(new Date());
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
    
//    int deleteByPrimaryKey(DistrictSchoolAreaMappingKey key);
//
//
//    int insertSelective(DistrictSchoolAreaMapping record);
//
//    DistrictSchoolAreaMapping selectByPrimaryKey(DistrictSchoolAreaMappingKey key);
//
//    int updateByPrimaryKeySelective(DistrictSchoolAreaMapping record);
//
    public void updateBySaid(DistrictSchoolAreaMapping record){
    	record.setmUpadatetime(new Date());
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