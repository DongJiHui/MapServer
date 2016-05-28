package com.map.service;

import javax.annotation.Resource;

import com.map.dao.AdminDAO;
import com.map.pojo.Admin;


public class AdminService {
	@Resource 
	private AdminDAO dao = null;
	
	public String getPwd(String userName){
		Admin admin = dao.selectByPrimaryKey(userName);
		if (admin == null){
			return null;
		} else {
			return admin.getaPassword();
		}
	}
}
