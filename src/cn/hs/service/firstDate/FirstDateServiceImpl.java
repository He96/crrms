package cn.hs.service.firstDate;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hs.dao.firstDate.FirstDateMapper;
import cn.hs.pojo.FirstDate;
@Service
public class FirstDateServiceImpl implements FirstDateService {
	@Resource
	private FirstDateMapper firstDateMapper;
	@Override
	public List<FirstDate> getfirstDate() {
		return firstDateMapper.getfirstDate();
	}

	@Override
	public int addfirstDate(Date firstDate) {
		return firstDateMapper.addfirstDate(firstDate);
	}

	@Override
	public int firstDateNum() {
		return firstDateMapper.firstDateNum();
	}

	@Override
	public int deletefirstDate() {
		return firstDateMapper.deletefirstDate();
	}

}
