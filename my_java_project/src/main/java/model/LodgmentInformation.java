package model;

import java.sql.Timestamp;

public class LodgmentInformation {
	private String reservationNo;
	private String lodgmentNo;
	private int lodgmentCount;
	private String roomNo;
	private Timestamp checkOutTime;
	private int allergyCount;
	
	public LodgmentInformation() {
		
	}
	
	public LodgmentInformation(String reservationNo, String lodgmentNo, int lodgmentCount, String roomNo,
			Timestamp checkOutTime, int allergyCount) {
		this.reservationNo = reservationNo;
		this.lodgmentNo = lodgmentNo;
		this.lodgmentCount = lodgmentCount;
		this.roomNo = roomNo;
		this.checkOutTime = checkOutTime;
		this.allergyCount = allergyCount;
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

	public String getRoomNo() {
		return roomNo;
	}

	public void setRoomNo(String roomNo) {
		this.roomNo = roomNo;
	}

	public Timestamp getCheckOutTime() {
		return checkOutTime;
	}

	public void setCheckOutTime(Timestamp checkOutTime) {
		this.checkOutTime = checkOutTime;
	}
	
	public int getAllergyCount() {
		return allergyCount;
	}

	public void setAllergyCount(int allergyCount) {
		this.allergyCount = allergyCount;
	}
	
}