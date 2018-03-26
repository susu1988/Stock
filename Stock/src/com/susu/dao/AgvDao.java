package com.susu.dao;

import java.util.ArrayList;
import java.util.List;

import com.nkl.admin.domain.Car;
import com.nkl.common.dao.BaseDao;
import com.nkl.common.util.StringUtil;
import com.susu.domain.Agv;
import com.susu.sever.SendOrder;


public class AgvDao extends BaseDao{
	
	public void addAgv(Agv Agv){
		super.add(Agv);
	}
	
	public void delAgv(Integer AgvID){
		super.del(Agv.class, AgvID);
	}
	
	public void delAgv(String[] AgvIDs){
		StringBuilder sBuilder = new StringBuilder();
		for (int i = 0; i <AgvIDs.length; i++) {
			sBuilder.append(AgvIDs[i]);
			if (i !=AgvIDs.length-1) {
				sBuilder.append(",");
			}
		}
		String hql = "DELETE FROM Agv d WHERE d.AgvId IN (" +sBuilder.toString()+")";

		Object[] params = null;
		
		super.executeUpdateHql(hql, params);
	}
	
    public void runAgv(Integer AgvID) {
    	SendOrder sendOrder=new SendOrder();
		sendOrder.SendLicense(AgvID, 1);
	}
    public void stopAgv(Integer AgvID) {
    	SendOrder sendOrder=new SendOrder();
		sendOrder.SendLicense(AgvID, 2);
	}
	
	
	public void updateAgv(Agv Agv){
		Agv _Agv = (Agv)super.get(Agv.class,Agv.getAgvID());
		if (Agv.getElectricity()!=0) {
			_Agv.setElectricity(Agv.getElectricity());
			_Agv.setxCoordinate(Agv.getxCoordinate());
			_Agv.setyCoordinate(Agv.getyCoordinate());
			_Agv.setBxCoordinate(Agv.getBxCoordinate());
			_Agv.setByCoordinate(Agv.getByCoordinate());
			_Agv.setState(Agv.getState());
			_Agv.setRemarks(Agv.getRemarks());
			_Agv.setWarnings(Agv.getWarnings());
			
		}
		
	    //super.update(Agv);
	}
	
	@SuppressWarnings("rawtypes")
	public Agv getAgv(Agv Agv){
		Agv _Agv = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("FROM Agv a WHERE 1=1");
		
		List<Object> paramsList = new ArrayList<Object>();
		if (Agv.getAgvID()!=0) {
			sBuilder.append(" and a.AgvId = ? ");
			paramsList.add(Agv.getAgvID());
		}
		if (!StringUtil.isEmptyString(Agv.getRemarks())) {
			sBuilder.append(" and a.Remarks= ? ");
			paramsList.add(Agv.getRemarks());
		}
		
		Object[] params = null;
		if (paramsList.size()>0) {
			params = new Object[paramsList.size()];
			for (int i = 0; i < paramsList.size(); i++) {
				params[i] = paramsList.get(i);
			}
		}
		
		List list = super.executeQueryHql(sBuilder.toString(), params);
		if (list != null && list.size() > 0) {
			_Agv = (Agv)list.get(0);
		}
		return _Agv;
	}
	
	@SuppressWarnings("rawtypes")
	public List<Agv>  listAgvs(Agv Agv){
		List<Agv> Agvs = null;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("FROM Agv a WHERE 1=1");

		List<Object> paramsList = new ArrayList<Object>();
		if (Agv.getAgvID()!=0) {
			sBuilder.append(" and a.AgvId = ? ");
			paramsList.add(Agv.getAgvID());
		}
		if (Agv.getElectricity()!=0) {
			sBuilder.append(" and a.Electricity like ? ");
			paramsList.add("%"+Agv.getElectricity()+"%");
		}
		if (Agv.getxCoordinate()!=0) {
			sBuilder.append(" and a.xCoordinate like ? ");
			paramsList.add("%"+Agv.getxCoordinate()+"%");
		}
		if (Agv.getyCoordinate()!=0) {
			sBuilder.append(" and a.yCoordinate = ? ");
			paramsList.add(Agv.getyCoordinate());
		}
		
		Object[] params = null;
		if (paramsList.size()>0) {
			params = new Object[paramsList.size()];
			for (int i = 0; i < paramsList.size(); i++) {
				params[i] = paramsList.get(i);
			}
		}
		
		sBuilder.append(" order by a.AgvId asc");

		List list = null;
		if (Agv.getStart()!=-1) {
			list = super.findByPageHql(sBuilder.toString(), params, Agv.getStart(), Agv.getLimit());
		}else {
			list = super.executeQueryHql(sBuilder.toString(), params);
		}
		if (list != null && list.size() > 0) {
			Agvs = new ArrayList<Agv>();
			for (Object object : list) {
				Agvs.add((Agv)object);
			}
		}
		return Agvs;
	}
	
	
	public int listAgvsCount(Agv Agv){
		int sum = 0;
		StringBuilder sBuilder = new StringBuilder();
		sBuilder.append("SELECT count(*) FROM Agv a WHERE 1=1");

		List<Object> paramsList = new ArrayList<Object>();
		if (Agv.getAgvID()!=0) {
			sBuilder.append(" and a.AgvId = ? ");
			paramsList.add(Agv.getAgvID());
		}
		if (Agv.getElectricity()!=0) {
			sBuilder.append(" and a.Electricity like ? ");
			paramsList.add("%"+Agv.getElectricity()+"%");
		}
		if (Agv.getxCoordinate()!=0) {
			sBuilder.append(" and a.xCoordinate like ? ");
			paramsList.add("%"+Agv.getxCoordinate()+"%");
		}
		if (Agv.getyCoordinate()!=0) {
			sBuilder.append(" and a.yCoordinate = ? ");
			paramsList.add(Agv.getyCoordinate());
		}
		
		Object[] params = null;
		if (paramsList.size()>0) {
			params = new Object[paramsList.size()];
			for (int i = 0; i < paramsList.size(); i++) {
				params[i] = paramsList.get(i);
			}
		}

		long count = (Long)super.executeQueryCountHql(sBuilder.toString(), params);
		sum = (int)count;
		return sum;
	}
	
	
	
	
}

