package com.yhj.util;

import java.awt.FlowLayout;

import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class PanelUtil {
	public static void addTextFieldsToPanel(JPanel parentPanel,boolean isEdit,int fieldWidth,String[]...infos){
		for(int i = 0;i<infos.length;i++){
			JLabel label = new JLabel(infos[i][0]);
			JTextField textfield = new JTextField(infos[i][1],fieldWidth);
			textfield.setEditable(isEdit);
			parentPanel.add(label,new FlowLayout(FlowLayout.LEFT));
			parentPanel.add(textfield,new FlowLayout(FlowLayout.CENTER));
		}
	}

}
