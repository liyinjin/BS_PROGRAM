package bs.program.service;

import bs.program.dao.classesDao;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
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

    @Override
    public Integer delClassess(String id) {

	    return classesdao.delClasses(id);
    }

    @Override
    public Integer upClasses(String id, String name) {
        return classesdao.upClasses(id,name);
    }

}
