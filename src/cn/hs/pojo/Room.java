package cn.hs.pojo;

import java.io.Serializable;

//机房
public class Room implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String roomName;//机房名称
	private String roomSeat;//机房座位数
	private Integer roomStatus;//机房状态
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getRoomSeat() {
		return roomSeat;
	}
	public void setRoomSeat(String roomSeat) {
		this.roomSeat = roomSeat;
	}
	public Integer getRoomStatus() {
		return roomStatus;
	}
	public void setRoomStatus(Integer roomStatus) {
		this.roomStatus = roomStatus;
	}
	
	
}

