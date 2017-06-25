package com.yhj.util;

import java.awt.Font;
import java.awt.Image;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;


public class FrameUtil{
public static void baseSetFrame(JFrame frame,String title,JPanel...components){
	    if(components!=null){
		    for(JPanel jp : components){
		    	 frame.add(jp);
		    }
	    }
	    frame.setTitle(title);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		Image img = new ImageIcon(frame.getClass().getResource("/images/frametitle.png")).getImage();
		frame.setIconImage(img);
		frame.setResizable(false);
		frame.setVisible(true);
	}
/**
 * @Description: 添加圆角按钮
 * @param @param panel
 * @param @param bta
 * @param @param btns   
 * @return void  
 * @throws
 * @author wangsuqi
 * @date 2016年9月5日
 */
public static void baseSetBtn(JPanel panel,ActionListener bta,int alignmentH,int btnWidth,int btnHeight,Font btnFont,JButton...btns){
	panel.setLayout(null);
	int i=0;
	for(JButton btn:btns){
		btn.setSize(btnWidth, btnHeight);
		btn.setFont(btnFont);
		btn.setBounds((panel.getWidth()/2)-(btnWidth/2), i*(btnHeight+alignmentH)+5, btnWidth, btnHeight);
		btn.addActionListener(bta);
		panel.add(btn);
		i++;
	}
	
  }

}
