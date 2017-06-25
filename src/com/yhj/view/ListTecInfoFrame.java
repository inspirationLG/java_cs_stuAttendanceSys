package com.yhj.view;

import java.util.ArrayList;
import java.util.List;

import javax.swing.JFrame;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableModel;

import com.yhj.common.SoftConfig;
import com.yhj.dao.ITeacherDao;
import com.yhj.dao.TeacherDaoImpl;
import com.yhj.domain.TeacherBean;
import com.yhj.ui.ListInfoPanel;
import com.yhj.util.FrameUtil;

public class ListTecInfoFrame extends JFrame {
	private ITeacherDao teacherDao = new TeacherDaoImpl();	 
	public ListTecInfoFrame(JFrame parentFrame){ 
		setBounds(SoftConfig.screenWidth/5,SoftConfig.screenHeight/5, 480, 550);
		JTable listInfo;
		TableModel tableModel;
		String[] columns={"教师姓名","任课课程","所属学院"};
		List<Object> objs = new ArrayList<>();
		objs = teacherDao.queryAllTeacher();
		Object[][] datas = new Object[objs.size()/2][3];
		int j=0;
		for(int i = 0;i<objs.size();i+=2){
			List<String> clas = new ArrayList<>();
			TeacherBean tea = (TeacherBean)objs.get(i);
			clas = (List<String>) objs.get(i+1);
			datas[j][0]=tea.getTeacher_name();
			if(clas.size()==0)datas[j][i]="";
			else{datas[j][1]=clas;}
			datas[j][2]=tea.getFaculty_name();
			j++;
		}
		tableModel=new DefaultTableModel(datas,columns);
		listInfo = new JTable(tableModel);
		listInfo.setRowHeight(20);
		listInfo.setEnabled(false);
		ListInfoPanel<ListTecInfoFrame> listecp=new ListInfoPanel<ListTecInfoFrame>(listInfo, parentFrame, ListTecInfoFrame.this);
		FrameUtil.baseSetFrame(this,"所有教师资料",listecp);
	}

}
