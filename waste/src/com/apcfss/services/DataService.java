package com.apcfss.services;

import java.util.List;

import com.apcfss.Model.Data;

public interface DataService {

	List<Data> getDepartment();
		List<Data> getDdo(String department);

	List<Data> getHoa(String department);

	List<Data> getVieweport(String dpt);

	List<Data> getAll();

	List<Data> getalltotalsum();
	List<Data> getDdoALL();




}
