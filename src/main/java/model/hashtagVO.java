package model;

public class hashtagVO {

	private int review_num;
	private String mood;
	private String with_who;
	private String facil;
	
	public hashtagVO( String mood, String with_who, String facil) {
		super();
		
		this.mood = mood;
		this.with_who = with_who;
		this.facil = facil;
	}

	public int getReview_num() {
		return review_num;
	}

	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}

	public String getMood() {
		return mood;
	}

	public void setMood(String mood) {
		this.mood = mood;
	}

	public String getWith_who() {
		return with_who;
	}

	public void setWith_who(String with_who) {
		this.with_who = with_who;
	}

	public String getFacil() {
		return facil;
	}

	public void setFacil(String facil) {
		this.facil = facil;
	}
	
	
}
