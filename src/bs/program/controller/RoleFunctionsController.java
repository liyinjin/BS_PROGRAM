package bs.program.controller;

import bs.program.bean.User;
import bs.program.service.RoleFunctionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/rfc")
public class RoleFunctionsController {
    @Autowired
    public RoleFunctionsService roleFunctionsService;

    @RequestMapping(value="findbyModule")
    @ResponseBody
    public List<Map<String, Object>> findbyModule(HttpServletRequest request, String module) {
        Map<String, Object> rmap=new HashMap<>();
        User user=(User) request.getSession().getAttribute("user");
        String roleId=(String) request.getSession().getAttribute("roleId");
        List<Map<String, Object>> rf = roleFunctionsService.queryByModule(roleId, module);

        for (Map<String, Object> map : rf) {
            map.put("state", "closed");
        }

        System.out.println(module+"----------------------");
        return rf;

    }

    
}
