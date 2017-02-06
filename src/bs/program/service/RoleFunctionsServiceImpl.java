package bs.program.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bs.program.dao.RoleFunctionsDao;

@Service
public class RoleFunctionsServiceImpl implements RoleFunctionsService {

    @Autowired
    public RoleFunctionsDao rfd;

    @Override
    public List<Map<String, Object>> queryByModule(String id, String module) {
        // TODO Auto-generated method stub
        Map<String, Object> maps = null;
        List<Map<String, Object>> rl = rfd.findRoleFunctionsByModule(id, module);
        for (int i = 0; i < rl.size(); i++) {
            maps = new HashMap<String, Object>();
            Map<String, Object> map = rl.get(i);
            maps.put("url", map.get("url"));
            map.put("attributes", maps);
        }
        return rl;
    }

}