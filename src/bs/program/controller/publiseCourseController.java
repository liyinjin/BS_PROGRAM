package bs.program.controller;

import bs.program.dao.publishCourseDao;
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

    @Autowired
    public publishCourseDao publishcoursedao;

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


    @ResponseBody
    @RequestMapping(value = "/showTeacher")
    public List<Map<String,Object>> showTeacher(){
        List<Map<String,Object>> list=publishCourseService.selectOldTeacher();
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

    /**
     * 给要发布的课程添加教室
     * @param id
     * @param teacherId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insertCourseTeacher")
    public Map<String,Object> insertCourseTeacher(String id,String teacherId){
        Map<String,Object> map=new HashMap<String,Object>();
        Integer i=publishCourseService.insertCourseTeacher(id,teacherId);
        map.put("i",i);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "/publishCourseComplete")
    public Map<String,Object> publishCourseComplete(String id){
        Map<String,Object> smap=new HashMap<String,Object>();
        Map<String,Object> map=publishcoursedao.selectSingleCourse(id);
        Integer i;
        if (map.get("classroomId")!=null && map.get("teacherId")!=null){
            i=publishCourseService.updateCourseState(id);
            smap.put("i",i);
            return smap;
        }else{
            i=0;
            smap.put("i",i);
            return smap;
        }
    }

    @ResponseBody
    @RequestMapping(value = "/selectAlReadyPublishCourse")
    public List<Map<String,Object>> selectAlReadyPublishCourse(){
        List<Map<String,Object>> smap=publishCourseService.selectAlReadyPublishCourse();
        return smap;
    }
}
