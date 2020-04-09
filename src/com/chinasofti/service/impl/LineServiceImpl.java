package com.chinasofti.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.LineMapper;
import com.chinasofti.model.Line;
import com.chinasofti.service.LineService;
@Service
public class LineServiceImpl implements LineService {
	@Autowired
	private LineMapper lineMapper;

	@Override
	public List<Line> selectLinesByPagesMap(Map map) {
		List<Line> linelist =lineMapper.selectLinesByPagesMap(map);
		return linelist;
	}
	
	//查询团购
	@Override
	public List<Line> selectLinesMap(Map map) {
		return lineMapper.selectLinesMap(map);
	}
	
	@Override
	public void insert(Line line) {
		lineMapper.insert(line);
	}


	@Override
	public int Linecount() {
		int count=lineMapper.Linecount();
		return count;
	}

	@Override
	public Line selectByPrimaryKey(String lineid) {
		return lineMapper.selectByPrimaryKey(lineid);
	}
	//根据id修改名称
	@Override
	public void updateByPrimaryKeySelective(Line line) {
		lineMapper.updateByPrimaryKeySelective(line);
		
	}
	//根据id更新信息
	@Override
	public void updateByPrimaryKey(Line line) {
		lineMapper.updateByPrimaryKey(line);
		
	}
	//根据linetypeid查询相应对象
	@Override
	public List<Line> selectLinesByLinetypeid(String linetypeid) {
		return lineMapper.selectLinesByLinetypeid(linetypeid);
	}

	@Override
	public Line selectLinesByid(String lineid) {
		return lineMapper.selectLinesByid(lineid);
	}

	@Override
	public Line selectLinesByidpicture(String linid) {
		return lineMapper.selectLinesByidpicture(linid);
	}
	//查询全部
	@Override
	public List<Line> selectLine() {
		return lineMapper.selectLine();
	}
	//订单所用
	@Override
	public Line selectLinebydd(String lineid) {
		return lineMapper.selectLinebydd(lineid);
	}
	//订单结算所用
	@Override
	public List<Line> selectLinesByidlist(String lineid) {
		return lineMapper.selectLinesByidlist(lineid);
	}
}
