package com.map.pojo;

import java.util.Date;

public class SchoolSchoolConnect extends SchoolSchoolConnectKey {
    private String cType;

    private Date cAddtime;

    private String cAddadmin;

    private Date cUpdatetime;

    private String cUpdateadmin;
    
    private School school1;
    
    private School school2;
    

    public School getSchool1() {
		return school1;
	}

	public void setSchool1(School school1) {
		this.school1 = school1;
	}

	public School getSchool2() {
		return school2;
	}

	public void setSchool2(School school2) {
		this.school2 = school2;
	}

	public String getcType() {
        return cType;
    }

    public void setcType(String cType) {
        this.cType = cType == null ? null : cType.trim();
    }

    public Date getcAddtime() {
        return cAddtime;
    }

    public void setcAddtime(Date cAddtime) {
        this.cAddtime = cAddtime;
    }

    public String getcAddadmin() {
        return cAddadmin;
    }

    public void setcAddadmin(String cAddadmin) {
        this.cAddadmin = cAddadmin == null ? null : cAddadmin.trim();
    }

    public Date getcUpdatetime() {
        return cUpdatetime;
    }

    public void setcUpdatetime(Date cUpdatetime) {
        this.cUpdatetime = cUpdatetime;
    }

    public String getcUpdateadmin() {
        return cUpdateadmin;
    }

    public void setcUpdateadmin(String cUpdateadmin) {
        this.cUpdateadmin = cUpdateadmin == null ? null : cUpdateadmin.trim();
    }
}