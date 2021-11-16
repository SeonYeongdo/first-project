package model;

public class reviewVO {
	
	private int review_num;
	private String user_id;
	private int  store_id;
	private String regist_dt;
	private int review_score;
	private String review_content;
	private String review_picture;
	private int reviw_like;
	
	public reviewVO( String user_id, int store_id, int review_score,
			String review_content, String review_picture) {
		super();
		// this.review_num = review_num;
		this.user_id = user_id;
		this.store_id = store_id;
		this.review_score = review_score;
		this.review_content = review_content;
		this.review_picture = review_picture;
		
	}
	public reviewVO(int review_num, String user_id, int store_id, String regist_dt, int review_score,
			String review_content, String review_picture, int reviw_like) {
		super();
		this.review_num = review_num;
		this.user_id = user_id;
		this.store_id = store_id;
		this.regist_dt = regist_dt;
		this.review_score = review_score;
		this.review_content = review_content;
		this.review_picture = review_picture;
		this.reviw_like = reviw_like;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStore_id() {
		return store_id;
	}

	public void setStore_id(int store_id) {
		this.store_id = store_id;
	}

	public String getRegist_dt() {
		return regist_dt;
	}

	public void setRegist_dt(String regist_dt) {
		this.regist_dt = regist_dt;
	}

	public int getReview_score() {
		return review_score;
	}

	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_picture() {
		return review_picture;
	}

	public void setReview_picture(String review_picture) {
		this.review_picture = review_picture;
	}

	public int getReviw_like() {
		return reviw_like;
	}

	public void setReviw_like(int reviw_like) {
		this.reviw_like = reviw_like;
	}
	
	
	
	
}
