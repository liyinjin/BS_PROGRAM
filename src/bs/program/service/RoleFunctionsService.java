package bs.program.service;

import java.util.List;
import java.util.Map;

public interface RoleFunctionsService{

    /**
     * 查询模块功能
     * @param module
     * @return
     */
    public List<Map<String, Object>> queryByModule(String id, String module);

}
