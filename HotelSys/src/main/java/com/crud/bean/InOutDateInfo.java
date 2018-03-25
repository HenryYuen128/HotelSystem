package com.crud.bean;

public class InOutDateInfo {

	String checkindate;
	String checkoutdate;
	Integer nights;

	public String getCheckindate() {
		return checkindate;
	}

	public void setCheckindate(String checkindate) {
		this.checkindate = checkindate;
	}

	public String getCheckoutdate() {
		return checkoutdate;
	}

	public void setCheckoutdate(String checkoutdate) {
		this.checkoutdate = checkoutdate;
	}

	public Integer getNights() {
		return nights;
	}

	public void setNights(Integer nights) {
		this.nights = nights;
	}

	@Override
	public String toString() {
		return "InOutDateInfo [checkindate=" + checkindate + ", checkoutdate=" + checkoutdate + ", nights=" + nights
				+ "]";
	}

}
