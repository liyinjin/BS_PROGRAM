package bs.program.service;

import bs.program.dao.CourseDao;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/6.
 */
@Service
public class CourseServiceImpl implements CourseService{
    @Resource
    public CourseDao coursedao;
    @Override
    public List<Map<String, Object>> selectAllCourse() {
        return coursedao.selectAllCourse();
    }

    @Override
    public Integer insertCourse(String id, String name, Double allScores) {
        return coursedao.insertCourse(id,name,allScores);
    }

    @Override
    public Integer updateCourse(String id, String name, Double allScores) {
        return coursedao.updateCourse(id,name,allScores);
    }

    @Override
    public Integer delCourse(String id) {
        return coursedao.deleteCourse(id);
    }

    @Override
    public Integer insertStudentCourse(String userId, String courseId) {
        return coursedao.insertStudentCourse(userId,courseId);
    }

    @Override
    public List<Map<String,Object>> checkAlreadyStudentCourse(String userId) {
        return coursedao.checkAlreadyStudentCourse(userId);
    }

    @Override
    public Integer deleteStudentCourse(String courseId, String userId) {
        Integer in=coursedao.selectCourseSurplusPerson(courseId);
        Integer person=in+1;
        Integer inte=coursedao.updateCourseSurplusPerson(courseId,person);
        Integer i = null;
        if (inte==1){
            i=coursedao.deleteStudentCourse(courseId,userId);
            return i;
        }
        return i;
    }

    /**
     * 查询学分
     * @param userId
     * @return
     */
    @Override
    public List<Map<String, Object>> queryScores(String userId) {
        return coursedao.queryScores(userId);
    }
}
