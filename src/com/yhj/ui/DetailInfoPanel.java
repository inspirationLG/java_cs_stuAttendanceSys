package com.yhj.ui;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.JPanel;

import com.yhj.common.BackgroundImagePanel;
import com.yhj.common.SoftConfig;
import com.yhj.dao.IRecordDao;
import com.yhj.domain.StudentBean;
import com.yhj.util.ImageIconUtil;
import com.yhj.view.AddAttRecordFrame;

public class DetailInfoPanel extends BackgroundImagePanel {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -7751746919597494909L;
	private JLabel photoLabel = new JLabel(),nameLabel,idLabel,collegeLabel;
	private JButton addAttBtn = new RoundRectButton("考勤",55,28);
//	private Image image= Toolkit.getDefaultToolkit().getImage("F:/j2eeworkplace/GUI/src/images/background.png");
	public DetailInfoPanel(IRecordDao recordDao,String claId,StudentBean stu){
		super(SoftConfig.panel_bgimg1);
		setLayout(null);
		photoLabel.setSize(50,50);
		
		if(stu.getStu_photo()==null||stu.getStu_photo().trim().equals("")){
			photoLabel.setIcon(ImageIconUtil.setImageIcon("images/Portrait.png", photoLabel));
		}else{
//			photoLabel.setIcon(ImageIconUtil.setImageIcon("F:/j2eeworkplace/GUI/src/photos/"+stu.getStu_photo(), photoLabel));
			photoLabel.setIcon(ImageIconUtil.setImageIcon("/photos/"+stu.getStu_photo(), photoLabel));
		}
		photoLabel.setBounds(3,3,50,72);
		add(photoLabel);
		nameLabel=new JLabel(stu.getStu_name());
		nameLabel.setBounds(53,13,60,20);
		nameLabel.setFont(SoftConfig.font);
		idLabel=new JLabel("学号:"+stu.getStu_id());
		idLabel.setBounds(8,65,92,20);
		add(nameLabel);
		add(idLabel);
		addAttBtn.setIcon(ImageIconUtil.setBtImageIcon("/images/Fingerprint.png", addAttBtn,22,22));
		addAttBtn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				String sid=recordDao.qureySid(claId, stu.getStu_id());
				new AddAttRecordFrame(sid, claId, stu);
			}
		});
		addAttBtn.setBounds(58,40, 55,28);
		add(addAttBtn);
		this.setBorder(SoftConfig.shadowborder);
	}
}
