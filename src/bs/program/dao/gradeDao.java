package bs.program.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by liyingjin on 2017/3/23.
 */
public interface gradeDao {
    /**
     * 添加学生成绩
     * @param studentName
     * @param courseName
     * @param grade
     * @return
     */
    public Integer insertStudentGrade(@Param("studentName")String studentName,@Param("courseName")String courseName,@Param("grade")Integer grade);
}
