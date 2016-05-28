package com.map.pojo;

public class DistrictSchoolAreaMappingKey {
    private String dId;

    private String saId;

    public String getdId() {
        return dId;
    }

    public void setdId(String dId) {
        this.dId = dId == null ? null : dId.trim();
    }

    public String getSaId() {
        return saId;
    }

    public void setSaId(String saId) {
        this.saId = saId == null ? null : saId.trim();
    }
}