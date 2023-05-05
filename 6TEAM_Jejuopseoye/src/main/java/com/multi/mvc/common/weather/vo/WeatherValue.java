package com.multi.mvc.common.weather.vo;


public class WeatherValue {
	private long announceTime;
	private int numEf;
	private int rnYn;
	private int ta;
	private String wfCd;
	
	public WeatherValue() {
		super();
		// TODO Auto-generated constructor stub
	}

	public WeatherValue(long announceTime, int numEf, int rnYn, int ta, String wfCd) {
		super();
		this.announceTime = announceTime;
		this.numEf = numEf;
		this.rnYn = rnYn;
		this.ta = ta;
		this.wfCd = wfCd;
	}

	@Override
	public String toString() {
		return "WeatherValue [announceTime=" + announceTime + ", numEf=" + numEf + ", rnYn=" + rnYn + ", ta=" + ta
				+ ", wfCd=" + wfCd + "]";
	}

	public long getAnnounceTime() {
		return announceTime;
	}

	public void setAnnounceTime(long announceTime) {
		this.announceTime = announceTime;
	}

	public int getNumEf() {
		return numEf;
	}

	public void setNumEf(int numEf) {
		this.numEf = numEf;
	}

	public int getRnYn() {
		return rnYn;
	}

	public void setRnYn(int rnYn) {
		this.rnYn = rnYn;
	}

	public int getTa() {
		return ta;
	}

	public void setTa(int ta) {
		this.ta = ta;
	}

	public String getWfCd() {
		return wfCd;
	}

	public void setWfCd(String wfCd) {
		this.wfCd = wfCd;
	}

}
