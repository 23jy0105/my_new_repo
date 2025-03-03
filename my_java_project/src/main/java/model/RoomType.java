package model;

public class RoomType {
	private String roomType;
	private String typeName;
	private int maxAccommodation;
	private int totalRoom;
	
	public RoomType() {
		
	}
	
	public RoomType(String roomType, String typeName, int maxAccommodation, int totalRoom) {
		this.roomType = roomType;
		this.typeName = typeName;
		this.maxAccommodation = maxAccommodation;
		this.totalRoom = totalRoom;
	}

	public String getRoomType() {
		return roomType;
	}

	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public int getMaxAccommodation() {
		return maxAccommodation;
	}

	public void setMaxAccommodation(int maxAccommodation) {
		this.maxAccommodation = maxAccommodation;
	}

	public int getTotalRoom() {
		return totalRoom;
	}

	public void setTotalRoom(int totalRoom) {
		this.totalRoom = totalRoom;
	}
	
	
	
}