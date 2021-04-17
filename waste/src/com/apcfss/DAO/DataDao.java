package com.apcfss.DAO;

import java.util.List;

import com.apcfss.Model.Data;

public interface DataDao {

	List<Data> getDepartment();
		java.util.List<Data> getDdo(String department);

	java.util.List<Data> getHoa(String department);

	java.util.List<Data> getVieweport(String ddo);

	java.util.List<Data> getAll();

	java.util.List<Data> getalltotalsum();
	List<Data> getDdoALL();




}
