package model;

public class storeVO {

	private int id;
	private String name;
	private String cell;
	private String type;
	private String time;
	private String addr;
	private String picture;
	private int view;
	private String lat;
	private String lng;
	
	
	public storeVO(int id, String name, String cell, String type, String time, String addr, String picture, String lat, String lng) {
		super();
		this.id = id;
		this.name = name;
		this.cell = cell;
		this.type = type;
		this.time = time;
		this.addr = addr;
		this.picture = picture;
		this.lat = lat;
		this.lng = lng;
	}

	public storeVO(String name, String cell, String type, String time, String addr, String picture) {
		super();
		this.name = name;
		this.cell = cell;
		this.type = type;
		this.time = time;
		this.addr = addr;
		this.picture = picture;
	}
	
	
	

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCell() {
		return cell;
	}

	public void setCell(String cell) {
		this.cell = cell;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getPicture() {
		return picture ;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	
	
	
}
