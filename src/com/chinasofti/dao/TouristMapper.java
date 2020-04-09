package com.chinasofti.dao;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.Tourist;
@Repository
public interface TouristMapper {
    int deleteByPrimaryKey(String touristid);

    int insert(Tourist record);

    int insertSelective(Tourist record);

    Tourist selectByPrimaryKey(String touristid);

    int updateByPrimaryKeySelective(Tourist record);

    int updateByPrimaryKey(Tourist record);

	Tourist selectByKey(String uuid);
}