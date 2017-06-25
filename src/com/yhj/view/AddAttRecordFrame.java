package com.yhj.view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.UUID;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.Border;

import com.yhj.common.SoftConfig;
import com.yhj.dao.IRecordDao;
import com.yhj.dao.IStuDao;
import com.yhj.dao.ITeacherDao;
import com.yhj.dao.RecordDaoImpl;
import com.yhj.dao.StuDaoImpl;
import com.yhj.dao.TeacherDaoImpl;
import com.yhj.domain.AttendanceBean;
import com.yhj.domain.StudentBean;
import com.yhj.ui.DateChooser;
import com.yhj.util.FrameUtil;
import com.yhj.util.ImageIconUtil;

public class AddAttRecordFrame extends JFrame {
	private IRecordDao recordDao = new RecordDaoImpl();
	private JButton okButton = new JButton("确认"),closeButton = new JButton("关闭");
	private JComboBox<String> selectStatu=new JComboBox<>();
	private JLabel l0 = new JLabel("学生学号"),l1 = new JLabel("学生姓名"),l2 = new JLabel("课程编号"),l3 = new JLabel("考勤时间"),l4 = new JLabel("考勤类别");
	private JTextField f0=new JTextField(15),f1=new JTextField(15),f2=new JTextField(15);
	private DateChooser dateChooser=new DateChooser();
	JFrame parentFrame;
	public AddAttRecordFrame(String sid,String claid,StudentBean stu){
		setBounds(SoftConfig.screenWidth/5,SoftConfig.screenHeight/5, 200, 320);
		JPanel content = new ContentPanel(sid,claid,stu);
		FrameUtil.baseSetFrame(this, "添加考勤", content);
	}
	private class ContentPanel extends JPanel{
		private JPanel jp1 = new JPanel(),jp2 = new JPanel();
		public ContentPanel(String sid,String claid,StudentBean stu){
			setLayout(new BorderLayout());
			f0.setText(stu.getStu_id());
			f1.setText(stu.getStu_name());
			f2.setText(claid);
			f0.setEditable(false);
			f1.setEditable(false);
			f2.setEditable(false);
			jp1.add(l0,new FlowLayout(FlowLayout.LEFT));
			jp1.add(f0, new FlowLayout(FlowLayout.LEFT));
			jp1.add(l1,new FlowLayout(FlowLayout.LEFT));
			jp1.add(f1, new FlowLayout(FlowLayout.LEFT));
			jp1.add(l2,new FlowLayout(FlowLayout.LEFT));
			jp1.add(f2, new FlowLayout(FlowLayout.LEFT));
			jp1.add(l3, new FlowLayout(FlowLayout.LEFT));
			jp1.add(dateChooser, new FlowLayout(FlowLayout.LEFT));
			jp1.add(l4, new FlowLayout(FlowLayout.LEFT));
			String[] items={"正常","迟到","旷课","早退","请假"};
			for(String item:items){
				selectStatu.addItem(item);
			}
			jp1.add(selectStatu, new FlowLayout(FlowLayout.LEFT));
			jp1.setBorder(BorderFactory.createTitledBorder(BorderFactory.createMatteBorder(2, 2, 2, 2, Color.black), "为"+stu.getStu_name()+"添加考勤记录"));
			okButton.setIcon(ImageIconUtil.setBtImageIcon("/images/check.png", okButton,22,22));
			okButton.addActionListener(new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					/*
					 * 添加考勤数据
					 */
					byte recordstatus=SoftConfig.StrToByte(selectStatu.getSelectedItem().toString().trim());
					AttendanceBean att=new AttendanceBean();
					att.setAtt_id(UUID.randomUUID().toString());
					att.setSelectcourse_id(sid);
					att.setRecordtime(dateChooser.getDateText().trim());
					att.setRecordstatus(recordstatus);
					if(recordDao.insertAtt(att)!=0){
						JOptionPane.showMessageDialog(null, "添加成功","提示",JOptionPane.INFORMATION_MESSAGE);
					}
					else{
						JOptionPane.showMessageDialog(null, "操作失败","提示",JOptionPane.ERROR_MESSAGE);
					}
				}
			});
			jp2.add(okButton);
			closeButton.setIcon(ImageIconUtil.setBtImageIcon("/images/error.png", closeButton,26,26));
			closeButton.addActionListener(new ActionListener() {
				
				@Override
				public void actionPerformed(ActionEvent e) {
					AddAttRecordFrame.this.dispose();
				}
			});
			jp2.add(closeButton);
			add(jp1,BorderLayout.CENTER);
			add(jp2,BorderLayout.SOUTH);
		}
	}

}
