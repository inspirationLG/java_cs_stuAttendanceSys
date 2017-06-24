package com.yhj.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;

import com.yhj.common.SoftConfig;
import com.yhj.dao.IStuDao;
import com.yhj.dao.StuDaoImpl;
import com.yhj.domain.StudentBean;
import com.yhj.util.FrameUtil;
import com.yhj.util.ImageIconUtil;
import com.yhj.util.PanelUtil;

public class StuInfoFrame extends JFrame{
	private JButton updateInfoButton = new JButton("修改基本信息"),
			returnButton = new JButton("返回主菜单");
	private IStuDao stuDao = new StuDaoImpl(); 
	public StuInfoFrame(String stu_id) {
		// TODO Auto-generated constructor stub
		setBounds(SoftConfig.screenWidth/5,SoftConfig.screenHeight/5, 350, 350);
		InfoPanel infopanel = new InfoPanel(stu_id);
		FrameUtil.baseSetFrame(this,"学生个人信息", infopanel);	
	}
	private class InfoPanel extends JPanel{
		private JPanel textInfoPanel=new JPanel(),photoPanel=new JPanel(),buttonPanel = new JPanel();
		private JLabel tipLabel = new JLabel("个人照片"),photoLabel = new JLabel();
		public InfoPanel(String stu_id){
			setLayout(null);
			StudentBean stu =new StudentBean();
			stu = stuDao.queryStuById(stu_id);
			String[] str1= {"学生姓名",stu.getStu_name()};
			String[] str2= {"学生学号",stu.getStu_id()};
			String[] str3= {"所属学院",stu.getCollege_name()};
			String[] str4= {"所属专业",stu.getFaculty_name()};
			String[] str5= {"电子邮箱",stu.getStu_email()};
			PanelUtil.addTextFieldsToPanel(textInfoPanel, false,13,str1,str2,str3,str4,str5);
			textInfoPanel.setBounds(0, 0, 160, 250);
			photoLabel.setSize(165,200);
			System.out.println(stu.getStu_photo());
//			photoLabel.setIcon(ImageIconUtil.setImageIcon("F:/j2eeworkplace/GUI/src/photos/"+stu.getStu_photo(), photoLabel));
			photoLabel.setIcon(ImageIconUtil.setImageIcon("/photos/"+stu.getStu_photo(), photoLabel));
			photoPanel.add(tipLabel);
			photoPanel.add(photoLabel);
			photoPanel.setBounds(170,0,165,250);
			updateInfoButton.addActionListener(new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					StuInfoFrame.this.dispose();
					UpdateInfoFrame stupdateinfof = new UpdateInfoFrame(stu_id,StuInfoFrame.class);
					StuInfoFrame.this.setVisible(false);
				}
			});
			buttonPanel.add(updateInfoButton);
			returnButton.addActionListener(new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					StuInfoFrame.this.dispose();
					new StuMainFrame(stu_id);
				}
			});
			buttonPanel.add(returnButton);
			buttonPanel.setBounds(0,270,350,40);
			add(textInfoPanel);
			add(photoPanel);
			add(buttonPanel);
		}
	}
	public static void main(String[] args){
		new StuInfoFrame("122");
	}
}
