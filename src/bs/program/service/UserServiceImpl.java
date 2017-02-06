package bs.program.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bs.program.bean.User;
import bs.program.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService{

    @Resource
    public UserDao userDao;

    @Override
    public List<Map<String, Object>> findallUser() {
    	
        return userDao.lists();
    }

	@Override
	public User login(String id,String password,String roleId) {
		// TODO Auto-generated method stub
		
		return userDao.map(id,password,roleId);
		
	}

	@Override
	public List<Map<String, Object>> findUserByRoleId(String roleId) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> flist=userDao.findUserByRoleId(roleId);
		return flist;
	}

	@Override
	public Integer insertUser(String userId,String userName,String password,String createby,String ufID,String roleId) {
		// TODO Auto-generated method stub
		Integer i=userDao.insertUser1(ufID, userId, roleId);
		return i;
	}

	@Override
	public Integer updateUser(String id, String password) {
		// TODO Auto-generated method stub
		Integer i=0;
		if(userDao.findUserById(id)!=null){
			i=userDao.updateUser(id, password);
			return i;
		}
		return i;
	}

	@Override
	public Integer delUser(String id) {
		// TODO Auto-generated method stub
		Integer i=0;
		Integer i1=0;
		Integer i2=0;
		Integer i3=0;
		if(userDao.selectRole(id).equals("2")){
			i1=userDao.delUserCourse(id);
			i2=userDao.delUserRole(id);
			i=userDao.delUser(id);
			if(i1==1&&i2==1&&i==1){
				return i3=1;
			}else{
				return i3;
			}
		}else if(userDao.selectRole(id).equals("3")){
			i1=userDao.delTeacherCourse(id);
			i2=userDao.delUserRole(id);
			i=userDao.delUser(id);
			if(i1==1&&i2==1&&i==1){
				return i3=1;
			}else{
				return i3;
			}
		}
		return i3;
	}
}
