package com.chinasofti.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.model.Car;
import com.chinasofti.model.Line;
import com.chinasofti.model.LineType;
import com.chinasofti.model.OrderDetail;
import com.chinasofti.model.Picture;
import com.chinasofti.model.Tourist;
import com.chinasofti.service.CarService;
import com.chinasofti.service.LineService;
import com.chinasofti.service.LineTypeService;
import com.chinasofti.service.OrderDetailService;
import com.chinasofti.service.PictureService;

@Controller
public class OrderController {
	@Autowired
	private LineService lineService; //线路
	@Autowired
	private LineTypeService linetypeService; //线路类型
	@Autowired
	private PictureService pictureService;//图片
	@Autowired
	private CarService carService;
	@Autowired
	private OrderDetailService orderDetailService;
	
	
	@RequestMapping("/dingdan")
	public ModelAndView dingdan(@RequestParam("lineid")String lineid) {
		Line line =lineService.selectLinesByid(lineid);
		System.out.println(lineid);
		LineType linetype=linetypeService.selectLineTypesBylineid(line.getLinetypeid());
		List<Picture> picturelist =pictureService.selectPictureBylineid(lineid); 
		System.out.println(line.toString());
		System.out.println(linetype.toString());
		for (Picture picture : picturelist) {
			System.out.println(picture.toString());
		}
		ModelAndView mav =new ModelAndView("detail");
		mav.addObject("line", line);
		mav.addObject("linetype", linetype);
		mav.addObject("picturelist", picturelist);
		return mav;
	}

	@RequestMapping("/order")
	public ModelAndView order(@RequestParam("lineid")String lineid) {
		System.out.println(lineid);
		List<Line> linelist =lineService.selectLinesByidlist(lineid);
		ModelAndView mav =new ModelAndView("order");
		mav.addObject("linelist", linelist);
		mav.addObject("tourist", new Tourist());
		return mav;
	}
	
	@RequestMapping("/orderall")
	public ModelAndView orderall(@RequestParam("customerid")int customerid) {
		System.out.println(customerid);
		List<Car> Carlist=carService.selectCartByLine(customerid);
		for (Car car : Carlist) {
			System.out.println(car.toString());
		}
		ModelAndView mav =new ModelAndView("order");
		mav.addObject("Carlist", Carlist);
		mav.addObject("tourist", new Tourist());
		return mav;
	}
	//历史订单
	@RequestMapping("/History")
	public ModelAndView History(@RequestParam("customerid")int customerid) {
		System.out.println(customerid);
		List<OrderDetail> orderlist =orderDetailService.selectByCustomerid(customerid);
		ModelAndView mav =new ModelAndView("history");
		mav.addObject("orderlist", orderlist);
		return mav;
	}
}
