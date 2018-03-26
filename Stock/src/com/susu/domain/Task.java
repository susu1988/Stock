package com.susu.domain;

import java.util.Date;

import com.nkl.common.domain.BaseDomain;

public class Task extends BaseDomain{
	/**
	 * eclipse生成的序列号，时间是2018-3-16
	 */
	private static final long serialVersionUID = 6130104204337050737L;
	private int orderID;
	private int userID;
	private int goodsID;
	private String gooodsName;
	private int goodscount;
	private String carinfo;
	private int sendID;
	private String sendName;
	private String orderaddress;
	private int startStationID;
	private int aimStationID;
	private Date beginTime;
	private Date endTime;
	private int agvID;
	private int executionState;
	public int getOrderID() {
		return orderID;
	}
	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public int getGoodsID() {
		return goodsID;
	}
	public void setGoodsID(int goodsID) {
		this.goodsID = goodsID;
	}
	public String getGooodsName() {
		return gooodsName;
	}
	public void setGooodsName(String gooodsName) {
		this.gooodsName = gooodsName;
	}
	public int getGoodscount() {
		return goodscount;
	}
	public void setGoodscount(int goodscount) {
		this.goodscount = goodscount;
	}
	public String getCarinfo() {
		return carinfo;
	}
	public void setCarinfo(String carinfo) {
		this.carinfo = carinfo;
	}
	public int getSendID() {
		return sendID;
	}
	public void setSendID(int sendID) {
		this.sendID = sendID;
	}
	public String getSendName() {
		return sendName;
	}
	public void setSendName(String sendName) {
		this.sendName = sendName;
	}
	public String getOrderaddress() {
		return orderaddress;
	}
	public void setOrderaddress(String orderaddress) {
		this.orderaddress = orderaddress;
	}
	public int getStartStationID() {
		return startStationID;
	}
	public void setStartStationID(int startStationID) {
		this.startStationID = startStationID;
	}
	public int getAimStationID() {
		return aimStationID;
	}
	public void setAimStationID(int aimStationID) {
		this.aimStationID = aimStationID;
	}
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public int getAgvID() {
		return agvID;
	}
	public void setAgvID(int agvID) {
		this.agvID = agvID;
	}
	public int getExecutionState() {
		return executionState;
	}
	public void setExecutionState(int executionState) {
		this.executionState = executionState;
	}
	
	

}
