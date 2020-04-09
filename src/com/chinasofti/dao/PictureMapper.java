package com.chinasofti.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.Picture;
@Repository
public interface PictureMapper {
    int deleteByPrimaryKey(Integer pictyreid);

    int insert(Picture record);

    int insertSelective(Picture record);

    Picture selectByPrimaryKey(Integer pictyreid);

    int updateByPrimaryKeySelective(Picture record);

    int updateByPrimaryKey(Picture record);

	List<Picture> selectPictureBylineid(String lineid);
}