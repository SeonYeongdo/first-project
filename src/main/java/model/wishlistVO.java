package model;

public class wishlistVO {

	private String userID;
	private int storeID;
	private String registDt;
	
	public wishlistVO(String userID, int storeID, String registDt) {
		super();
		this.userID = userID;
		this.storeID = storeID;
		this.registDt = registDt;
	}
	
	public wishlistVO(String userID, int storeID) {
		super();
		this.userID = userID;
		this.storeID = storeID;
		
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public int getStoreID() {
		return storeID;
	}

	public void setStoreID(int storeID) {
		this.storeID = storeID;
	}

	public String getRegistDt() {
		return registDt;
	}

	public void setRegistDt(String registDt) {
		this.registDt = registDt;
	}
	
	
}
