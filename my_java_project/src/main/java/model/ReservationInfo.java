package model;

public class ReservationInfo implements java.io.Serializable{
	private int stayDays;
	private int people;
	private int room;
	private String startDate;
	
	public ReservationInfo() {
		
	}

	public ReservationInfo(int stayDays, int people, int room, String startDate) {
		this.stayDays = stayDays;
		this.people = people;
		this.room = room;
		this.startDate = startDate;
	}

	public int getStayDays() {
		return stayDays;
	}

	public void setStayDays(int stayDays) {
		this.stayDays = stayDays;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public int getRoom() {
		return room;
	}

	public void setRoom(int room) {
		this.room = room;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	
}
