package com.map.pojo;

import java.util.Date;

public class EduResource {
    private String rId;

    private String rName;

    private String rAddress;

    private String rType;

    private String rScore;

    private String rDescription;

    private Integer rScaleparam;

    private String rMiddlepoint;

    private String rUrl;

    private String rPhone;

    private Date rAddtime;

    private String rAddadmin;

    private Date rUpdatetime;

    private String rUpdateadmin;

    private String rPoints;
    
    private SchoolAreaResourceMapping schoolAreaResourceMapping;
    
    public String getSchoolAreaId() {
		return schoolAreaResourceMapping.getSaId();
	}

    public SchoolAreaResourceMapping getSchoolAreaResourceMapping() {
		return schoolAreaResourceMapping;
	}

	public void setSchoolAreaResourceMapping(
			SchoolAreaResourceMapping schoolAreaResourceMapping) {
		this.schoolAreaResourceMapping = schoolAreaResourceMapping;
	}

	public String getrId() {
        return rId;
    }

    public void setrId(String rId) {
        this.rId = rId == null ? null : rId.trim();
    }

    public String getrName() {
        return rName;
    }

    public void setrName(String rName) {
        this.rName = rName == null ? null : rName.trim();
    }

    public String getrAddress() {
        return rAddress;
    }

    public void setrAddress(String rAddress) {
        this.rAddress = rAddress == null ? null : rAddress.trim();
    }

    public String getrType() {
        return rType;
    }

    public void setrType(String rType) {
        this.rType = rType == null ? null : rType.trim();
    }

    public String getrScore() {
        return rScore;
    }

    public void setrScore(String rScore) {
        this.rScore = rScore == null ? null : rScore.trim();
    }

    public String getrDescription() {
        return rDescription;
    }

    public void setrDescription(String rDescription) {
        this.rDescription = rDescription == null ? null : rDescription.trim();
    }

    public Integer getrScaleparam() {
        return rScaleparam;
    }

    public void setrScaleparam(Integer rScaleparam) {
        this.rScaleparam = rScaleparam;
    }

    public String getrMiddlepoint() {
        return rMiddlepoint;
    }

    public void setrMiddlepoint(String rMiddlepoint) {
        this.rMiddlepoint = rMiddlepoint == null ? null : rMiddlepoint.trim();
    }

    public String getrUrl() {
        return rUrl;
    }

    public void setrUrl(String rUrl) {
        this.rUrl = rUrl == null ? null : rUrl.trim();
    }

    public String getrPhone() {
        return rPhone;
    }

    public void setrPhone(String rPhone) {
        this.rPhone = rPhone == null ? null : rPhone.trim();
    }

    public Date getrAddtime() {
        return rAddtime;
    }

    public void setrAddtime(Date rAddtime) {
        this.rAddtime = rAddtime;
    }

    public String getrAddadmin() {
        return rAddadmin;
    }

    public void setrAddadmin(String rAddadmin) {
        this.rAddadmin = rAddadmin == null ? null : rAddadmin.trim();
    }

    public Date getrUpdatetime() {
        return rUpdatetime;
    }

    public void setrUpdatetime(Date rUpdatetime) {
        this.rUpdatetime = rUpdatetime;
    }

    public String getrUpdateadmin() {
        return rUpdateadmin;
    }

    public void setrUpdateadmin(String rUpdateadmin) {
        this.rUpdateadmin = rUpdateadmin == null ? null : rUpdateadmin.trim();
    }

    public String getrPoints() {
        return rPoints;
    }

    public void setrPoints(String rPoints) {
        this.rPoints = rPoints == null ? null : rPoints.trim();
    }
}