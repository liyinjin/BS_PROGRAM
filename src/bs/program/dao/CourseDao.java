package bs.program.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/6.
 */
@Component
public interface CourseDao {

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
    public Integer insertCourse(@Param("id")String id,@Param("name")String name,@Param("allScores")Double allScores);

    /**
     * 修改课程
     * @param id
     * @param name
     * @param allScores
     * @return
     */
    public Integer updateCourse(@Param("id")String id,@Param("name")String name,@Param("allScores")Double allScores);

    /**
     * s删除课程
     * @param id
     * @return
     */
    public Integer deleteCourse(@Param("id")String id);
}
