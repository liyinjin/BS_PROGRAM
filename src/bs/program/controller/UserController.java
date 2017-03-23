package bs.program.controller;


import bs.program.bean.User;
import bs.program.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 濡傛灉RequestMapping鏀惧湪绫讳笂閭ｄ箞浠栬姹傜殑URL鍦板潃蹇呴』涓虹被鐨凴equestMapping鍔犱笂鏂规硶涓婄殑RequestMapping
 * 璇锋眰鐨勬柟寮忎篃蹇呴』鏄痯ost锛屽涓嬮潰绗竴涓柟娉� * 鏂规硶涓婄殑@RequestMapping鍙互鐢╲alue鍜宲arams涓や釜鏂规硶
 * params鏈変笁绫伙細涓�鏄痯aramsName(鍙傛暟)=paramsValue(鍊�濡備笅闈㈢浜屼釜鏂规硶,
 * 				 鎰忔�鏄姹傛柟娉曚负 GET 鎴�POST锛屼笖鍏锋湁 hello 鍙傛暟锛屼笖鍊间负 java 鐨勮姹傛墠鑳藉尮閰嶅埌璇ユ柟娉曪紝
 * 				 濡傦細/my?hello=java锛� * 				 绗簩绉嶆槸parameter锛岃姹傛柟娉曚负 GET锛屼笖鍏锋湁璇锋眰鍙傛暟 java 鍗冲尮閰嶆鏂规硶锛岃�涓嶇 java 鍙傛暟
 * 				 鐨勫�鏄粈涔堬紝濡俶y?java=anything
 * 				 绗笁绉嶆槸 headers锛屽畠鍜�params 闈炲父鐩镐技锛屼篃鏈変袱绉嶈〃杈惧紡锛屽彧涓嶈繃瀹冩槸瀵硅姹傚ご鍋氶檺鍒剁舰浜嗐�
 * 				 澶у鍙互閫氳繃 telnet 鎴�http-client 鏉ュ彂绫讳技鐨勮姹備互妫�獙銆備互 telnet 涓轰緥锛歵elnet localhost 8080
 * 				 POST /contextPath/my HTTP/1.1
 * 				 Host: localhost
 * 				 hello: world # 杩欎釜灏辨槸鑷畾涔夎姹傚ご锛屽拰鏍囧噯鐨勮姹傚ご鐨勫啓娉曞埆鏃犱簩鑷� * 				銆愬洖杞︺�
 * 				銆愬洖杞︺�
 * */
@Controller
@RequestMapping("/my")
public class UserController {

    @Autowired
    public UserService userService;
    /**
     * 鐧婚檰
     * @return
     */
    @RequestMapping(value="/login")
    @ResponseBody
    public Map<String, Object> login(String id, String password, String roleId,HttpServletRequest request) {
    	
        Map<String, Object> map = new HashMap<String, Object>();
        User user=new User();
        user=userService.login(id, password, roleId);
        HttpSession session = request.getSession();
    	session.setAttribute("user", user);
    	session.setAttribute("roleId", roleId);
        if(user!=null){
            map.put("flag", Boolean.TRUE);
            System.out.println(map.get("flag"));
        }else{
        	System.out.println(map.get("flag"));
            map.put("flag", Boolean.FALSE);
        }
        return map;
    }
    /**
     * 鏌ヨ鎵�湁鐢ㄦ埛
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/findallUser")
    public List<Map<String, Object>> findallUser(String roleId){

       System.out.println("-------find");
       if(!roleId.equals("")){
    	   List<Map<String, Object>> L=userService.findUserByRoleId(roleId);
    	   return L;
       }else{
    	   List<Map<String, Object>> L = userService.findallUser();
    	   return L;
       }

    }
    
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
    @ResponseBody
    @RequestMapping(value="/insertUser")
    public Integer insertUser(String userId,String userName,String password,String createby,String ufID,String roleId){
    	Integer i=userService.insertUser(userId, userName, password, createby, ufID, roleId);
    	return i;
    	
    }

    /**
     * 修改密码
     * @param id
     * @param password
     * @return
     */
    @ResponseBody
    @RequestMapping(value="/updatePassword")
    public Map<String, Object> updatePassword(String id,String password){
    	Map<String, Object> map = new HashMap<String, Object>();
    	Integer i=userService.updateUser(id, password);
    	map.put("i", i);
    	return map;
    }
    
    @ResponseBody
    @RequestMapping(value="/delUser")
    public Map<String, Object> delUser(String id){
    	Map<String, Object> map = new HashMap<String, Object>();
    	Integer i=userService.delUser(id);
    	map.put("i", i);
    	return map;
    }


    @ResponseBody
    @RequestMapping(value = "/findUserById")
    public List<Map<String,Object>> findUserById(String id){
        Map<String, Object> map = new HashMap<String, Object>();
        List<Map<String,Object>> listarray=userService.findUserById(id);
        return listarray;
    }

    @ResponseBody
    @RequestMapping(value = "/userUpdatePwd")
    public Map<String,Object> userUpdatePwd(String password,HttpServletRequest request){
        Map<String, Object> map = new HashMap<String, Object>();
        User user= (User) request.getSession().getAttribute("user");
        Integer i=userService.userUpdatePwd(user.getId(),password);
        map.put("i",i);
        return map;
    }

    /**
     * 查询学生任课教师
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/selectTeacherSubject")
    public List<Map<String,Object>> selectTeacherSubject(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<Map<String,Object>> list=userService.selectTeacherSubject(user.getId());
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "/selectTeacherStudent")
    public List<Map<String,Object>> selectTeacherStudent(HttpServletRequest request){
        User user=(User)request.getSession().getAttribute("user");
        List<Map<String,Object>> list=userService.selectTeacherStudent(user.getId());
        return list;
    }
}
