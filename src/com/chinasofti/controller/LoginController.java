package com.chinasofti.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.model.Customer;
import com.chinasofti.model.Line;
import com.chinasofti.model.LineType;
import com.chinasofti.service.CustomerService;
import com.chinasofti.service.LineService;
import com.chinasofti.service.LineTypeService;
import com.google.code.kaptcha.Constants;
@Controller 
public class LoginController {
	
	@Autowired //自动注入 不需要set get
	CustomerService customerService;
	@Autowired
	LineTypeService linetypeService;
	@Autowired
	LineService lineService;
	
	
	
	@RequestMapping("/Admin")
	public ModelAndView Admin() {
		ModelAndView mav = new ModelAndView("AdminRegister");
		mav.addObject("customer", new Customer());
		return mav;
	}
	@RequestMapping("/AdminRegister")
	public ModelAndView Register(@Valid @ModelAttribute("customer") Customer customer,BindingResult bindingResult,@RequestParam("code")String code,HttpSession session) {
		if (bindingResult.hasErrors()) {
			ModelAndView mav = new ModelAndView("AdminRegister");
			return mav;
		}else {
			String vcode =(String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if(code.equals(vcode)){
				customerService.insert(customer);
				ModelAndView mav = new ModelAndView("LoginRegister");
				mav.addObject("customer", customer);
				return mav;
			}else {
				ModelAndView mav = new ModelAndView("AdminRegister");
				mav.addObject("msg", "验证码不正确");
				return mav;
			}
		}
	}
	
	@RequestMapping("/Login")
	public ModelAndView Login() {
		ModelAndView mav = new ModelAndView("LoginRegister");
		mav.addObject("customer", new Customer());
		return mav;
	}
	
	
	@RequestMapping("/LoginRegister")
	public ModelAndView Login(@ModelAttribute("customer") Customer customer,@RequestParam("codelogin")String codelogin,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
			int count = 2650;
			String vcodelogin =(String) session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
			if(codelogin.equals(vcodelogin)){
			Customer c=	customerService.select(customer);
				if(c!=null) {
					if(c.getType()==null||c.getType()==0) {
						count+=1;
						session.setAttribute("customerid", c.getCustomerid());
						session.setAttribute("customername", c.getName());
						session.setAttribute("count", count);
						request.getRequestDispatcher("index.action").forward(request, response);
						return null;
					}else {
						ModelAndView mav = new ModelAndView("main");
						System.out.println(c.getName());
						mav.addObject("customer", c);
						return mav;
					}
				}else {
					ModelAndView mav = new ModelAndView("LoginRegister");
					mav.addObject("msg", "账号或者密码有误，请重新输入");
					return mav;
				}
			}else {
				ModelAndView mav = new ModelAndView("LoginRegister");
				mav.addObject("msg", "验证码不正确");
				return mav;
			}
		}
	
	@RequestMapping("/index")
	public ModelAndView index() {
		List<LineType> jingneilinetype=linetypeService.selectByTypeName("境内游"); 
		List<LineType> jingwailinetype=linetypeService.selectByTypeName("境外游"); 
		List<LineType> remenlinetype=linetypeService.selectByTypeName("热门游"); 
		List<Line> linelist =lineService.selectLine();
		for (Line line : linelist) {
			System.out.println(line.toString());
		}
		ModelAndView mav = new ModelAndView("index");
		mav.addObject("jingneilinetype", jingneilinetype);
		mav.addObject("jingwailinetype", jingwailinetype);
		mav.addObject("remenlinetype", remenlinetype);
		mav.addObject("linelist", linelist);
		return mav;
	}
	
}
