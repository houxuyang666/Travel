package com.chinasofti.model;

public class Picture {//ÏßÂ·Í¼Æ¬±í
    private Integer pictyreid;//Í¼Æ¬±àºÅ

    private String introduction;//Í¼Æ¬½éÉÜ

    private String name;//Í¼Æ¬Ãû³Æ

    private String lineid;//ÏßÂ·±àºÅ

    public Integer getPictyreid() {
        return pictyreid;
    }

    public void setPictyreid(Integer pictyreid) {
        this.pictyreid = pictyreid;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction == null ? null : introduction.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLineid() {
        return lineid;
    }

    public void setLineid(String lineid) {
        this.lineid = lineid == null ? null : lineid.trim();
    }

	@Override
	public String toString() {
		return "Picture [pictyreid=" + pictyreid + ", introduction=" + introduction + ", name=" + name + ", lineid="
				+ lineid + "]";
	}
    
    
}