package com.map.pojo;

import java.util.Date;

public class SchoolSchoolAllocation extends SchoolSchoolAllocationKey {
    private Integer alQuota;

    private String alDName;

    private Date alAddtime;

    private String alAddadmin;

    private Date alUpdatetime;

    private String alUpdateadmin;
    
    private School middleSchool;
    
    private School highSchool;
    
    

    public Integer getAlQuota() {
        return alQuota;
    }

    public School getMiddleSchool() {
		return middleSchool;
	}

	public void setMiddleSchool(School middleSchool) {
		this.middleSchool = middleSchool;
	}

	public School getHighSchool() {
		return highSchool;
	}

	public void setHighSchool(School highSchool) {
		this.highSchool = highSchool;
	}

	

	public void setAlQuota(Integer alQuota) {
        this.alQuota = alQuota;
    }

    

    public String getAlDName() {
		return alDName;
	}

	public void setAlDName(String alDName) {
		this.alDName = alDName;
	}

	public Date getAlAddtime() {
        return alAddtime;
    }

    public void setAlAddtime(Date alAddtime) {
        this.alAddtime = alAddtime;
    }

    public String getAlAddadmin() {
        return alAddadmin;
    }

    public void setAlAddadmin(String alAddadmin) {
        this.alAddadmin = alAddadmin == null ? null : alAddadmin.trim();
    }

    public Date getAlUpdatetime() {
        return alUpdatetime;
    }

    public void setAlUpdatetime(Date alUpdatetime) {
        this.alUpdatetime = alUpdatetime;
    }

    public String getAlUpdateadmin() {
        return alUpdateadmin;
    }

    public void setAlUpdateadmin(String alUpdateadmin) {
        this.alUpdateadmin = alUpdateadmin == null ? null : alUpdateadmin.trim();
    }
}