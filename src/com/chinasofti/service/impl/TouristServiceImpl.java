package com.chinasofti.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.TouristMapper;
import com.chinasofti.model.Tourist;
import com.chinasofti.service.TouristService;
@Service
public class TouristServiceImpl implements TouristService {
	@Autowired
	private TouristMapper touristMapper;

	@Override
	public void insert(Tourist tourist) {
		touristMapper.insert(tourist);
	}

	@Override
	public Tourist selectByKey(String uuid) {
		return touristMapper.selectByKey(uuid);
	}

}
