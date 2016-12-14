/*
 * Copyright (c) 2015 Messcat. All rights reserved.
 * 
 */
package com.ace.common.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

/**
 * @author Microcat
 * @version 1.0
 */
public class SerializeUtil {

	public static byte[] serialize(Object object) {
		if(object != null){
			ObjectOutputStream oos = null;
			ByteArrayOutputStream baos = null;

			try {

				// 序列化
				baos = new ByteArrayOutputStream();
				oos = new ObjectOutputStream(baos);
				oos.writeObject(object);
				byte[] bytes = baos.toByteArray();
				return bytes;
			} catch (Exception e) {
				System.err.println(e);
			}
		}
		return null;
	}

	public static Object unserialize(byte[] bytes) {
		if(bytes != null){
			ByteArrayInputStream bais = null;
			try {

				// 反序列化
				bais = new ByteArrayInputStream(bytes);
				ObjectInputStream ois = new ObjectInputStream(bais);
				return ois.readObject();
			} catch (Exception e) {
				System.err.println(e);
			}
		}
		return null;
	}
}