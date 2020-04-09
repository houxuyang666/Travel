package com.chinasofti.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chinasofti.dao.PictureMapper;
import com.chinasofti.model.Picture;
import com.chinasofti.service.PictureService;
@Service
public class PictureServiceImpl implements PictureService {
	@Autowired
	private PictureMapper picturemapper;

	@Override
	public void insert(Picture picture) {
		picturemapper.insert(picture);
		
	}

	@Override
	public List<Picture> selectPictureBylineid(String lineid) {
		return picturemapper.selectPictureBylineid(lineid);
	}
}
