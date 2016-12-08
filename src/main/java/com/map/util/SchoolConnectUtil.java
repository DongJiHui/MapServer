package com.map.util;

import java.util.HashMap;
import java.util.Map;

public class SchoolConnectUtil {
	private static Map<String,String> map;
	static {
		map = new HashMap<String,String>();
		map.put("pm", "小学-初中");
		map.put("mh", "初中-高中");
	}
	public static String typeMapping(String type){
		return map.get(type);
	}
}
