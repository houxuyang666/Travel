package com.chinasofti.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.model.Car;
import com.chinasofti.model.Line;
import com.chinasofti.service.CarService;
import com.chinasofti.service.LineService;

@Controller
public class CarController {
	@Autowired
	private  CarService carService;
	@Autowired
	private  LineService lineService;

	
	@RequestMapping("/GoCar")
	public ModelAndView GoCar(@RequestParam("lineid") String lineid,HttpServletRequest request,HttpSession session) {
		int customerid =(int) session.getAttribute("customerid");
		if(lineid!=null) {
			Car car =new Car();
			car.setCustomerid(customerid);
			car.setLinid(lineid);
			car.setTime(new Date());
			carService.insertCart(car);
		}
		
		List<Car> carlist= new ArrayList<>();
		carlist=carService.selectCartByCustId(customerid);
		List<Line> linelist =new ArrayList<>();
		BigDecimal price =new BigDecimal(0);
		for (Car car2 : carlist) {
			Line line =lineService.selectLinesByidpicture(car2.getLinid());
			System.out.println(line.toString());
			if(line.getTeambuyprice()!=null) {
				price=price.add(line.getTeambuyprice());
			}else {
				price=price.add(line.getPrice());
			}
			linelist.add(line);
		}
		ModelAndView mav =new ModelAndView("cart");
		mav.addObject("carlist", carlist);
		mav.addObject("linelist", linelist);
		mav.addObject("price",price);
		return mav;
	}
	
	@RequestMapping("/GoCar1")
	public ModelAndView GoCar1(HttpSession session) {
		int customerid =(int) session.getAttribute("customerid");
		List<Car> carlist= new ArrayList<>();
		carlist=carService.selectCartByCustId(customerid);
		List<Line> linelist =new ArrayList<>();
		BigDecimal price =new BigDecimal(0);
		for (Car car2 : carlist) {
			Line line =lineService.selectLinesByidpicture(car2.getLinid());
			System.out.println(line.toString());
				if(line.getTeambuyprice()!=null) {
					price=price.add(line.getTeambuyprice());
				}else {
					price=price.add(line.getPrice());
				}
			linelist.add(line);
		}
		ModelAndView mav =new ModelAndView("cart");
		mav.addObject("carlist", carlist);
		mav.addObject("linelist", linelist);
		mav.addObject("price",price);
		return mav;
	}
	
	
	@RequestMapping("/delete")
	public ModelAndView delete(@RequestParam("carid") int carid,HttpServletRequest request,HttpSession session) {
		System.out.println(carid);
		carService.deleteByPrimaryKey(carid);
		int customerid =(int) session.getAttribute("customerid");
		List<Car> carlist= new ArrayList<>();
		carlist=carService.selectCartByCustId(customerid);
		List<Line> linelist =new ArrayList<>();
		BigDecimal price =new BigDecimal(0);
		for (Car car2 : carlist) {
			Line line =lineService.selectLinesByidpicture(car2.getLinid());
			System.out.println(line.toString());
				if(line.getTeambuyprice()!=null) {
					price=price.add(line.getTeambuyprice());
				}else {
					price=price.add(line.getPrice());
				}
			linelist.add(line);
		}
		ModelAndView mav =new ModelAndView("cart");
		mav.addObject("carlist", carlist);
		mav.addObject("linelist", linelist);
		mav.addObject("price",price);
		return mav;
	}
}
