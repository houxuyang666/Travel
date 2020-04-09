package com.chinasofti.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.chinasofti.model.Car;
@Repository
public interface CarMapper {
    int deleteByPrimaryKey(Integer carid);

    int insert(Car record);

    int insertSelective(Car record);

    Car selectByPrimaryKey(Integer carid);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

	List<Car> selectCartByCustId(Integer customerid);

	void removecart(int carid);
	
	Car selectcarByLineID(String lineid);

	List<Car> selectCartByLine(int customerid);

	void deleteBycustomerid(int customerid);

}