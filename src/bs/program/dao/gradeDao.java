package bs.program.dao;

import bs.program.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

/**
 * Created by liyingjin on 2017/3/23.
 */
@Component
public interface gradeDao {
    /**
     * 添加学生成绩
     * @param studentName
     * @param courseName
     * @param grade
     * @return
     */
    public Integer insertStudentGrade(@Param("studentName")String studentName,@Param("courseName")String courseName,@Param("grade")Integer grade);


    public User selectSubject(@Param("id")String id);
}
