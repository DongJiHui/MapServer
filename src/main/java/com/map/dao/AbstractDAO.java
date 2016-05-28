package com.map.dao;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSessionFactory;

public class AbstractDAO {

    /** 数据库访问对象 */
    @Resource
    private SqlSessionFactory sqlSessionFactory;

    /**
     * 取得数据库访问对象
     * 
     * @return 数据库访问对象
     */
    public SqlSessionFactory getSqlSessionFactory() {
        return sqlSessionFactory;
    }

    /**
     * 设置数据库访问对象
     * 
     * @param sqlSessionFactory 数据库访问对象
     */
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        this.sqlSessionFactory = sqlSessionFactory;
    }

    /**
     * 取得SQLID<br/>
     * 根据类名、方法名创建SQL ID
     * 
     * @return SQLID
     */
    public String getSqlId() {
        StringBuilder sqlid = new StringBuilder();
        sqlid.append(this.getClass().getName());
        sqlid.append(".");
        sqlid.append(Thread.currentThread().getStackTrace()[2].getMethodName());
        return sqlid.toString();
    }

	}
