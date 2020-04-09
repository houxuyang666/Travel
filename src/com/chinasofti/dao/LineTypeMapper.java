package com.chinasofti.dao;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.Line;
import com.chinasofti.model.LineType;
import com.chinasofti.model.Picture;
@Repository
public interface LineTypeMapper {
    int deleteByPrimaryKey(String linetypeid);

    int insert(LineType record);

    int insertSelective(LineType record);

    LineType selectByPrimaryKey(String linetypeid);

    int updateByPrimaryKeySelective(LineType record);

    int updateByPrimaryKey(LineType record);
    
    List<LineType> selectLineTypeByPagesMap(Map map);

	//获取路线名称供添加路线使用
	List<LineType> select();
	//根据id查询
	LineType selectByID(String linetypeid);
	//根据id图片修改名称
	void updateName(String linetypeid, String filename);

	int Linetypecount();
	//根据id更新typeAndicon
	void updateNameAndIcon(String linetypeid, String typename, String filename);
	//根据名称查询id
	List<LineType> selectByTypeName(String string);
	
	List<Line> selectLineByLineTypeID(String string);
	
	List<Picture> selectPictureByLineID(String string);

	LineType selectLineTypesBylineid(String linetypeid);

	List<LineType> selectLineType();
}