package com.chinasofti.service;

import java.util.List;
import java.util.Map;

import com.chinasofti.model.Line;
import com.chinasofti.model.LineType;


public interface LineService {
	
  void insert(Line line);

  List<Line> selectLinesByPagesMap(Map map);
  
  List<Line> selectLinesMap(Map map);
  
  Line selectByPrimaryKey(String lineid);
  //根据id修改名称
  void updateByPrimaryKeySelective(Line line);

  int Linecount();
  //根据id更新信息
  void updateByPrimaryKey(Line line);
  //根据linetypeid查询相应对象
  List<Line> selectLinesByLinetypeid(String linetypeid);

  Line selectLinesByid(String lineid);

  Line selectLinesByidpicture(String linid);
  //查询全部
  List<Line> selectLine();
  //订单所用	
  Line selectLinebydd(String lineid);
  //订单结算所用
  List<Line> selectLinesByidlist(String lineid);

 }
