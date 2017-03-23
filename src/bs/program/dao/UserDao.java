package bs.program.dao;

import bs.program.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public interface UserDao {
	/**
	 * 鏌ヨ鎵�湁鐢ㄦ埛
	 * @return
	 */
    public List<Map<String, Object>> lists();

    public List<Map<String, Object>> findUserById(@Param("userId")String userId);
    /**
     * 根据ID查询用户
     * @param id
     * @return
     */
    public List<Map<String, Object>> findUserByIdddd(@Param("userId")String id);
    
    /**
     * 鍒ゆ柇鎵�湁鐢ㄦ埛鐨勮处鍙峰瘑鐮佹槸鍚︾浉绛�     * @return
     */
    public User map(@Param("id")String id,@Param("password") String password,@Param("roleId") String name);
    
    /**
     * 鎸夐渶姹傛煡璇㈣韩浠戒俊鎭�     * @param roleId
     * @return
     */
    public List<Map<String, Object>> findUserByRoleId(@Param("roleId") String roleId);
    
    /**
     * 添加用户
     * @param userId
     * @param userName
     * @param password
     * @param createby
     * @return
     */
    public Integer insertUser(@Param("userId")String userId,@Param("userName")String userName,@Param("password")String password,@Param("createby")String createby);

    /**
     * 添加用户子表
     * @param ufID
     * @param userId
     * @param roleId
     * @return
     */
    public Integer insertUser1(@Param("ufID")String ufID,@Param("userId")String userId,@Param("roleId")String roleId);
    
   /**
    * 修改密码 
    * @param id
    * @param password
    * @return
    */
    public Integer updateUser(@Param("id")String id,@Param("password")String password);
    
    /**
     * 删除用户
     * @param id
     * @return
     */
    public Integer delUser(@Param("id")String id);
    
    /**
     * 删除用户角色
     * @param id
     * @return
     */
    public Integer delUserRole(@Param("id")String id);
    
    /**
     * 删除学生课程
     * @param id
     * @return
     */
    public Integer delUserCourse(@Param("id")String id);
    
    /**
     * 删除教师课程
     * @param id
     * @return
     */
    public Integer delTeacherCourse(@Param("id")String id);
    
    /**
     * 根据查到的角色删除课程信息
     * @param id
     * @return
     */
    public String selectRole(@Param("id")String id);

    /**
     * 修改个人密码（用户）
     * @param id
     * @param password
     * @return
     */
    public Integer userUpdatePwd(@Param("id")String id,@Param("password")String password);

    /**
     * 查询学生任课教师
     * @param userId
     * @return
     */
    public List<Map<String,Object>> selectTeacherSubject(@Param("userId")String userId);

    /**
     *查询教师自己课程选课学生
     * @param userId
     * @return
     */
    public List<Map<String,Object>> selectTeacherStudent(@Param("userId")String userId);
}
