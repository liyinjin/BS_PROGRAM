package bs.program.controller;

import bs.program.service.publishCourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/17.
 */
@Controller
@RequestMapping(value = "/publish")
public class publiseCourseController {
    @Autowired
    public publishCourseService publishCourseService;

    @ResponseBody
    @RequestMapping(value = "/showCourse")
    public List<Map<String,Object>> showCourse(){
        List<Map<String,Object>> list=publishCourseService.selectOldCourse();
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/showClassroom")
    public List<Map<String,Object>> showClassroom(){
        List<Map<String,Object>> list=publishCourseService.selectOldClassesroom();
        return list;
    }

    /**
     * 给要发布的课程添加教室
     * @param id
     * @param classroomId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insertCourseClassroom")
    public Map<String,Object> insertCourseClassroom(String id,Integer classroomId){
        Map<String,Object> map=new HashMap<String,Object>();
        Integer i=publishCourseService.insertCourseClassroom(id,classroomId);
        map.put("i",i);
        return map;
    }
}
