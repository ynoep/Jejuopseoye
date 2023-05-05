package com.multi.mvc.common.weather.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.multi.mvc.common.weather.vo.WeatherValue;

public class WeatherParsing {
	public static final String KEY1 = "GyTbTLys5EYYf06DrnguwGHEkvSIzn7C6C4FzBajzhzcvchyRVzht9RHo06YePe3ggyA%2FNbAVuCvQyoBSJ4X4Q%3D%3D";
	public static final String KEY2 = "GyTbTLys5EYYf06DrnguwGHEkvSIzn7C6C4FzBajzhzcvchyRVzht9RHo06YePe3ggyA/NbAVuCvQyoBSJ4X4Q==";
	public static final String WEEKLY_WEATHER_JSON_URL = "http://apis.data.go.kr/1360000/VilageFcstMsgService/getLandFcst";

	
	public static List<WeatherValue> parsing(){
		List<WeatherValue> list = new ArrayList<>();
		try {
			StringBuilder urlBuilder = new StringBuilder(WEEKLY_WEATHER_JSON_URL);
			
			urlBuilder.append("?serviceKey=" + KEY1);
			urlBuilder.append("&numOfRows=10&dataType=JSON&pageNo=1&regId=11G00201");
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			
			int code = conn.getResponseCode();
			if (code < 200 || code >= 300) {
				System.out.println("페이지가 잘못되었습니다.");
				return list;
			}
			
			InputStreamReader isr = new InputStreamReader(conn.getInputStream(), "UTF-8");
			BufferedReader br = new BufferedReader(isr);

			JSONParser jsonParser = new JSONParser();
			JSONObject rootObj = (JSONObject) jsonParser.parse(br);
			JSONObject childObj1 = (JSONObject) rootObj.get("response");
			JSONObject childObj2 = (JSONObject) childObj1.get("body");
			JSONObject childObj = (JSONObject) childObj2.get("items");
			JSONArray array1 = (JSONArray) childObj.get("item");
			
			for(int i=0; i<array1.size();i++) {
				JSONObject obj = (JSONObject) array1.get(i);
				long announceTime=getLongData(obj, "announceTime");
				int numEf=getIntData(obj, "numEf");
				int rnYn=getIntData(obj, "rnYn");
				int ta=getIntData(obj, "ta");
				String wfCd=getStrData(obj, "wfCd");
				
				WeatherValue weather = new WeatherValue(announceTime, numEf, rnYn, ta, wfCd);
				list.add(weather);
			}
			
		} catch (Exception e) { e.printStackTrace();}
		
		return list;
	}
	
	
	private static String getStrData(JSONObject obj, String key) {
		String str = (String) obj.get(key);
		if (str == null) {
			return "-";
		} else {
			return str;
		}
	}
	
	private static long getLongData(JSONObject obj, String key) {
		String str = String.valueOf(obj.get(key));
		if (str != null) {
			try {
				return Long.parseLong(str);
			} catch (Exception e) {
			}
		}
		return 0;
	}
	
	private static int getIntData(JSONObject obj , String key){
		String str = String.valueOf(obj.get(key));
		if(str != null) {
			try {
				return Integer.parseInt(str);
			} catch (Exception e) {}
		}
		return 0;
	}
}
