package model;

public class Meal {

	private String mealNo;
	private String mealName;
	private String allergen;
	private String mealImage;
	
	public Meal() {}
	
	public Meal(String mealNo, String mealName, String allergen, String mealImage) {
		super();
		this.mealNo = mealNo;
		this.mealName = mealName;
		this.allergen = allergen;
		this.mealImage = mealImage;
		
	}
	public String getMealNo() {
		return mealNo;
	}
	public void setMealNo(String mealNo) {
		this.mealNo = mealNo;
	}
	public String getMealName() {
		return mealName;
	}
	public void setMealName(String mealName) {
		this.mealName = mealName;
	}
	public String getAllergen() {
		return allergen;
	}
	public void setAllergen(String allergen) {
		this.allergen = allergen;
	}
	public String getMealImage() {
		return mealImage;
	}
	public void setMealImage(String mealImage) {
		this.mealImage = mealImage;
	}
	
}