package model;

import java.sql.Timestamp;

public class Room {
	private String roomNo;
	private String typeNo;
	private String roomState;
	private String roomKey;
	private Timestamp keyUpdateTime;
	private Timestamp enterRoomTime;
	private String siteManagementKey;
	
	public Room() {
		
	}
	
	public Room(String roomNo, String typeNo, String roomState, String roomKey, Timestamp keyUpdateTime,
			Timestamp enterRoomTime, String siteManagementKey) {
		this.roomNo = roomNo;
		this.typeNo = typeNo;
		this.roomState = roomState;
		this.roomKey = roomKey;
		this.keyUpdateTime = keyUpdateTime;
		this.enterRoomTime = enterRoomTime;
		this.siteManagementKey = siteManagementKey;
	}

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public String getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(String typeNo) {
		this.typeNo = typeNo;
	}

	public String getRoomState() {
		return roomState;
	}

	public void setRoomState(String roomState) {
		this.roomState = roomState;
	}

	public String getRoomKey() {
		return roomKey;
	}

	public void setRoomKey(String roomKey) {
		this.roomKey = roomKey;
	}

	public Timestamp getKeyUpdateTime() {
		return keyUpdateTime;
	}

	public void setKeyUpdateTime(Timestamp keyUpdateTime) {
		this.keyUpdateTime = keyUpdateTime;
	}

	public Timestamp getEnterRoomTime() {
		return enterRoomTime;
	}

	public void setEnterRoomTime(Timestamp enterRoomTime) {
		this.enterRoomTime = enterRoomTime;
	}

	public String getSiteManagementKey() {
		return siteManagementKey;
	}

	public void setSiteManagementKey(String siteManagementKey) {
		this.siteManagementKey = siteManagementKey;
	}
	
	
	
}