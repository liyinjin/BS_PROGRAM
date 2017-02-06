package bs.program.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import bs.program.bean.classes;

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
}
