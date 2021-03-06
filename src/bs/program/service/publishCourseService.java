package bs.program.service;

import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/17.
 */
public interface publishCourseService {

    /**
     * 查询要发布的课程
     * @return
     */
    public List<Map<String,Object>> selectOldCourse();

    /**
     * 查询已有的班级教室
     * @return
     */
    public List<Map<String,Object>> selectOldClassesroom();

    /**
     * 给要发布的课程添加教室
     * @param id
     * @param classroomId
     * @return
     */
    public Integer insertCourseClassroom(String id,Integer classroomId);

    /**
     * 给要发布的课程添加教师
     * @param id
     * @param teacherId
     * @return
     */
    public Integer insertCourseTeacher(String id,String teacherId);

    /**
     * 查询已有教师
     * @return
     */
    public List<Map<String,Object>> selectOldTeacher();

    /**
     * 发布课程
     * @param id
     * @return
     */
    public Integer updateCourseState(String id);

    /**
     * 查看已发布的课程
     * @return
     */
    public List<Map<String,Object>> selectAlReadyPublishCourse();
}
