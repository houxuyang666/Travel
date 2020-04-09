package com.chinasofti.service.impl;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.LineTypeMapper;

import com.chinasofti.model.LineType;
import com.chinasofti.model.Picture;
import com.chinasofti.service.LineTypeService;
@Service
public class LineTypeServiceImpl implements LineTypeService {
	@Autowired
	private LineTypeMapper lineTypeMapper;

	@Override
	public void insert(LineType lineType) {
		lineTypeMapper.insert(lineType);
		
	}

    @Override
	public List<LineType> selectLineTypeByPagesMap(Map map) {
		List<LineType> linetypelist =lineTypeMapper.selectLineTypeByPagesMap(map);
		return linetypelist;
	}

    @Override
	public List<LineType> select() {
		return lineTypeMapper.select();
	}

	@Override
	public int Linetypecount() {
		int typecount=lineTypeMapper.Linetypecount();
		return typecount;
	}

    @Override
	public LineType selectByID(String linetypeid) {
		return lineTypeMapper.selectByID(linetypeid);
	}

	@Override
	public void updateName(String linetypeid, String filename) {
		lineTypeMapper.updateName(linetypeid,filename);
	}

	@Override
	public void updateNameAndIcon(String linetypeid, String typename, String filename) {
		lineTypeMapper.updateNameAndIcon(linetypeid,typename,filename);
		
	}

	@Override
	public List<LineType> selectByTypeName(String string) {
		return lineTypeMapper.selectByTypeName(string);
	}

	@Override
	public LineType selectLineTypesBylineid(String linetypeid) {
		return lineTypeMapper.selectLineTypesBylineid(linetypeid);
	}


	@Override
	public List<Picture> selectPictureByLineID(String string) {
		return lineTypeMapper.selectPictureByLineID(string);
	}


	@Override
	public List<LineType> selectLineType() {
		
		return lineTypeMapper.selectLineType();
	}

}
