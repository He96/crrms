package cn.hs.service.room;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.hs.dao.room.RoomMapper;
import cn.hs.pojo.Room;
@Service
public class RoomServiceImpl implements RoomService {
	@Resource
	private RoomMapper roomMapper;
	@Override
	public List<Room> getRoomList() {
		return roomMapper.getRoomList();
	}

	@Override
	public Room getRoom(Room room) {
		return roomMapper.getRoom(room);
	}

	@Override
	public int addRoom(Room room) {
		
		return roomMapper.addRoom(room);
	}

	@Override
	public int updateRoom(Room room) {
		return roomMapper.updateRoom(room);
	}

	@Override
	public int deleteRoom(Room room) {
		return roomMapper.deleteRoom(room);
	}

}
