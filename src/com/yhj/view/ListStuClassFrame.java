package com.yhj.view;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import com.yhj.common.SoftConfig;
import com.yhj.dao.ClassDaoImpl;
import com.yhj.dao.IClassDao;
import com.yhj.domain.ClassBean;
import com.yhj.ui.ListInfoPanel;
import com.yhj.util.FrameUtil;

public class ListStuClassFrame extends JFrame {
	private IClassDao claDao = new ClassDaoImpl();
	public ListStuClassFrame(String stu_id,JFrame prentframe){ 
		setBounds(SoftConfig.screenWidth/5,SoftConfig.screenHeight/5, 480, 550);
		/**
		 * 定义课表的表单
		 */
		JTable listInfo;
		TableModel tableModel;
		String[] columns={"课程编号","课程名称","教师编号","开始周数","结束周数","上课时间"};
		List<ClassBean> clas = new ArrayList<>();
		clas = claDao.queryClassForStu(stu_id);
		Object[][] datas = new Object[clas.size()][6];
		for(int i = 0;i<clas.size();i++){
			datas[i][0] = clas.get(i).getClass_id();
			datas[i][1] = clas.get(i).getCourse_name();
			datas[i][2] = clas.get(i).getTeacher_id();
			datas[i][3] = clas.get(i).getClass_start_week();
			datas[i][4] = clas.get(i).getClass_end_week();
			datas[i][5] = clas.get(i).getClass_time();
		}
		tableModel=new DefaultTableModel(datas,columns);
		listInfo = new JTable(tableModel);
		listInfo.setRowHeight(20);
		listInfo.setEnabled(false);
		FrameUtil.baseSetFrame(this,"已选择的课程",new ListInfoPanel<ListStuClassFrame>(listInfo,prentframe,ListStuClassFrame.this));
	}
}

