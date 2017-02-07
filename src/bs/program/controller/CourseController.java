package bs.program.controller;

import bs.program.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by liyingjin on 2017/2/6.
 */
@Controller
@RequestMapping(value="/course")
public class CourseController {

    @Autowired
    public CourseService courseService;

    @ResponseBody
    @RequestMapping(value = "/selectAll")
    public List<Map<String,Object>> selectAll(){
        Map<String,Object> map=new HashMap<String,Object>();
        List<Map<String,Object>> lmap=courseService.selectAllCourse();
        return lmap;
    }

    @ResponseBody
    @RequestMapping(value = "/insertCourse")
    public Map<String,Object> insertCourse(String id,String name,Double allScores){
        Map<String,Object> map=new HashMap<String,Object>();
        Integer i=courseService.insertCourse(id,name,allScores);
        map.put("i",i);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/updateCourse")
    public Map<String,Object> updateCourse(String id,String name,Double allScores){
        Map<String,Object> map=new HashMap<String,Object>();
        Integer i=courseService.updateCourse(id,name,allScores);
        map.put("i",i);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/delCourse")
    public Map<String,Object> delCourse(String id){
        Map<String,Object> map=new HashMap<String,Object>();
        Integer i=courseService.delCourse(id);
        map.put("i",i);
        return map;
    }
}
