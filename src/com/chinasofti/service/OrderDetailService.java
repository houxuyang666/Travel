package com.chinasofti.service;

import java.util.List;

import com.chinasofti.model.OrderDetail;

public interface OrderDetailService {

	void insert(OrderDetail orderDetail);

	List<OrderDetail> selectByCustomerid(int customerid);

}
