package bs.program.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
@Component
public interface RoleFunctionsDao {
    /**
     * 按照模块查找功能
     * @param module
     * @return
     */
    public List<Map<String, Object>> findRoleFunctionsByModule(@Param("roleId") String roleId,
            @Param("module") String module);


}
