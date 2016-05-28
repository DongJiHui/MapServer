package com.map.pojo;

import java.util.Date;

public class SchoolAreaSchoolMapping extends SchoolAreaSchoolMappingKey {
    private Date mAddtime;

    private String mAddadmin;

    private Date mUpdatetime;

    private String mUpdateadmin;

    public Date getmAddtime() {
        return mAddtime;
    }

    public void setmAddtime(Date mAddtime) {
        this.mAddtime = mAddtime;
    }

    public String getmAddadmin() {
        return mAddadmin;
    }

    public void setmAddadmin(String mAddadmin) {
        this.mAddadmin = mAddadmin == null ? null : mAddadmin.trim();
    }

    public Date getmUpdatetime() {
        return mUpdatetime;
    }

    public void setmUpdatetime(Date mUpdatetime) {
        this.mUpdatetime = mUpdatetime;
    }

    public String getmUpdateadmin() {
        return mUpdateadmin;
    }

    public void setmUpdateadmin(String mUpdateadmin) {
        this.mUpdateadmin = mUpdateadmin == null ? null : mUpdateadmin.trim();
    }
}