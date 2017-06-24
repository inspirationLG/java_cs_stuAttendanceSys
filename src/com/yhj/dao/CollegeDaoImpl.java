package com.yhj.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.yhj.common.DatabaseConnection;
import com.yhj.domain.CollegeBean;

public class CollegeDaoImpl implements ICollegeDao {

	@Override
	public List<CollegeBean> queryAllCollege() {
		// TODO Auto-generated method stub
		Connection conn = DatabaseConnection.getConnection();
		List<CollegeBean> cols = new ArrayList<>();
		String querySql = "select * from collegeinfo where 1=1";
		try{
			Statement stmt = (Statement) conn.createStatement(ResultSet.TYPE_FORWARD_ONLY,ResultSet.CONCUR_READ_ONLY);
			ResultSet rs = stmt.executeQuery(querySql);
			while(rs.next()){
				CollegeBean col = new CollegeBean();
				col.setCollege_name(rs.getString("college_name"));
				cols.add(col);
			}
			DatabaseConnection.close(rs);
			DatabaseConnection.close(stmt);
			DatabaseConnection.close(conn);
		}catch(SQLException e){
			System.out.println("数据异常");
			e.printStackTrace();
		}
		return cols;
	}
	
}
