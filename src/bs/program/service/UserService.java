package bs.program.service;

import bs.program.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


public interface UserService {
	/**
	 * 鏌ヨ鐢ㄦ埛
	 * @return
	 */
    public List<Map<String, Object>> findallUser();
    
    /**
     * 鐧诲綍
     * @return
     */
    public User login(String id,String password,String roleId);
    
    /**
     * 鎸夎鑹叉煡鎵剧敤鎴�     * @param roleId
     * @return
     */
    public List<Map<String, Object>> findUserByRoleId(@Param("roleId") String roleId);
    
    /**
     * 添加用户
     * @param userId
     * @param userName
     * @param password
     * @param createby
     * @param ufID
     * @param roleId
     * @return
     */
    public Integer insertUser(String userId,String userName,String password,String createby,String ufID,String roleId);

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    public Integer updateUser(String id,String password);
    
    /**
     * 删除用户
     * @param id
     * @return
     */
    public Integer delUser(String id);

    /**
     * 查询个人信息
     * @param id
     * @return
     */
    public List<Map<String,Object>> findUserById(String id);

    /**
     * 修改个人密码（用户）
     * @param id
     * @param password
     * @return
     */
    public Integer userUpdatePwd(String id,String password);

    /**
     * 查询学生任课教师
     * @param userId
     * @return
     */
    public List<Map<String,Object>> selectTeacherSubject(String userId);

    /**
     *查询教师自己课程选课学生
     * @param userId
     * @return
     */
    public List<Map<String,Object>> selectTeacherStudent(String userId);
}
