package bs.program.service;

import bs.program.bean.User;
import bs.program.dao.gradeDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by liyingjin on 2017/3/23.
 */
@Service
public class gradeServiceImpl implements gradeService {

    @Resource
    public gradeDao gradeDao;

    @Override
    public Integer insertStudentGrade(String studentName, String courseName, Integer grade) {
        return gradeDao.insertStudentGrade(studentName,courseName,grade);
    }

    @Override
    public User selectSubject(String id) {
        return gradeDao.selectSubject(id);
    }
}
