package com.yhj.dao;

import java.util.List;

import com.yhj.domain.FacultyBean;

public interface IFacultyDao {
	public List<FacultyBean> queryFacultByCollege(String college_name);
}
