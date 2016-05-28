package com.map.pojo;

import java.util.Date;

public class DistrictSchoolAreaMapping extends DistrictSchoolAreaMappingKey {
    private Date mAddtime;

    private String mAddadmin;

    private Date mUpadatetime;

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

    public Date getmUpadatetime() {
        return mUpadatetime;
    }

    public void setmUpadatetime(Date mUpadatetime) {
        this.mUpadatetime = mUpadatetime;
    }

    public String getmUpdateadmin() {
        return mUpdateadmin;
    }

    public void setmUpdateadmin(String mUpdateadmin) {
        this.mUpdateadmin = mUpdateadmin == null ? null : mUpdateadmin.trim();
    }
}