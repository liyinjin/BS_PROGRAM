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
}
