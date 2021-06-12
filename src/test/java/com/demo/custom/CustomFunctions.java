package com.demo.custom;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class CustomFunctions {
	
	public static boolean matchDate(ArrayList<String> dateHeader) {
		
		String pattern = "EE, dd MMMM yyyy";
		SimpleDateFormat simpleDateFormat =
		        new SimpleDateFormat(pattern, new Locale("EN", "EN"));

		String date = simpleDateFormat.format(new Date());
		System.out.println("System data ---" +date);
		System.out.println("-----Matching response header date-----");
		String splitBy = "2021";
		String Header = dateHeader.get(0);
		String match= Header.substring(0, Header.indexOf("2021")+4);
		System.out.println(match);
		
		if(match==date) {
			return true;
		}
		else {
			return false;
		}
	}

}
