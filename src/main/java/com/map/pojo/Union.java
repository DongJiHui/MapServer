package com.map.pojo;

public class Union {
    private String unId;

    private String unName;

    private Integer unType;

    public String getUnId() {
        return unId;
    }

    public void setUnId(String unId) {
        this.unId = unId == null ? null : unId.trim();
    }

    public String getUnName() {
        return unName;
    }

    public void setUnName(String unName) {
        this.unName = unName == null ? null : unName.trim();
    }

    public Integer getUnType() {
        return unType;
    }

    public void setUnType(Integer unType) {
        this.unType = unType;
    }
}