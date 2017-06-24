package com.yhj.dao;

import java.util.List;

import com.yhj.domain.CollegeBean;
import com.yhj.domain.TeacherBean;

public interface ICollegeDao {
	public List<CollegeBean> queryAllCollege();
}
