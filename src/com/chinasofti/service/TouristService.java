package com.chinasofti.service;

import com.chinasofti.model.Tourist;

public interface TouristService {

	void insert(Tourist tourist);

	Tourist selectByKey(String uuid);

}
