package model;

import java.sql.Date;

public class RoomRemainingCount {
	private Date date;
	private String roomType;
	private int reserved;
	
	public RoomRemainingCount() {
		
	}

	public RoomRemainingCount(Date date, String roomType, int reserved) {
		this.date = date;
		this.roomType = roomType;
		this.reserved = reserved;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public int getReserved() {
		return reserved;
	}

	public void setReserved(int reserved) {
		this.reserved = reserved;
	}
	
}
