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
}
