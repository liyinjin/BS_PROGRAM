package bs.program.controller;

import bs.program.bean.User;
import bs.program.dao.CourseDao;
import bs.program.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    @Autowired
    public CourseDao courseDao;

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

    /**
     * 学生选课
     * @param request
     * @param courseId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/insertStudentCourse")
    public Map<String,Object> insertStudentCourse(HttpServletRequest request, String courseId){
        Map<String,Object> map=new HashMap<String,Object>();
        User user= new User();
        user=(User) request.getSession().getAttribute("user");
        String userId=user.getId();
        Integer i=courseService.insertStudentCourse(userId,courseId);
        if(i==1){
            Integer person=courseDao.selectCourseSurplusPerson(courseId)-1;
            Integer ii=courseDao.updateCourseSurplusPerson(courseId,person);
            map.put("i",i);
            map.put("ii",ii);
            return map;
        }
        return map;
    }


    @ResponseBody
    @RequestMapping(value = "/checkAlreadyStudentCourse")
    public List<Map<String,Object>> checkAlreadyStudentCourse(HttpServletRequest request){
        User user= (User) request.getSession().getAttribute("user");
        List<Map<String,Object>> map =courseService.checkAlreadyStudentCourse(user.getId());
        return map;
    }

    /**
     * 删除已学生已选课程
     * @param courseId
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteStudentCourse")
    public Map<String,Object> deleteStudentCourse(String courseId,HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        User user= (User) request.getSession().getAttribute("user");
        Integer i=courseService.deleteStudentCourse(courseId,user.getId());
        map.put("i",i);
        return map;
    }

    @ResponseBody
    @RequestMapping(value ="/queryScores")
    public List<Map<String,Object>> queryScores(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<Map<String,Object>> list=courseService.queryScores(user.getId());
        return list;
    }
}
