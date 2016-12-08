package com.map.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.map.pojo.Union;
import com.map.pojo.UnionSchoolMapping;

public class UnionSchoolMappingDAO extends AbstractDAO {
   

    public void insert(UnionSchoolMapping record){
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
    public void deleteByUnId(String unId){
    	SqlSession session = null;
        try {
            session = this.getSqlSessionFactory().openSession();
            session.delete(this.getSqlId(), unId);
        } finally {
            if (session != null) {
                session.clearCache();
                session.close();
            }
        }
    }
    public List<Object> selectByUnId(String unId){
    	SqlSession session = null;
        try {
            session = this.getSqlSessionFactory().openSession();
            return session.selectList(this.getSqlId(), unId);
        } finally {
            if (session != null) {
                session.clearCache();
                session.close();
            }
        }
    }

    public List<Object> selectBySId(String sId) {
		SqlSession session = null;
	       try {
	           session = this.getSqlSessionFactory().openSession();
	           return session.selectList(getSqlId(),sId);
	       } finally {
	           if (session != null) {
	               session.clearCache();
	               session.close();
	           }
	       }
	}
    /*int insertSelective(UnionSchoolMapping record);
     
    int updateByPrimaryKeySelective(UnionSchoolMapping record);

    int updateByPrimaryKey(UnionSchoolMapping record);*/
}