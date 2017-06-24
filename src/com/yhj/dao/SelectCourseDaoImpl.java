package com.yhj.dao;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.yhj.common.BaseDao;
import com.yhj.common.BaseEntity;
import com.yhj.domain.SelectcourseBean;

public class SelectCourseDaoImpl extends BaseDao<SelectcourseBean> {
	public int insertSelectCourse(SelectcourseBean scb){
		try {
			super.insert(scb, "selectcourse");
		} catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public List<SelectcourseBean> querySCbyStuId(String StuId){
		String querySql="select * from selectcourse where stu_id = ? ";
		List<SelectcourseBean> scbs=new ArrayList<>();
		try {
			List<BaseEntity> bases=super.queryItemsId(StuId, querySql, SelectcourseBean.class);
			for(BaseEntity base:bases){
				scbs.add((SelectcourseBean) base);
			}
		} catch (NoSuchMethodException | SecurityException | InstantiationException | IllegalAccessException
				| IllegalArgumentException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return scbs;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		SelectCourseDaoImpl scDao=new SelectCourseDaoImpl();
		for(int i=0;i<100;i++){
			SelectcourseBean scb=new SelectcourseBean();
			scb.setSelectcourse_id(UUID.randomUUID().toString());
			scb.setClass_id("222");
			scb.setStu_id("2016"+i);
			scDao.insertSelectCourse(scb);
		}
	}

}
