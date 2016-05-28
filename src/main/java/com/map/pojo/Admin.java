package com.map.pojo;

import java.util.Date;

public class Admin {
    private String aUsername;

    private String aPassword;

    private String aEmail;

    private Date aAddtime;

    private Date aUpdatetime;

    public String getaUsername() {
        return aUsername;
    }

    public void setaUsername(String aUsername) {
        this.aUsername = aUsername == null ? null : aUsername.trim();
    }

    public String getaPassword() {
        return aPassword;
    }

    public void setaPassword(String aPassword) {
        this.aPassword = aPassword == null ? null : aPassword.trim();
    }

    public String getaEmail() {
        return aEmail;
    }

    public void setaEmail(String aEmail) {
        this.aEmail = aEmail == null ? null : aEmail.trim();
    }

    public Date getaAddtime() {
        return aAddtime;
    }

    public void setaAddtime(Date aAddtime) {
        this.aAddtime = aAddtime;
    }

    public Date getaUpdatetime() {
        return aUpdatetime;
    }

    public void setaUpdatetime(Date aUpdatetime) {
        this.aUpdatetime = aUpdatetime;
    }
}