package model;

import java.util.List;

public class filterVO {
	
	private List<String> gu;
	private List<Integer> lowPrice;
	private List<Integer> highPrice;
	private List<String> foodType;
	
	public List<String> getGu() {
		return gu;
	}
	public void setGu(List<String> gu) {
		this.gu = gu;
	}
	public List<Integer> getLowPrice() {
		return lowPrice;
	}
	public void setLowPrice(List<Integer> lowPrice) {
		this.lowPrice = lowPrice;
	}
	public List<Integer> getHighPrice() {
		return highPrice;
	}
	public void setHighPrice(List<Integer> highPrice) {
		this.highPrice = highPrice;
	}
	public List<String> getFoodType() {
		return foodType;
	}
	public void setFoodType(List<String> foodType) {
		this.foodType = foodType;
	}
	
}
