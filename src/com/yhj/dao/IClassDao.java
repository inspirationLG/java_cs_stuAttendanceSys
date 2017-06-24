package com.yhj.dao;

import java.util.List;

import com.yhj.domain.ClassBean;

public interface IClassDao {
	public List<ClassBean> queryClassForStu(String stu_id);
	public List<ClassBean> queryClassForTeacher(String tech_id);
	public ClassBean queryClassByID(String cla_id);
}
