package com.map.pojo;

import java.util.Date;

public class School {
    private String sId;

    private String sName;

    private String sAddress;

    private String sCharacter;

    private String sType;

    private String sScore;

    private String sDescription;

    private Integer sScaleparam;

    private String sMiddlepoint;

    private String sUrl;

    private String sPhone;

    private Date sAddtime;

    private String sAddadmin;

    private Date sUpdatetime;

    private String sUpdateadmin;

    private String sPoints;
    
    private SchoolAreaSchoolMapping schoolAreaSchoolMapping;
    
    public String getSchoolAreaId() {
		return schoolAreaSchoolMapping.getSaId();
	}

    public SchoolAreaSchoolMapping getSchoolAreaSchoolMapping() {
		return schoolAreaSchoolMapping;
	}

	public void setSchoolAreaSchoolMapping(
			SchoolAreaSchoolMapping schoolAreaSchoolMapping) {
		this.schoolAreaSchoolMapping = schoolAreaSchoolMapping;
	}

	public String getsId() {
        return sId;
    }

    public void setsId(String sId) {
        this.sId = sId == null ? null : sId.trim();
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsAddress() {
        return sAddress;
    }

    public void setsAddress(String sAddress) {
        this.sAddress = sAddress == null ? null : sAddress.trim();
    }

    public String getsCharacter() {
        return sCharacter;
    }

    public void setsCharacter(String sCharacter) {
        this.sCharacter = sCharacter == null ? null : sCharacter.trim();
    }

    public String getsType() {
        return sType;
    }

    public void setsType(String sType) {
        this.sType = sType == null ? null : sType.trim();
    }

    public String getsScore() {
        return sScore;
    }

    public void setsScore(String sScore) {
        this.sScore = sScore == null ? null : sScore.trim();
    }

    public String getsDescription() {
        return sDescription;
    }

    public void setsDescription(String sDescription) {
        this.sDescription = sDescription == null ? null : sDescription.trim();
    }

    public Integer getsScaleparam() {
        return sScaleparam;
    }

    public void setsScaleparam(Integer sScaleparam) {
        this.sScaleparam = sScaleparam;
    }

    public String getsMiddlepoint() {
        return sMiddlepoint;
    }

    public void setsMiddlepoint(String sMiddlepoint) {
        this.sMiddlepoint = sMiddlepoint == null ? null : sMiddlepoint.trim();
    }

    public String getsUrl() {
        return sUrl;
    }

    public void setsUrl(String sUrl) {
        this.sUrl = sUrl == null ? null : sUrl.trim();
    }

    public String getsPhone() {
        return sPhone;
    }

    public void setsPhone(String sPhone) {
        this.sPhone = sPhone == null ? null : sPhone.trim();
    }

    public Date getsAddtime() {
        return sAddtime;
    }

    public void setsAddtime(Date sAddtime) {
        this.sAddtime = sAddtime;
    }

    public String getsAddadmin() {
        return sAddadmin;
    }

    public void setsAddadmin(String sAddadmin) {
        this.sAddadmin = sAddadmin == null ? null : sAddadmin.trim();
    }

    public Date getsUpdatetime() {
        return sUpdatetime;
    }

    public void setsUpdatetime(Date sUpdatetime) {
        this.sUpdatetime = sUpdatetime;
    }

    public String getsUpdateadmin() {
        return sUpdateadmin;
    }

    public void setsUpdateadmin(String sUpdateadmin) {
        this.sUpdateadmin = sUpdateadmin == null ? null : sUpdateadmin.trim();
    }

    public String getsPoints() {
        return sPoints;
    }

    public void setsPoints(String sPoints) {
        this.sPoints = sPoints == null ? null : sPoints.trim();
    }
}