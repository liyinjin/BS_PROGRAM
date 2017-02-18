package bs.program.service;

import bs.program.dao.publishCourseDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/17.
 */
@Service
public class publishCourseServiceImpl implements publishCourseService {

    @Resource
    public publishCourseDao publishcoursedao;

    @Override
    public List<Map<String, Object>> selectOldCourse() {
        return publishcoursedao.selectOldCourse();
    }

    @Override
    public List<Map<String, Object>> selectOldClassesroom() {
        return publishcoursedao.selectOldClassesroom();
    }

    @Override
    public Integer insertCourseClassroom(String id, Integer classroomId) {
        return publishcoursedao.insertCourseClassroom(id,classroomId);
    }
}
