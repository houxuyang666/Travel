package com.chinasofti.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.CustomerMapper;
import com.chinasofti.model.Customer;
import com.chinasofti.service.CustomerService;
@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public Customer insert(Customer cust) {
		customerMapper.insert(cust);
		return null;
	}

	@Override
	public Customer select(Customer cust) {
		return customerMapper.select(cust);
	}



}
