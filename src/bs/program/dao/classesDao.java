package bs.program.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;
import java.util.List;
import java.util.Map;

@Component
public interface classesDao {
	
	/**
	 * 查询所有班级
	 * @return
	 */
	public List<Map<String, Object>> selectAll();
	
	/**
	 * 添加班级
	 * @param id
	 * @param name
	 * @return
	 */
	public Integer insertClasses(@Param("id")String id,@Param("name")String name);

	/**
	 * 删除班级
	 * @param id
	 * @return
	 */
	public Integer delClasses(@Param("id")String id);

    /**
     * 修改班级
     * @param id
     * @param name
     * @return
     */
	public Integer upClasses(@Param("id")String id,@Param("name")String name);
}
