package com.yhj.ui;

import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Shape;
import java.awt.geom.Ellipse2D;
import java.awt.geom.RoundRectangle2D;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;

import com.yhj.common.SoftConfig;



public class RoundRectButton extends JButton{
		 private int btnWidth,btnHeight;
		 private String btnStr;
		 private Shape shape;//用于保存按钮的形状,有助于侦听单击按钮事件
		 public RoundRectButton(String str,int width,int height){
			 this.btnWidth=width;
			 this.btnHeight=height;
			 this.btnStr=str;
		  //使jbutton不画背景
			 setContentAreaFilled(false);
		 }
		 
		 //画图的按钮的背景和标签
		 protected void paintComponent(Graphics g){
		 /*
		  * 获取按钮背景图片
		  */
		  Image default_image = new ImageIcon(this.getClass().getResource("default_button.png")).getImage();
		  Image hover_image = new ImageIcon(this.getClass().getResource("mousemoveon_button.png")).getImage();
		  Image press_image = new ImageIcon(this.getClass().getResource("mousepress_button.png")).getImage();
		  //如果点击
		  if(getModel().isArmed()){
		   g.setColor(new Color(225,255,255));
		   g.drawImage(press_image, 0, 0, btnWidth, btnHeight, this);
		  }
		  //如果滑过
		  else if(getModel().isRollover()){
		   g.setColor(new Color(240,255,240)); 
		   g.drawImage(hover_image, 0, 0, btnWidth, btnHeight, this);
		  }
		  else{
		   //其他事件用默认的背景色显示按钮
		  g.setColor(new Color(255,255,240));
		  g.drawImage(default_image, 0, 0, btnWidth, btnHeight, this);
		  }
		  //绘制圆角矩形中的文字,保证文字在图片中居中
		  g.drawString(btnStr, (btnWidth/2)-(btnStr.length()/2*this.getFont().getSize()), (btnHeight/2)+5);

//		  g.fillRoundRect(0, 0, 120, 60, 60, 60);
		  
		  //调用父类的paintComponent画按钮的标签和焦点所在的小矩形
		  super.paintComponents(g);
		 }
		 //用简单的弧充当按钮的边框
		 @Override
		 protected void paintBorder(Graphics g){
//		  g.setColor(new Color(255,255,240));
//		  Graphics2D graphics2 = (Graphics2D) g;
//		  graphics2.setStroke(SoftConfig.btnstroke);
//		  RoundRectangle2D roundedRectangle = new RoundRectangle2D.Float(-2, -2, btnWidth+3, btnHeight+3, 45, 45);
//		  graphics2.draw(roundedRectangle);
		 }
		 
		 //判断鼠标是否点在按钮上
		 
		 public boolean contains(int x,int y){
		  //如果按钮边框,位置发生改变,则产生一个新的形状对象
		  if((shape==null)||(!shape.getBounds().equals(getBounds()))){
		   //构造椭圆型对象
		   shape=new Ellipse2D.Float(0,0,getWidth(),getHeight());
		  }
		  //判断鼠标的x,y坐标是否落在按钮形状内
		  return shape.contains(x,y);
		 }
		 public static void main(String[] args){
			  JButton button=new RoundRectButton("点我",120,50);//产生一个圆形按钮
			  button.setFont(SoftConfig.mfont);
			  //产生一个框架显示这个按钮
			  JFrame frame=new JFrame("图形按钮");
			  frame.getContentPane().setBackground(Color.black);
			  frame.getContentPane().setLayout(new FlowLayout());
			  frame.setLayout(null);
			  button.setBounds(50, 50, 160,80);
			  frame.getContentPane().add(button);
			  frame.setSize(500,500);
			  frame.setVisible(true);
			  frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
			 }
}
