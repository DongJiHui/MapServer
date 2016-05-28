package com.map.pojo;

import java.util.Date;

public class SchoolArea {
    private String saId;

    private String saName;

    private String saDescription;

    private String saPoints;

    private String saMiddlepoint;

    private Integer saScaleparam;

    private Date saAddtime;

    private String saAddadmin;

    private Date saUpdatetime;

    private String saUpdateadmin;
    
    private DistrictSchoolAreaMapping districtSchoolAreaMapping;

    public String getSaId() {
        return saId;
    }

    public String getDistrictId() {
		return districtSchoolAreaMapping.getdId();
	}

	
	public void setSaId(String saId) {
        this.saId = saId == null ? null : saId.trim();
    }

    public DistrictSchoolAreaMapping getDistrictSchoolAreaMapping() {
		return districtSchoolAreaMapping;
	}

	public void setDistrictSchoolAreaMapping(
			DistrictSchoolAreaMapping districtSchoolAreaMapping) {
		this.districtSchoolAreaMapping = districtSchoolAreaMapping;
	}

	public String getSaName() {
        return saName;
    }

    public void setSaName(String saName) {
        this.saName = saName == null ? null : saName.trim();
    }

    public String getSaDescription() {
        return saDescription;
    }

    public void setSaDescription(String saDescription) {
        this.saDescription = saDescription == null ? null : saDescription.trim();
    }

    public String getSaPoints() {
        return saPoints;
    }

    public void setSaPoints(String saPoints) {
        this.saPoints = saPoints == null ? null : saPoints.trim();
    }

    public String getSaMiddlepoint() {
        return saMiddlepoint;
    }

    public void setSaMiddlepoint(String saMiddlepoint) {
        this.saMiddlepoint = saMiddlepoint == null ? null : saMiddlepoint.trim();
    }

    public Integer getSaScaleparam() {
        return saScaleparam;
    }

    public void setSaScaleparam(Integer saScaleparam) {
        this.saScaleparam = saScaleparam;
    }

    public Date getSaAddtime() {
        return saAddtime;
    }

    public void setSaAddtime(Date saAddtime) {
        this.saAddtime = saAddtime;
    }

    public String getSaAddadmin() {
        return saAddadmin;
    }

    public void setSaAddadmin(String saAddadmin) {
        this.saAddadmin = saAddadmin == null ? null : saAddadmin.trim();
    }

    public Date getSaUpdatetime() {
        return saUpdatetime;
    }

    public void setSaUpdatetime(Date saUpdatetime) {
        this.saUpdatetime = saUpdatetime;
    }

    public String getSaUpdateadmin() {
        return saUpdateadmin;
    }

    public void setSaUpdateadmin(String saUpdateadmin) {
        this.saUpdateadmin = saUpdateadmin == null ? null : saUpdateadmin.trim();
    }
}