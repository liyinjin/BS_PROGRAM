package bs.program.service;

import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/6.
 */
public interface CourseService {

    /**
     * 查询所有课程
     * @return
     */
    public List<Map<String,Object>> selectAllCourse();

    /**
     * 添加课程
     * @param id
     * @param name
     * @param allScores
     * @return
     */
    public Integer insertCourse(String id,String name,Double allScores);

    /**
     * 修改课程
     * @param id
     * @param name
     * @param allScores
     * @return
     */
    public Integer updateCourse(String id,String name,Double allScores);

    /**
     * 删除课程
     * @param id
     * @return
     */
    public Integer delCourse(String id);

    /**
     * 学生选课
     * @param userId
     * @param courseId
     * @return
     */
    public Integer insertStudentCourse(String userId,String courseId);

    /**
     * 查询学生已选课程
     * @param userId
     * @return
     */
    public List<Map<String,Object>> checkAlreadyStudentCourse(String userId);

    /**
     * 删除已学生已选课程
     * @param courseId
     * @param userId
     * @return
     */
    public Integer deleteStudentCourse(String courseId,String userId);

    /**
     * 查询学分
     * @param userId
     * @return
     */
    public List<Map<String,Object>> queryScores(String userId);
}
