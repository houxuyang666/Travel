package com.chinasofti.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.OrderDetail;
@Repository
public interface OrderDetailMapper {
    int deleteByPrimaryKey(String odid);

    int insert(OrderDetail record);

    int insertSelective(OrderDetail record);

    OrderDetail selectByPrimaryKey(String odid);

    int updateByPrimaryKeySelective(OrderDetail record);

    int updateByPrimaryKey(OrderDetail record);

	List<OrderDetail> selectByCustomerid(int customerid);
}