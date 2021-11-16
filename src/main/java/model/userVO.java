package model;

public class userVO {

	private String user_id;
	private String user_pwd;
	private String user_name;
	private String user_addr;
	private String user_prefer;
	private int user_mileage;
	
	public userVO(String user_id, String user_pwd, String user_name, String user_addr, String user_prefer) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_addr = user_addr;
		this.user_prefer = user_prefer;
		
	}
	
	public userVO(String user_id, String user_pwd, String user_name, String user_addr, String user_prefer, int user_mileage) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_addr = user_addr;
		this.user_prefer = user_prefer;
		this.user_mileage = user_mileage;
	}
	
	public userVO(String user_id, String user_pwd) {
		super();
		this.user_id = user_id;
		this.user_pwd = user_pwd;
	}
	
	public int getUser_mileage() {
		return user_mileage;
	}

	public void setUser_mileage(int user_mileage) {
		this.user_mileage = user_mileage;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_prefer() {
		return user_prefer;
	}

	public void setUser_prefer(String user_prefer) {
		this.user_prefer = user_prefer;
	}
	
	
	
}
