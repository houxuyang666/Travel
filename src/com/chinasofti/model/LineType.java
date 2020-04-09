package com.chinasofti.model;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class LineType {//线路类型表
    private String linetypeid;//线路类型编号

    private String typename;//线路类型名称
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;//线路类型添加时间

    private String icon;//线路类型图标名
    
    private List<Line> linelist;

    public String getLinetypeid() {
        return linetypeid;
    }

    public void setLinetypeid(String linetypeid) {
        this.linetypeid = linetypeid == null ? null : linetypeid.trim();
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename == null ? null : typename.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

	public List<Line> getLinelist() {
		return linelist;
	}

	public void setLinelist(List<Line> linelist) {
		this.linelist = linelist;
	}

	@Override
	public String toString() {
		return "LineType [linetypeid=" + linetypeid + ", typename=" + typename + ", time=" + time + ", icon=" + icon
				+ ", linelist=" + linelist + "]";
	}

	
	
}