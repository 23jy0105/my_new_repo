package model;

public class LodgmentRoom {
	private String roomNo;
	private String state;
	private String reservationNo;
	private String lodgmentNo;
	private int lodgmrnyCount;
	public LodgmentRoom() {
		super();
	}
	public LodgmentRoom(String roomNo, String state, String reservationNo, String lodgmentNo,int lodgmentCount) {
		super();
		this.roomNo = roomNo;
		this.state = state;
		this.reservationNo = reservationNo;
		this.lodgmentNo = lodgmentNo;
		this.lodgmrnyCount = lodgmentCount;
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
	public int getLodgmrnyCount() {
		return lodgmrnyCount;
	}
	public void setLodgmrnyCount(int lodgmrnyCount) {
		this.lodgmrnyCount = lodgmrnyCount;
	}
	
}
