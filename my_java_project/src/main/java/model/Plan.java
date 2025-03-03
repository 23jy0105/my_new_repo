package model;

import java.io.Serializable;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

public class Plan implements Serializable{

	private String planNo;
	private String planName;
	private String roomTypeNo;
	private String planImage;
	private String planOverview;
	private String planDescription;
	private int fee;
	private Timestamp startTime;
	private Timestamp endTime;
	private String mealNo;
	
	public Plan() {
		
	}

	public Plan(String planNo, String planName, String roomTypeNo, String planImage, String planOverview,
			String planDescription, int fee, Timestamp startTime, Timestamp endTime, String mealNo, Date date) {
		
		this.planNo = planNo;
		this.planName = planName;
		this.roomTypeNo = roomTypeNo;
		this.planImage = planImage;
		this.planOverview = planOverview;
		this.planDescription = planDescription;
		this.fee = fee;
		this.startTime = startTime;
		this.endTime = endTime;
		this.mealNo = mealNo;
	}

	public String getPlanNo() {
		return planNo;
	}

	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}

	public String getPlanName() {
		return planName;
	}

	public void setPlanName(String planName) {
		this.planName = planName;
	}

	public String getRoomTypeNo() {
		return roomTypeNo;
	}

	public void setRoomTypeNo(String roomTypeNo) {
		this.roomTypeNo = roomTypeNo;
	}

	public String getPlanImage() {
		return planImage;
	}

	public void setPlanImage(String planImage) {
		this.planImage = planImage;
	}

	public String getPlanOverview() {
		return planOverview;
	}

	public void setPlanOverview(String planOverview) {
		this.planOverview = planOverview;
	}

	public String getPlanDescription() {
		return planDescription;
	}

	public void setPlanDescription(String planDescription) {
		this.planDescription = planDescription;
	}

	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public Timestamp getStartTime() {
		return startTime;
	}

	public void setStartTime(Timestamp startTime) {
		this.startTime = startTime;
	}

	public Timestamp getEndTime() {
		return endTime;
	}

	public void setEndTime(Timestamp endTime) {
		this.endTime = endTime;
	}

	public String getMealNo() {
		return mealNo;
	}

	public void setMealNo(String mealNo) {
		this.mealNo = mealNo;
	}
	

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Plan plan = (Plan) o;
        return Objects.equals(planNo, plan.planNo); // planNoが同じなら同一とみなす
    }

    @Override
    public int hashCode() {
        return Objects.hash(planNo); // planNoを基にハッシュコードを生成
    }
}