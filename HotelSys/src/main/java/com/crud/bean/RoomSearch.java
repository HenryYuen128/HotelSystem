package com.crud.bean;


public class RoomSearch {

	private String single;
	private String couples;
	private String luxury;
	private String garden;
	private String computer;
	private String breakfast;
	private String clean;
	private String fromprice;
	private String toprice;
	private String pn;
	
	public RoomSearch(String single, String couples, String luxury, String garden, String computer, String breakfast,
			String clean, String fromprice, String toprice, String pn) {
		super();
		this.single = single;
		this.couples = couples;
		this.luxury = luxury;
		this.garden = garden;
		this.computer = computer;
		this.breakfast = breakfast;
		this.clean = clean;
		this.fromprice = fromprice;
		this.toprice = toprice;
		this.pn = pn;
	}
	public String getPn() {
		return pn;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	public RoomSearch() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getSingle() {
		return single;
	}
	public void setSingle(String single) {
		this.single = single;
	}
	public String getCouples() {
		return couples;
	}
	public void setCouples(String couples) {
		this.couples = couples;
	}
	public String getLuxury() {
		return luxury;
	}
	public void setLuxury(String luxury) {
		this.luxury = luxury;
	}
	public String getGarden() {
		return garden;
	}
	public void setGarden(String garden) {
		this.garden = garden;
	}
	public String getComputer() {
		return computer;
	}
	public void setComputer(String computer) {
		this.computer = computer;
	}
	public String getBreakfast() {
		return breakfast;
	}
	public void setBreakfast(String breakfast) {
		this.breakfast = breakfast;
	}
	public String getClean() {
		return clean;
	}
	public void setClean(String clean) {
		this.clean = clean;
	}
	public String getFromprice() {
		return fromprice;
	}
	public void setFromprice(String fromprice) {
		this.fromprice = fromprice;
	}
	public String getToprice() {
		return toprice;
	}
	public void setToprice(String toprice) {
		this.toprice = toprice;
	}
	
	
	
	@Override
	public String toString() {
		return "RoomSearch [single=" + single + ", couples=" + couples + ", luxury=" + luxury + ", garden=" + garden
				+ ", computer=" + computer + ", breakfast=" + breakfast + ", clean=" + clean + ", fromprice="
				+ fromprice + ", toprice=" + toprice + ", pn=" + pn + "]";
	}
	
	
}
