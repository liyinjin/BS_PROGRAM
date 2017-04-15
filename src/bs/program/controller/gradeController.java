package bs.program.controller;

import bs.program.bean.User;
import bs.program.service.UserService;
import bs.program.service.gradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by liyingjin on 2017/3/23.
 */
@Controller
@RequestMapping(value = "/grade")
public class gradeController {

    @Autowired
    public gradeService gradeService;
    @Autowired
    public UserService userService;
    @ResponseBody
    @RequestMapping(value = "/insertStudentGrade")
    public Map<String,Object> insertStudentGrade(String studentName, HttpServletRequest request, Integer grade){
        Map<String,Object> map=new HashMap<>();
        User user=(User)request.getSession().getAttribute("user");
        User us=gradeService.selectSubject(user.getId());
        Integer i=gradeService.insertStudentGrade(studentName,us.getSubject(),grade);
        map.put("i",i);
        return map;
    }
}
