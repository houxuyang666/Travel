package com.chinasofti.service;
import java.util.List;
import java.util.Map;

import com.chinasofti.model.LineType;
import com.chinasofti.model.Picture;

public interface LineTypeService {
	
    void insert(LineType lineType);

    List<LineType> selectLineTypeByPagesMap(Map map);
	
    int Linetypecount();

	LineType selectByID(String linetypeid);

	void updateName(String linetypeid, String filename);

	void updateNameAndIcon(String linetypeid, String typename, String filename);

	List<LineType> select();

	List<LineType> selectByTypeName(String string);

	LineType selectLineTypesBylineid(String linetypeid);


	List<Picture> selectPictureByLineID(String string);

	List<LineType> selectLineType();

}
