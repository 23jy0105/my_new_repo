package model;

public class ReservationInfo implements java.io.Serializable{
	private int stayDays;
	private int people;
	private int room;
	private String startDate;
	private String planNum;
	
	public ReservationInfo() {
		
	}

	public ReservationInfo(int stayDays, int people, int room, String startDate,String planNum) {
		this.stayDays = stayDays;
		this.people = people;
		this.room = room;
		this.startDate = startDate;
		this.planNum = planNum;
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
	
	public String getPlanNum() {
		return planNum;
	}
	public void setPlanNum(String planNum) {
		this.planNum = planNum;
		
	}
	
}
