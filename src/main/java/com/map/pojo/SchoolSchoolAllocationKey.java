package com.map.pojo;

public class SchoolSchoolAllocationKey {
    private String alMsId;

    private String alHsId;

    public String getAlMsId() {
        return alMsId;
    }

    public void setAlMsId(String alMsId) {
        this.alMsId = alMsId == null ? null : alMsId.trim();
    }

    public String getAlHsId() {
        return alHsId;
    }

    public void setAlHsId(String alHsId) {
        this.alHsId = alHsId == null ? null : alHsId.trim();
    }
}