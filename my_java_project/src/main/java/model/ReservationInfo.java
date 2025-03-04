package model;

public class ReservationInfo implements java.io.Serializable{
	private String lastName;
	private String firstName;
	private String lastKana;
	private String firstKana;
	private String email;
	private String postalCode;
	private String prefecture;
	private String phone;
	private String address;
	private String building;
	private String allergy;
	private int stayDays;
	private int people;
	private int room;
	private String date;
	private String startDate;
	private String planNum;
	
	public ReservationInfo() {
		
	}

	public ReservationInfo(String lastName, String firstName, String lastKana, String firstKana, String email,
			String postalCode, String prefecture, String phone, String address, String building, String allergy,
			int stayDays, int people, int room, String date, String startDate, String planNum) {
		super();
		this.lastName = lastName;
		this.firstName = firstName;
		this.lastKana = lastKana;
		this.firstKana = firstKana;
		this.email = email;
		this.postalCode = postalCode;
		this.prefecture = prefecture;
		this.phone = phone;
		this.address = address;
		this.building = building;
		this.allergy = allergy;
		this.stayDays = stayDays;
		this.people = people;
		this.room = room;
		this.date = date;
		this.startDate = startDate;
		this.planNum = planNum;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastKana() {
		return lastKana;
	}

	public void setLastKana(String lastKana) {
		this.lastKana = lastKana;
	}

	public String getFirstKana() {
		return firstKana;
	}

	public void setFirstKana(String firstKana) {
		this.firstKana = firstKana;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getPrefecture() {
		return prefecture;
	}

	public void setPrefecture(String prefecture) {
		this.prefecture = prefecture;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getAllergy() {
		return allergy;
	}

	public void setAllergy(String allergy) {
		this.allergy = allergy;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
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
