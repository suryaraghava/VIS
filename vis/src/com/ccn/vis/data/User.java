package com.ccn.vis.data;

public class User {
	
	private String category;
	
	private String description;
	private String host;
	private String ip;
	private String status;
	private String subServerName;
	private String mainServerName;
	private int serialNumber;
	private String ans;
	
	public String getAns() {
		return ans;
	}
	public void setAns(String ans) {
		this.ans = ans;
	}
	public int getSerialNumber() {
		return serialNumber;
	}

	public void setSerialNumber(int serialNumber) {
		this.serialNumber = serialNumber;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSubServerName() {
		return subServerName;
	}

	public void setSubServerName(String subServerName) {
		this.subServerName = subServerName;
	}

	public String getMainServerName() {
		return mainServerName;
	}

	public void setMainServerName(String mainServerName) {
		this.mainServerName = mainServerName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "User [subServerName=" + subServerName + ",description=" + description +", host=" + host + ", ip=" + ip + ", status="
				+ status +"]";
	}

}