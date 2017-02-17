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
     *
     * @param id
     * @param courseId
     * @param course_num
     * @return
     */
    public Integer insertClasses(@Param("id")String id,@Param("courseId")String courseId,@Param("course_num")String course_num);
}
