package com.yhj.util;

import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Iterator;

import javax.imageio.ImageIO;
import javax.imageio.ImageReadParam;
import javax.imageio.ImageReader;
import javax.imageio.stream.ImageInputStream;

/**
 * ClassName: FileUtil 
 * @Description: 截图和拷贝
 * @author wangsuqi
 * @date 2016年6月11日
 * @see 
 */
public class FileUtil {
	public static void FileCopy(String oldFile, String newfile) {
		FileInputStream fis = null;
		FileOutputStream fos = null;
		try {
			fis = new FileInputStream(oldFile);
			fos = new FileOutputStream(newfile);
			int l = -1;
			byte[] b = new byte[1024];
			while ((l = fis.read(b)) != -1) {
				fos.write(b, 0, l);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (fos != null) {
					fos.flush();
					fos.close();
				}
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				;
			}
		}
	}
}
