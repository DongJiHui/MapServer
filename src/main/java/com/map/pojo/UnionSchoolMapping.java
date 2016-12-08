package com.map.pojo;

public class UnionSchoolMapping {
    private String unId;

    private String sId;

    private Integer priority;

    public String getUnId() {
        return unId;
    }

    public void setUnId(String unId) {
        this.unId = unId == null ? null : unId.trim();
    }

    public String getsId() {
        return sId;
    }

    public void setsId(String sId) {
        this.sId = sId == null ? null : sId.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }
}