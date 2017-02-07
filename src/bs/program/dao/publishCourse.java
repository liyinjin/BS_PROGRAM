package bs.program.dao;

import java.util.List;
import java.util.Map;

/**
 * Created by liyingjin on 2017/2/7.
 */
public interface publishCourse {

    /**
     * 查询已有的课程
     * @return
     */
    public List<Map<String,Object>> selectOldCourse();

    /**
     * 查询已有的班级教室
     * @return
     */
    public List<Map<String,Object>> selectOldClasses();

    /**
     * 查询已有教师
     * @return
     */
    public List<Map<String,Object>> selectOldTeacher();
}
