package model;

public class postVO {

	private int post_num;
	private String user_id;
	private String post_title;
	private String regist_dt;
	private int post_like;
	private String post_content;
	private String post_picture;
	private int post_view;

//	
//	public postVO(int post_num, String user_id, String post_title, String regist_dt, int post_like, String post_content,
//			String post_picture, int post_view) {
//		super();
//		this.post_num = post_num;
//		this.user_id = user_id;
//		this.post_title = post_title;
//		this.regist_dt = regist_dt;
//		this.post_like = post_like;
//		this.post_content = post_content;
//		this.post_picture = post_picture;
//		this.post_view = post_view;
//	}

	public String getPost_picture() {
		return post_picture;
	}

	public void setPost_picture(String post_picture) {
		this.post_picture = post_picture;
	}

	public int getPost_num() {
		return post_num;
	}

	public void setPost_num(int post_num) {
		this.post_num = post_num;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getRegist_dt() {
		return regist_dt;
	}

	public void setRegist_dt(String regist_dt) {
		this.regist_dt = regist_dt;
	}

	public int getPost_view() {
		return post_view;
	}

	public void setPost_view(int post_view) {
		this.post_view = post_view;
	}

	public int getPost_like() {
		return post_like;
	}

	public void setPost_like(int post_like) {
		this.post_like = post_like;
	}
}
