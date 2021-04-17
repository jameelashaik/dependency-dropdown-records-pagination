package com.apcfss.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.apcfss.Model.Data;
@Repository("datadao")
public class DataDaoImpl implements DataDao{
	
	@Autowired
	JdbcTemplate jdbcTemplate;
	public DataDaoImpl(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	@Override
	public List<Data> getDepartment() {
	    return jdbcTemplate.query("select distinct department from public.migration_bills_2020_2021 limit 10",new RowMapper<Data>(){    
	        public Data mapRow(ResultSet rs, int row) throws SQLException {    
	        	Data e=new Data();    
	            e.setDepartment(rs.getString("department"));    
	            return e;    
	        }    
	    }); 
	}
	
	@Override
	public List<Data> getDdo(String hoa) {
	    return jdbcTemplate.query("select distinct ddo from public.migration_bills_2020_2021 where hoa='"+hoa+"'",new RowMapper<Data>(){    
	        public Data mapRow(ResultSet rs, int row) throws SQLException {    
	        	Data e=new Data();    
	            e.setDdo(rs.getString("ddo"));      
	            return e;    
	        }    
	    }); 
	}
	@Override
	public List<Data> getHoa(String department) {
	    return jdbcTemplate.query("select distinct hoa from public.migration_bills_2020_2021 where trim(department)='"+department+"'",new RowMapper<Data>(){    
	        public Data mapRow(ResultSet rs, int row) throws SQLException {    
	        	Data e=new Data();    
	            e.setHoa(rs.getString("hoa"));      
	            return e;    
	        }    
	    }); 
	}
	@Override
	public List<Data> getVieweport(String dpt) {
		return jdbcTemplate.query("SELECT district, treasury, department, ddo, hoa, bill_type, bill_subtype, old_bill, status_at_eoy, new_bill, status_at_boy, gross_amount, deduction_amount, net_amount \r\n" + 
				"    FROM public.migration_bills_2020_2021 where department=? ",new Object[]{dpt},new RowMapper<Data>() {
			public Data mapRow(ResultSet rs, int row)
					throws SQLException {
				Data u = new Data();
				u.setDistrict(rs.getString("district"));
				u.setTreasury(rs.getString("treasury"));
				u.setDepartment(rs.getString("department"));
				u.setDdo(rs.getString("ddo"));
				u.setHoa(rs.getString("hoa"));
				u.setBill_type(rs.getString("bill_type"));
				u.setBill_subtype(rs.getString("bill_subtype"));
				u.setOld_bill(rs.getString("old_bill"));
				u.setStatus_at_eoy(rs.getString("status_at_eoy"));
				u.setNew_bill(rs.getString("new_bill"));
				u.setStatus_at_boy(rs.getString("status_at_boy"));
				u.setGross_amount(rs.getInt("gross_amount"));
				u.setDeduction_amount(rs.getInt("deduction_amount"));
				u.setNet_amount(rs.getInt("net_amount"));
				
				
				
				return u;
			}
		});
	}
	@Override
	public List<Data> getAll() {
		return jdbcTemplate.query("SELECT district, treasury, department, ddo, hoa, bill_type, bill_subtype, old_bill, status_at_eoy, new_bill, status_at_boy, gross_amount, deduction_amount, net_amount  \r\n" + 
				"    FROM public.migration_bills_2020_2021 limit 250",new Object[] {},new RowMapper<Data>() {
			public Data mapRow(ResultSet rs, int row)
					throws SQLException {
				Data u = new Data();
				u.setDistrict(rs.getString("district"));
				u.setTreasury(rs.getString("treasury"));
				u.setDepartment(rs.getString("department"));
				u.setDdo(rs.getString("ddo"));
				u.setHoa(rs.getString("hoa"));
				u.setBill_type(rs.getString("bill_type"));
				u.setBill_subtype(rs.getString("bill_subtype"));
				u.setOld_bill(rs.getString("old_bill"));
				u.setStatus_at_eoy(rs.getString("status_at_eoy"));
				u.setNew_bill(rs.getString("new_bill"));
				u.setStatus_at_boy(rs.getString("status_at_boy"));
				u.setGross_amount(rs.getInt("gross_amount"));
				u.setDeduction_amount(rs.getInt("deduction_amount"));
				u.setNet_amount(rs.getInt("net_amount"));
				return u;
			}
		});
	}
	@Override
	public List<Data> getalltotalsum() {
		return jdbcTemplate.query("select sum(gross_amount) as gross,sum(deduction_amount) as deduction, sum(net_amount) as net from (select gross_amount,deduction_amount,net_amount from migration_bills_2020_2021 offset 0 rows fetch next 10 rows only) as gr",new Object[] {},new RowMapper<Data>() {
			public Data mapRow(ResultSet rs, int row)
					throws SQLException {
				Data u = new Data();
				//u.setGross_amount(rs.getInt(1));
				u.setGross(rs.getDouble(1));
				u.setDeduction(rs.getDouble(2));
				u.setNet(rs.getDouble(3));
				//System.out.println("gross in daoimpl see----"+rs.getDouble("gross"));
				return u;
			}
		});
	}
	@Override
	public List<Data> getDdoALL() {
		return jdbcTemplate.query("select distinct ddo from public.migration_bills_2020_2021",new RowMapper<Data>(){    
	        public Data mapRow(ResultSet rs, int row) throws SQLException {    
	        	Data e=new Data();    
	            e.setDdo(rs.getString("ddo"));    
	            return e;    
	        }    
	    }); 
	}
	

		
}
