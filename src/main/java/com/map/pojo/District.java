package com.map.pojo;

import java.util.Date;

public class District {
    private String dId;

    private String dName;

    private Date dAddtime;

    private String dAddadmin;

    private Date dUpdatetime;

    private String dUpadateadmin;

    public String getdId() {
        return dId;
    }

    public void setdId(String dId) {
        this.dId = dId == null ? null : dId.trim();
    }

    public String getdName() {
        return dName;
    }

    public void setdName(String dName) {
        this.dName = dName == null ? null : dName.trim();
    }

    public Date getdAddtime() {
        return dAddtime;
    }

    public void setdAddtime(Date dAddtime) {
        this.dAddtime = dAddtime;
    }

    public String getdAddadmin() {
        return dAddadmin;
    }

    public void setdAddadmin(String dAddadmin) {
        this.dAddadmin = dAddadmin == null ? null : dAddadmin.trim();
    }

    public Date getdUpdatetime() {
        return dUpdatetime;
    }

    public void setdUpdatetime(Date dUpdatetime) {
        this.dUpdatetime = dUpdatetime;
    }

    public String getdUpadateadmin() {
        return dUpadateadmin;
    }

    public void setdUpadateadmin(String dUpadateadmin) {
        this.dUpadateadmin = dUpadateadmin == null ? null : dUpadateadmin.trim();
    }
}