package com.chinasofti.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.Line;
@Repository
public interface LineMapper {
	
    int deleteByPrimaryKey(String lineid);

    int insert(Line record);

    int insertSelective(Line record);

    Line selectByPrimaryKey(String lineid);
    
    Line selectLinesByid(String lineid);

    int updateByPrimaryKeySelective(Line record);

    int updateByPrimaryKey(Line record);
    
    int Linecount();

	List<Line> selectLinesByPagesMap(Map map);

	void updateName(String lineid, String linename);

	List<Line> selectLinesMap(Map map);
	//根据linetypeid查询相应对象
	List<Line> selectLinesByLinetypeid(String linetypeid);
	//连接查询
	Line selectLinesByidpicture(String linid);
	//查询全部
	List<Line> selectLine();
	//订单所用
	Line selectLinebydd(String lineid);
	//订单详情所用
	List<Line> selectLinesByidlist(String lineid);

}