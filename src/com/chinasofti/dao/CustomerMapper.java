package com.chinasofti.dao;

import org.springframework.stereotype.Repository;

import com.chinasofti.model.Customer;
@Repository
public interface CustomerMapper {
   
	int deleteByPrimaryKey(Integer customerid);

    int insert(Customer record);

    int insertSelective(Customer record);

    Customer selectByPrimaryKey(Integer customerid);

    int updateByPrimaryKeySelective(Customer record);

    int updateByPrimaryKey(Customer record);

	Customer select(Customer cust);
}