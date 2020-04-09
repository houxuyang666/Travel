package com.chinasofti.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.CarMapper;
import com.chinasofti.model.Car;
import com.chinasofti.service.CarService;
@Service
public class CarServiceImpl implements CarService {

	@Autowired
	private CarMapper carMapper;
	
	@Override
	public List<Car> selectCartByCustId(Integer customerid) {
		return carMapper.selectCartByCustId(customerid);
	}

	@Override
	public void insertCart(Car car) {
		carMapper.insert(car);
	}

	@Override
	public void deleteByPrimaryKey(int carid) {
		carMapper.deleteByPrimaryKey(carid);
		
	}

	@Override
	public List<Car> selectCartByLine(int customerid) {
		return carMapper.selectCartByLine(customerid);
	}

	@Override
	public void deleteBycustomerid(int customerid) {
		carMapper.deleteBycustomerid(customerid);
		
	}

}
