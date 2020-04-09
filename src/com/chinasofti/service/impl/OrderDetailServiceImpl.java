package com.chinasofti.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.OrderDetailMapper;
import com.chinasofti.model.OrderDetail;
import com.chinasofti.service.OrderDetailService;
@Service
public class OrderDetailServiceImpl implements OrderDetailService {
	@Autowired
	private OrderDetailMapper orderDetailMapper;

	@Override
	public void insert(OrderDetail orderDetail) {
		orderDetailMapper.insert(orderDetail);
	}

	@Override
	public List<OrderDetail> selectByCustomerid(int customerid) {
		return orderDetailMapper.selectByCustomerid(customerid);
	}

}
