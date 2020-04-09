package com.chinasofti.service;

import java.util.List;

import com.chinasofti.model.Car;

public interface CarService {

	List<Car> selectCartByCustId(Integer customerid);

	void insertCart(Car car);

	void deleteByPrimaryKey(int carid);

	List<Car> selectCartByLine(int customerid);

	void deleteBycustomerid(int customerid);
	
}
