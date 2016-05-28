package com.map.pojo;

public class SchoolSchoolConnectKey {
    private String sId1;

    private String sId2;

    public String getsId1() {
        return sId1;
    }

    public void setsId1(String sId1) {
        this.sId1 = sId1 == null ? null : sId1.trim();
    }

    public String getsId2() {
        return sId2;
    }

    public void setsId2(String sId2) {
        this.sId2 = sId2 == null ? null : sId2.trim();
    }
}