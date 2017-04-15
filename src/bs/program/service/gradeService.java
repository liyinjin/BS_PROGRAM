package bs.program.service;

import bs.program.bean.User;

/**
 * Created by liyingjin on 2017/3/23.
 */
public interface gradeService {
    public Integer insertStudentGrade(String studentName,String courseName,Integer grade);
    public User selectSubject(String id);
}
