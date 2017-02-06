package bs.program.service;

import java.util.List;
import java.util.Map;



public interface classesService {
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
	public Integer insertClassess(String id,String name);

	/**
	 * 删除班级
	 * @param id
	 * @return
	 */
	public Integer delClassess(String id);

	/**
	 * 修改班级
	 * @param id
	 * @param name
	 * @return
	 */
	public Integer upClasses(String id, String name);

}
