package com.crud.utils;

public class ConvertString {

	public static int isToInt(String string) {
		if (string != null) {
			return 1;
		}
		return 0;
	}

	public static double isToDouble(String string) {
		if (string != null && string != "") {
			double a = Double.parseDouble(string);
			return a;
		}
		return 0;
	}
}
