package com.apcfss.services;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.apcfss.DAO.DataDao;
import com.apcfss.Model.Data;



@Service("dataservice")
public class DataServiceImpl implements DataService{
	@Autowired
	DataDao datadao;

	@Override
	public List<Data> getDepartment() {
		// TODO Auto-generated method stub
		return datadao.getDepartment();
	}
	
	@Override
	public List<Data> getDdo(String hoa) {
		// TODO Auto-generated method stub
		return datadao.getDdo(hoa);
	}

	@Override
	public List<Data> getHoa(String department) {
		// TODO Auto-generated method stub
		return datadao.getHoa(department);
	}

	@Override
	public List<Data> getVieweport(String dpt) {
		// TODO Auto-generated method stub
		return datadao.getVieweport(dpt);
	}

	@Override
	public List<Data> getAll() {
		// TODO Auto-generated method stub
		return datadao.getAll();
	}

	@Override
	public List<Data> getalltotalsum() {
		// TODO Auto-generated method stub
		return datadao.getalltotalsum();
	}

	@Override
	public List<Data> getDdoALL() {
		return datadao.getDdoALL();
	}

	
}
