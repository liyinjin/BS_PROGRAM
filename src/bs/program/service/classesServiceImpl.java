package bs.program.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import bs.program.dao.classesDao;
@Service
public class classesServiceImpl implements classesService {
	@Resource
	public classesDao classesdao; 
	@Override
	public List<Map<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		return classesdao.selectAll();
	}
	
	@Override
	public Integer insertClassess(String id,String name) {
		// TODO Auto-generated method stub
		return classesdao.insertClasses(id,name);
	}

}
