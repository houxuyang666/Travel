package com.chinasofti.service;

import java.util.List;

import com.chinasofti.model.Picture;

public interface PictureService {

	void insert(Picture picture);

	List<Picture> selectPictureBylineid(String lineid);

}
