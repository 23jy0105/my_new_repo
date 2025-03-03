package model;

import java.sql.Timestamp;

public class LodgmentRoom {
	private String roomNo;
	private String state;
	private String reservationNo;
	private String lodgmentNo;
	private int lodgmentCount;
	private Timestamp checkOutTime;
	public LodgmentRoom() {
		super();
	}
	public LodgmentRoom(String roomNo, String state, String reservationNo, String lodgmentNo,int lodgmentCount,Timestamp checkOutTime) {
		super();
		this.roomNo = roomNo;
		this.state = state;
		this.reservationNo = reservationNo;
		this.lodgmentNo = lodgmentNo;
		this.lodgmentCount = lodgmentCount;
		this.checkOutTime = checkOutTime;
	}
	public String getRoomNo() {
		return roomNo;
	}
	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getReservationNo() {
		return reservationNo;
	}
	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}
	public String getLodgmentNo() {
		return lodgmentNo;
	}
	public void setLodgmentNo(String lodgmentNo) {
		this.lodgmentNo = lodgmentNo;
	}
	public int getLodgmentCount() {
		return lodgmentCount;
	}
	public void setLodgmentCount(int lodgmentCount) {
		this.lodgmentCount = lodgmentCount;
	}
	public Timestamp getCheckOutTime() {
		return checkOutTime;
	}
	public void setCheckOutTime(Timestamp checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	
}
