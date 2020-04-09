package com.chinasofti.model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;


public class Line {//线路表
    private String lineid;//线路编号

    private String linetypeid;//线路类型编号

    private String linename;//线路名称

    private String days;//出游天数

    private String vehicle;//出游交通工具

    private String introduction;//线路简介

    private String reason;//线路推荐理由

    private String arrange;//线路行程安排

    private BigDecimal price;//线路价格

    private Integer teambuy;//是否为团购线路，值为1时表示为团购线路

    private BigDecimal teambuyprice;//线路团购价格
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date begintime;//线路团购开始时间
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtime;//线路团购结束时间

    private Date ontime;//线路添加时间
    
    private LineType linetype;
    
    private List<Picture> picturelist;
    
    private List<Car> carlist;
    
    public String getLineid() {
        return lineid;
    }

	public void setLineid(String lineid) {
        this.lineid = lineid == null ? null : lineid.trim();
    }

    public String getLinetypeid() {
        return linetypeid;
    }

    public void setLinetypeid(String linetypeid) {
        this.linetypeid = linetypeid == null ? null : linetypeid.trim();
    }

    public String getLinename() {
        return linename;
    }

    public void setLinename(String linename) {
        this.linename = linename == null ? null : linename.trim();
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days == null ? null : days.trim();
    }

    public String getVehicle() {
        return vehicle;
    }

    public void setVehicle(String vehicle) {
        this.vehicle = vehicle == null ? null : vehicle.trim();
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason == null ? null : reason.trim();
    }

    public String getArrange() {
        return arrange;
    }

    public void setArrange(String arrange) {
        this.arrange = arrange == null ? null : arrange.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getTeambuy() {
        return teambuy;
    }

    public void setTeambuy(Integer teambuy) {
        this.teambuy = teambuy;
    }

    public BigDecimal getTeambuyprice() {
        return teambuyprice;
    }

    public void setTeambuyprice(BigDecimal teambuyprice) {
        this.teambuyprice = teambuyprice;
    }

	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public Date getOntime() {
        return ontime;
    }

    public void setOntime(Date ontime) {
        this.ontime = ontime;
    }

	public LineType getLinetype() {
		return linetype;
	}

	public void setLinetype(LineType linetype) {
		this.linetype = linetype;
	}

	public List<Picture> getPicturelist() {
		return picturelist;
	}

	public void setPicturelist(List<Picture> picturelist) {
		this.picturelist = picturelist;
	}

	public List<Car> getCarlist() {
		return carlist;
	}

	public void setCarlist(List<Car> carlist) {
		this.carlist = carlist;
	}

	@Override
	public String toString() {
		return "Line [lineid=" + lineid + ", linetypeid=" + linetypeid + ", linename=" + linename + ", days=" + days
				+ ", vehicle=" + vehicle + ", introduction=" + introduction + ", reason=" + reason + ", arrange="
				+ arrange + ", price=" + price + ", teambuy=" + teambuy + ", teambuyprice=" + teambuyprice
				+ ", begintime=" + begintime + ", endtime=" + endtime + ", ontime=" + ontime + ", linetype=" + linetype
				+ ", picturelist=" + picturelist + ", carlist=" + carlist + "]";
	}
	
	

}