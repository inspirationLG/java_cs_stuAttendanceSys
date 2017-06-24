package com.yhj.util;

import java.awt.Image;
import java.awt.Toolkit;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JLabel;

import com.yhj.common.SoftConfig;

public class ImageIconUtil {
	public static ImageIcon setImageIcon(String imgpath,JLabel label){
		ImageIcon img=new ImageIcon(label.getClass().getResource(imgpath));
		img.setImage(img.getImage().getScaledInstance(label.getWidth(), label.getHeight(), Image.SCALE_DEFAULT));
		/*if(imgpath.split(":/").length>1){
			img.setImage(Toolkit.getDefaultToolkit().getImage(imgpath).getScaledInstance(label.getWidth(), label.getHeight(), Image.SCALE_DEFAULT));
		}
		else{
			System.out.println("使用相对路径");
			img.setImage(Toolkit.getDefaultToolkit().getImage(ImageIconUtil.class.getClassLoader().getResource(imgpath)).getScaledInstance(label.getWidth(), label.getHeight(), Image.SCALE_DEFAULT));
		}*/
		return img;
	}
	public static ImageIcon setBtImageIcon(String imgpath,JButton button,int iconWidth,int iconHeight){
		ImageIcon img = new ImageIcon(button.getClass().getResource(imgpath));
		img.setImage(img.getImage().getScaledInstance(iconWidth, iconHeight, Image.SCALE_DEFAULT));
		return img;
	}

}
