package model;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Objects;

public class Reservation {
	private String reservationNo;
	private Date lodgmentStartDate;
	private int lodgmentDays;
	private Timestamp paymentTime;
	private int totalReservationRoom;
	private Timestamp reservationDate;
	private String planNo;
	private Timestamp cancelDate;
	private Timestamp checkInTime;
	private String customerName;
	private String customerNameKana;
	private String emailAddress;
	private String phoneNumber;
	private String address;
	private String postalCode;
//	private int allergyCount;
	private String password;
	private String mealTime;
	
	public Reservation(){
		
	}

	public Reservation(String reservationNo, Date lodgmentStartDate, int lodgmentDays, Timestamp paymentTime,
			int totalReservationRoom, Timestamp reservationDate, String planNo, Timestamp cancelDate,
			Timestamp checkInTime, String customerName, String customerNameKana, String emailAddress,
			String phoneNumber, String address, String postalCode, String password, String mealTime) {
		this.reservationNo = reservationNo;
		this.lodgmentStartDate = lodgmentStartDate;
		this.lodgmentDays = lodgmentDays;
		this.paymentTime = paymentTime;
		this.totalReservationRoom = totalReservationRoom;
		this.reservationDate = reservationDate;
		this.planNo = planNo;
		this.cancelDate = cancelDate;
		this.checkInTime = checkInTime;
		this.customerName = customerName;
		this.customerNameKana = customerNameKana;
		this.emailAddress = emailAddress;
		this.phoneNumber = phoneNumber;
		this.address = address;
		this.postalCode = postalCode;
//		this.allergyCount = allergyCount;
		this.password = password;
		this.mealTime = mealTime;
	}

	public String getReservationNo() {
		return reservationNo;
	}

	public void setReservationNo(String reservationNo) {
		this.reservationNo = reservationNo;
	}

	public Date getLodgmentStartDate() {
		return lodgmentStartDate;
	}

	public void setLodgmentStartDate(Date lodgmentStartDate) {
		this.lodgmentStartDate = lodgmentStartDate;
	}

	public int getLodgmentDays() {
		return lodgmentDays;
	}

	public void setLodgmentDays(int lodgmentDays) {
		this.lodgmentDays = lodgmentDays;
	}

	public Timestamp getPaymentTime() {
		return paymentTime;
	}

	public void setPaymentTime(Timestamp paymentTime) {
		this.paymentTime = paymentTime;
	}

	public int getTotalReservationRoom() {
		return totalReservationRoom;
	}

	public void setTotalReservationRoom(int totalReservationRoom) {
		this.totalReservationRoom = totalReservationRoom;
	}

	public Timestamp getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(Timestamp reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getPlanNo() {
		return planNo;
	}

	public void setPlanNo(String planNo) {
		this.planNo = planNo;
	}

	public Timestamp getCancelDate() {
		return cancelDate;
	}

	public void setCancelDate(Timestamp cancelDate) {
		this.cancelDate = cancelDate;
	}

	public Timestamp getCheckInTime() {
		return checkInTime;
	}

	public void setCheckInTime(Timestamp checkInTime) {
		this.checkInTime = checkInTime;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getCustomerNameKana() {
		return customerNameKana;
	}

	public void setCustomerNameKana(String customerNameKana) {
		this.customerNameKana = customerNameKana;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
//
//	public int getAllergyCount() {
//		return allergyCount;
//	}
//
//	public void setAllergyCount(int allergyCount) {
//		this.allergyCount = allergyCount;
//	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMealTime() {
		return mealTime;
	}

	public void setMealTime(String mealTime) {
		this.mealTime = mealTime;
	}
	
	public int getReservationState() {
		
		if(Objects.nonNull(checkInTime)&&Objects.nonNull(paymentTime)) {
			return 2;
		}else if(Objects.nonNull(cancelDate)&&Objects.nonNull(paymentTime)) {
			return 4;
		}else if(Objects.nonNull(cancelDate)&&Objects.isNull(paymentTime)) {
			return 3;
		}else if(Objects.nonNull(checkInTime)&&Objects.isNull(paymentTime)) {
			return 1;
		}else if(Objects.isNull(checkInTime)&&Objects.isNull(paymentTime)) {
			return 0;
		}else {
			return -1;
		}
		/*
		 0:予約済み
		 1:チェックイン済み
		 2:支払済み
		 3:キャンセル未払い
		 4:キャンセル支払い済み
		 -1:エラー
		  */
	}

}
