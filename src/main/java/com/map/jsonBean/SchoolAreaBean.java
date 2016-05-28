package com.map.jsonBean;

import com.map.pojo.SchoolArea;

public class SchoolAreaBean {
	private String saId;

    private String saName;

    private String saDescription;

    private String saPoints;

    private String saMiddlepoint;

    private Integer saScaleparam;

	public String getSaId() {
		return saId;
	}

	public void setSaId(String saId) {
		this.saId = saId;
	}

	public String getSaName() {
		return saName;
	}

	public void setSaName(String saName) {
		this.saName = saName;
	}

	public String getSaDescription() {
		return saDescription;
	}

	public void setSaDescription(String saDescription) {
		this.saDescription = saDescription;
	}

	public String getSaPoints() {
		return saPoints;
	}

	public void setSaPoints(String saPoints) {
		this.saPoints = saPoints;
	}

	public String getSaMiddlepoint() {
		return saMiddlepoint;
	}

	public void setSaMiddlepoint(String saMiddlepoint) {
		this.saMiddlepoint = saMiddlepoint;
	}

	public Integer getSaScaleparam() {
		return saScaleparam;
	}

	public void setSaScaleparam(Integer saScaleparam) {
		this.saScaleparam = saScaleparam;
	}

	public SchoolAreaBean(String saId, String saName, String saDescription,
			String saPoints, String saMiddlepoint, Integer saScaleparam) {
		super();
		this.saId = saId;
		this.saName = saName;
		this.saDescription = saDescription;
		this.saPoints = saPoints;
		this.saMiddlepoint = saMiddlepoint;
		this.saScaleparam = saScaleparam;
	}
	public SchoolAreaBean(SchoolArea schoolArea) {
		super();
		this.saId = schoolArea.getSaId();
		this.saName = schoolArea.getSaName();
		this.saDescription = schoolArea.getSaDescription();
		this.saPoints = schoolArea.getSaPoints();
		this.saMiddlepoint = schoolArea.getSaMiddlepoint();
		this.saScaleparam = schoolArea.getSaScaleparam();
	}
    
}
