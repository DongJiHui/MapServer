package com.map.pojo;

public class SchoolAreaSchoolMappingKey {
    private String saId;

    private String sId;

    public String getSaId() {
        return saId;
    }

    public void setSaId(String saId) {
        this.saId = saId == null ? null : saId.trim();
    }

    public String getsId() {
        return sId;
    }

    public void setsId(String sId) {
        this.sId = sId == null ? null : sId.trim();
    }
}