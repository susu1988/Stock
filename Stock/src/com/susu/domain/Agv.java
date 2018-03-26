package com.susu.domain;

import com.nkl.common.domain.BaseDomain;


public class Agv extends BaseDomain  {

	/**
	 * eclipse生成的序列号，时间是2018-3-16
	 */
	private static final long serialVersionUID = -722579622093103144L;
	// Fields

	private int agvID;
	private int electricity;
	private int state;
	private float xCoordinate;//当前坐标值
	private float yCoordinate;
	private float bxCoordinate;//前一节点值
	private float byCoordinate;
	private int orderID;
	private String remarks;
	private String warnings;//小车故障警告提醒
	
	public int getAgvID() {
		return agvID;
	}
	public void setAgvID(int agvID) {
		this.agvID = agvID;
	}
	public int getElectricity() {
		return electricity;
	}
	public void setElectricity(int electricity) {
		this.electricity = electricity;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public float getxCoordinate() {
		return xCoordinate;
	}
	public void setxCoordinate(float xCoordinate) {
		this.xCoordinate = xCoordinate;
	}
	public float getyCoordinate() {
		return yCoordinate;
	}
	public void setyCoordinate(float yCoordinate) {
		this.yCoordinate = yCoordinate;
	}
	public float getBxCoordinate() {
		return bxCoordinate;
	}
	public void setBxCoordinate(float bxCoordinate) {
		this.bxCoordinate = bxCoordinate;
	}
	public float getByCoordinate() {
		return byCoordinate;
	}
	public void setByCoordinate(float byCoordinate) {
		this.byCoordinate = byCoordinate;
	}
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getWarnings() {
		return warnings;
	}
	public void setWarnings(String warnings) {
		this.warnings = warnings;
	}
	


}