package com.apcfss.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.apcfss.Model.Data;
import com.apcfss.services.DataService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/")
public class DataController {
	@Autowired
	DataService dataservice;
	
	@RequestMapping(value="report",method = RequestMethod.GET)
	ModelAndView  data(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("datadetails")Data m)
	{

		//System.out.println("entered");
		ModelAndView modelandview=new ModelAndView();
		 List<Data> listd=dataservice.getDepartment();
			modelandview.addObject("listd", listd);
		System.out.println("--sedhgsdb--check--");
		modelandview.setViewName("form");
		return  modelandview; 
	}
	

	@RequestMapping(value="hoa/{department:.+}",method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String hoa( Model m, HttpServletRequest request,  HttpServletResponse response,@ModelAttribute("datadetails")  Data emp,@PathVariable  String department)
	{

		System.out.println("department id is:"+department);
		  List<Data> listhoa = dataservice.getHoa(department);
		 System.out.println("list check fro hoa ---"+listhoa);
		 m.addAttribute("listhoa",listhoa);
		  Gson gson = new Gson(); 
		  String jsondata = gson.toJson(listhoa);
		return jsondata;
	}
	
	@RequestMapping(value="ddo/{hoa}",method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String ddo( Model m, HttpServletRequest request,  HttpServletResponse response,@ModelAttribute("datadetails")  Data emp,@PathVariable  String hoa)
	{

		System.out.println("hoa id is:"+hoa);
		  List<Data> listddo = dataservice.getDdo(hoa);
		 
		 System.out.println("list check for ddo---"+listddo);
		 m.addAttribute("listddo",listddo);
		  Gson gson = new Gson(); 
		  String jsondata = gson.toJson(listddo);
		return jsondata;
	}
	@RequestMapping(value="reportview/{dpt}",method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String view( Model m, HttpServletRequest request,  HttpServletResponse response,@ModelAttribute("datadetails")  Data emp,@PathVariable  String dpt)
	{
		System.out.println("helloooooooooooooooooooooooooooooooooooooooooooooooooooooooo"+dpt);
		 ModelAndView mav=new ModelAndView("form");
		 List<Data> list=dataservice.getVieweport(dpt);
					System.out.println("dsitrsict-----"+list.size());
		mav.addObject("list",list);
		mav.setViewName("form");
		 Gson gson = new Gson();
		 String jsonData = gson.toJson(list);
		return jsonData; 
	}

	@RequestMapping(value="all",method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String all( Model m, HttpServletRequest request,  HttpServletResponse response,@ModelAttribute("datadetails")  Data emp)
	{

		System.out.println("-=-=-se alll-=-=-=-");
		 ModelAndView mav=new ModelAndView("form");
		 List<Data> alllist=dataservice.getAll();
		System.out.println("dsitrsict-----"+alllist.size());
		mav.addObject("alllist",alllist);
		mav.setViewName("form");
		 Gson gson = new Gson();
		 String jsonData = gson.toJson(alllist);
		return jsonData; 
	}
	
	@RequestMapping(value="alltotalsum",method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String alltotalsum( Model m, HttpServletRequest request,  HttpServletResponse response,@ModelAttribute("datadetails")  Data emp)
	{
		System.out.println("-=-=-se alll total sum -=-=-=-");
		 ModelAndView mav=new ModelAndView("form");
		 List<Data> alltotalsumlist=dataservice.getalltotalsum();
		System.out.println("-=-=-=total sum size-----"+alltotalsumlist.size());
		mav.addObject("alltotalsumlist",alltotalsumlist);
		mav.setViewName("form");
		 Gson gson = new Gson();
		 String jsonData = gson.toJson(alltotalsumlist);
		return jsonData; 
	}
	@RequestMapping(value="ddoall",method = RequestMethod.GET, produces="application/json")
	public @ResponseBody String ddoall( Model m, HttpServletRequest request,  HttpServletResponse response,@ModelAttribute("datadetails")  Data emp)
	{

		  List<Data> listddoALL = dataservice.getDdoALL();
		  System.out.println("THE RETURNED LIST"+listddoALL);
		 
	
		 m.addAttribute("listddoALL",listddoALL);
		  Gson gson = new Gson(); 
		  String jsondata = gson.toJson(listddoALL);
		return jsondata;
	}
		  
}
