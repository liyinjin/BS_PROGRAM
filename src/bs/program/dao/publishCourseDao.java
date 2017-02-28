package bs.program.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/8.
 */
@Component
public interface publishCourseDao {
    /**
     * 查询已有的课程
     * @return
     */
    public List<Map<String,Object>> selectOldCourse();

    /**
     * 查询已有的班级教室
     * @return
     */
    public List<Map<String,Object>> selectOldClassesroom();

    /**
     * 查询已有教师
     * @return
     */
    public List<Map<String,Object>> selectOldTeacher();

    /**
     * 给要发布的课程添加教室
     * @param id
     * @param classroomId
     * @return
     */
    public Integer insertCourseClassroom(@Param("id")String id,@Param("classroomId")Integer classroomId);

    /**
     * 给要发布的课程添加教师
     * @param id
     * @param teacherId
     * @return
     */
    public Integer insertCourseTeacher(@Param("id")String id,@Param("teacherId")String teacherId);

    /**
     * 发布课程
     * @param id
     * @return
     */
    public Integer updateCourseState(@Param("id")String id);

    /**
     * 查询该课程是否发布完毕
     * @param id
     * @return
     */
    public Map<String,Object> selectSingleCourse(@Param("id")String id);

    /**
     * 查看已发布的课程
     * @return
     */
    public List<Map<String,Object>> selectAlReadyPublishCourse();
}
