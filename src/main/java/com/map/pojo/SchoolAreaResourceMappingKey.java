package com.map.pojo;

public class SchoolAreaResourceMappingKey {
    private String saId;

    private String rId;

    public String getSaId() {
        return saId;
    }

    public void setSaId(String saId) {
        this.saId = saId == null ? null : saId.trim();
    }

    public String getrId() {
        return rId;
    }

    public void setrId(String rId) {
        this.rId = rId == null ? null : rId.trim();
    }
}