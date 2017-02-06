package bs.program.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import bs.program.service.classesService;
@Controller
@RequestMapping(value="/classes")
public class classesController {
	@Autowired
	public classesService classessservice;
	
	@ResponseBody
	@RequestMapping(value="/findall")
	public List<Map<String, Object>> fiandall(){
		Map<String, Object> map=new HashMap<String,Object>();
		List<Map<String, Object>> lmap=classessservice.selectAll();
		return lmap;
	}
	
	@ResponseBody
	@RequestMapping(value="/insertClasses")
	public Map<String, Object> insertClasses(String id,String name){
		Map<String, Object> map=new HashMap<String,Object>();
		Integer i=classessservice.insertClassess(id,name);
		map.put("i", i);
		return map;
	}
}
