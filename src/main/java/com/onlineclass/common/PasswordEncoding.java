package com.onlineclass.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class PasswordEncoding extends HttpServletRequestWrapper{
	
	public PasswordEncoding(HttpServletRequest request) {
		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String orival = super.getParameter(name);
		if(name.equals("userPw")) {
			String encStr = getSHA512(orival);
			return encStr;
		}
		return orival;
	}
	
	private String getSHA512(String orival) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		byte[] orivalByte = orival.getBytes();
		md.update(orivalByte);
		byte[] encByte = md.digest();
		String encStr = Base64.getEncoder().encodeToString(encByte);
		return encStr;
	}
}
