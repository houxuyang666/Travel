package com.chinasofti.dao;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.OT_Detail;
@Repository
public interface OT_DetailMapper {
    int deleteByPrimaryKey(Integer otid);

    int insert(OT_Detail record);

    int insertSelective(OT_Detail record);

    OT_Detail selectByPrimaryKey(Integer otid);

    int updateByPrimaryKeySelective(OT_Detail record);

    int updateByPrimaryKey(OT_Detail record);
}