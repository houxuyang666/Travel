package com.chinasofti.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chinasofti.model.Line;
import com.chinasofti.model.LineType;
import com.chinasofti.model.Picture;
import com.chinasofti.service.LineService;
import com.chinasofti.service.LineTypeService;
import com.chinasofti.service.PictureService;

@Controller
public class LineController {

	@Autowired
	private LineService lineService;
	@Autowired
	private LineTypeService linetypeService;
	@Autowired
	private PictureService pictureService;
	
	public final static int pageSize=10;
	
	@RequestMapping("/Linelist")
	public ModelAndView Linelist(@RequestParam("pageIndex") int pageIndex) {
		if (pageIndex<=1){
			pageIndex=1;
		}
		int startRow = 0;
		startRow = pageSize*(pageIndex-1);
		int count=lineService.Linecount();
		int endRow;
		if(count%pageSize==0) {
			endRow = count/pageSize;
		}else {
			endRow = count/pageSize+1;
		}
		Map map =new HashMap<>();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		ModelAndView mav = new ModelAndView("linelist");
		List<Line> linelist =lineService.selectLinesByPagesMap(map);
		mav.addObject("linelist" ,linelist);
		mav.addObject("pageIndex",pageIndex);
		mav.addObject("endRow",endRow);
		return mav;
	}

	@RequestMapping("/Linetglist")
	public ModelAndView Linetglist(@RequestParam("pageIndex")  int pageIndex) {
		if (pageIndex<=1){
			pageIndex=1;
		}
		int startRow = 0;
		startRow = pageSize*(pageIndex-1); 
		int count=lineService.Linecount();
		int endRow;
		if(count%pageSize==0) {
			endRow = count/pageSize;
		}else {
			endRow = count/pageSize+1;
		}
		Map map =new HashMap<>();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		ModelAndView mav = new ModelAndView("linetglist");
		List<Line> linelist =lineService.selectLinesByPagesMap(map);
		mav.addObject("linelist" ,linelist);
		mav.addObject("pageIndex",pageIndex);
		mav.addObject("endRow",endRow);
		return mav;
	}
	@RequestMapping("/LinelistTG")
	public ModelAndView LinelistTG(@RequestParam("pageIndex") int pageIndex) {
		if (pageIndex<=1){
			pageIndex=1;
		}
		int startRow = 0;
		startRow = pageSize*(pageIndex-1); 
		int count=lineService.Linecount();
		int endRow;
		if(count%pageSize==0) {
			endRow = count/pageSize;
		}else {
			endRow = count/pageSize+1;
		}
		Map map =new HashMap<>();
		map.put("startRow", startRow);
		map.put("pageSize", pageSize);
		ModelAndView mav = new ModelAndView("linelistTG");
		List<Line> linelist =lineService.selectLinesMap(map);
		mav.addObject("linelist" ,linelist);
		mav.addObject("pageIndex",pageIndex);
		mav.addObject("endRow",endRow);
		return mav;
	}

	@RequestMapping("/Line")
	public ModelAndView Line() {
		List<LineType> listType =linetypeService.select();
		ModelAndView mav = new ModelAndView("insertline");
		mav.addObject("line", new Line());
		mav.addObject("LineType", listType);
		return mav;
	}
	
	@RequestMapping("/insertLine")
	public ModelAndView addLine(@ModelAttribute("line") Line line,@RequestParam("file")List<MultipartFile> file,@RequestParam("text")String text,HttpServletRequest request)  throws ParseException, IOException {
		String[] texts = text.split(",");
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		String uu=uuid.substring(0,12);
		System.out.println(uu);
		line.setLineid(uu);
		line.setOntime(new Date());
		lineService.insert(line);
		String path =request.getSession().getServletContext().getRealPath("/upload");
		File dir = new File(path);
		if (!dir.exists()&&!dir.isDirectory()) {
			dir.mkdir(); 
		}
		for (int j = 0; j < file.size(); j++) {
			String filename = file.get(j).getOriginalFilename();
			if (!filename.equals("")) {
				file.get(j).transferTo(new File(path+"/"+filename));
				Picture picture =new Picture();
				picture.setName(filename);
				picture.setLineid(uu);
				picture.setIntroduction(texts[j]);
				pictureService.insert(picture);
			
			}
		}
		Map map =new HashMap<>();
		map.put("startRow", 0);
		map.put("pageSize", pageSize);
		List<Line> linelist =lineService.selectLinesByPagesMap(map);
		ModelAndView mav = new ModelAndView("linelist");
		mav.addObject("linelist" ,linelist);
		return mav;
	}
	//准备修改线路
	@RequestMapping("/updateline1")
	public ModelAndView updateline1(@RequestParam("lineid")String lineid) {
		Line line= lineService.selectByPrimaryKey(lineid);
		LineType linetype =linetypeService.selectByID(line.getLinetypeid());
		ModelAndView mav = new ModelAndView("updateline");
		mav.addObject("line", line);
		mav.addObject("linetype", linetype);
		return mav;
	}
	//修改路线
	@RequestMapping("/updateline")
	public ModelAndView updateline(@ModelAttribute("line")Line line,@RequestParam("file")MultipartFile file,HttpServletRequest request) throws IllegalStateException, IOException {
		String path =request.getSession().getServletContext().getRealPath("/upload"); 
		if(!new File(path).exists()) {
		    new File(path).mkdirs();
		  }
		String filename =file.getOriginalFilename(); //将文件名称传给filename
		file.transferTo(new File(path+"/"+filename));//将文件上传到指定路径和名称
		lineService.updateByPrimaryKeySelective(line);
		System.out.println(line.getLineid());
		System.out.println(line.getLinename());
		System.out.println(filename);
		System.out.println(line.getLinetypeid());
		
		linetypeService.updateName(line.getLinetypeid(),filename);
		ModelAndView mav = new ModelAndView("linelist");
		Map map =new HashMap<>();
		map.put("startRow", 0);
		map.put("pageSize", pageSize);
		List<Line> linelist =lineService.selectLinesByPagesMap(map);
		mav.addObject("linelist" ,linelist);
		return mav;
	}
	
	//设置团购信息
	@RequestMapping("/SzTgline")
	public ModelAndView SzTgline(@RequestParam("lineid")String lineid) {
		Line line= lineService.selectByPrimaryKey(lineid);
		List<LineType> listType =linetypeService.select();
		ModelAndView mav = new ModelAndView("SZTgline");
		mav.addObject("line", line);
		mav.addObject("linetype", listType);
		return mav;
	}
	@RequestMapping("/SZTgLine")
	public ModelAndView SZTgLine(@ModelAttribute("line")Line line,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		line.setTeambuy(1);
		line.setOntime(new Date());
		lineService.updateByPrimaryKey(line);
		ModelAndView mav = new ModelAndView("Linetglist.action?pageIndex=1");
		request.getRequestDispatcher("Linetglist.action?pageIndex=1").forward(request, response);
		return mav;
	}

}
