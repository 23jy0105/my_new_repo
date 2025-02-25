package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class Plan implements Serializable{

	private String name;
	private String tyoeName;
	private String image;
	private String overview;
	private String explanation;
	private int fee;
	private Timestamp startTime;
	private Timestamp endTime;
	private int totalRoomCount;
	private int accommodationCount;
	private int reserveRoomNum;
	public Plan(String name, String tyoeName, String image, String overview, String explanation, int fee,
			Timestamp startTime, Timestamp endTime, int totalRoomCount, int accommodationCount, int reserveRoomNum) {
		super();
		this.name = name;
		this.tyoeName = tyoeName;
		this.image = image;
		this.overview = overview;
		this.explanation = explanation;
		this.fee = fee;
		this.startTime = startTime;
		this.endTime = endTime;
		this.totalRoomCount = totalRoomCount;
		this.accommodationCount = accommodationCount;
		this.reserveRoomNum = reserveRoomNum;
	}
	public String getName() {
		return name;
	}
	public String getTyoeName() {
		return tyoeName;
	}
	public String getImage() {
		return image;
	}
	public String getOverview() {
		return overview;
	}
	public String getExplanation() {
		return explanation;
	}
	public int getFee() {
		return fee;
	}
	public Timestamp getStartTime() {
		return startTime;
	}
	public Timestamp getEndTime() {
		return endTime;
	}
	public int getTotalRoomCount() {
		return totalRoomCount;
	}
	public int getAccommodationCount() {
		return accommodationCount;
	}
	public int getReserveRoomNum() {
		return reserveRoomNum;
	}	
	
}