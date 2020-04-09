package com.chinasofti.model;

public class OT_Detail {//订单游客信息表
    private Integer otid;//订单游客信息编号，主键自增长

    private String odid;//订单编号，外键

    private String touristid;//游客信息编号，外键

    public Integer getOtid() {
        return otid;
    }

    public void setOtid(Integer otid) {
        this.otid = otid;
    }

    public String getOdid() {
        return odid;
    }

    public void setOdid(String odid) {
        this.odid = odid == null ? null : odid.trim();
    }

    public String getTouristid() {
        return touristid;
    }

    public void setTouristid(String touristid) {
        this.touristid = touristid == null ? null : touristid.trim();
    }
}