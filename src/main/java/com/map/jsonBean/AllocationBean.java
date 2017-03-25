package com.map.jsonBean;

import java.util.List;

public class AllocationBean {
	private String middleSchoolId;
	private String middleSchoolName;
	private List highSchools;
	public String getMiddleSchoolId() {
		return middleSchoolId;
	}
	public void setMiddleSchoolId(String middleSchoolId) {
		this.middleSchoolId = middleSchoolId;
	}
	public String getMiddleSchoolName() {
		return middleSchoolName;
	}
	public void setMiddleSchoolName(String middleSchoolName) {
		this.middleSchoolName = middleSchoolName;
	}
	public List getHighSchools() {
		return highSchools;
	}
	public void setHighSchools(List highSchools) {
		this.highSchools = highSchools;
	}
	public AllocationBean(String middleSchoolId, String middleSchoolName,
			List highSchools) {
		super();
		this.middleSchoolId = middleSchoolId;
		this.middleSchoolName = middleSchoolName;
		this.highSchools = highSchools;
	}
	
}
