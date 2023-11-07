package com.gdu.vinery.util;

import java.security.MessageDigest;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.stereotype.Component;

@Component
public class UserSecurityUtil {
	
	// ũ�ν� ����Ʈ ��ũ����(Cross Site Scripting) �����ϱ�(�Խñ۾ȿ� html�±׸� �̿��� history.back���� �ȵ����°� ����)
		public String preventXSS(String str) {
			str = str.replace("<", "&lt;");
			str = str.replace(">", "&gt;");
			return str;
		}
		
		// �����ڵ� ��ȯ�ϱ�
		public String getRandomString(int count, boolean letters, boolean numbers) {
			return RandomStringUtils.random(count, letters, numbers);
		}
		
		// SHA-256 ��ȣȭ�ϱ�
		/*
		 	1. �Է� ���� 256��Ʈ(32����Ʈ) ��ȣȭ ó���ϴ� �ؽ� �˰����̴�.
		 	2. ��ȣȭ�� ���������� ��ȣȭ�� �Ұ����� �˰����̴�.
		 	3. ��ȣȭ�� ����� �����ϱ� ���� 32����Ʈ byte �迭�� �ʿ��ϴ�.
		 	4. 1����Ʈ -> 16������ ��ȯ�ؼ� ��ȣȭ�� ���ڿ��� �����. (1����Ʈ�� 16���� 2�� ���ڷ� ��ȯ�ȴ�.)
		 	5. 32����Ʈ -> 16������ ��ȯ�ϸ� 64���ڰ� �����ȴ�. (DB Į���� ũ�⸦ VARCHAR2(64 BYTE)�� �����Ѵ�.)
		 	6. java.security ��Ű���� �̿��Ѵ�.
		*/
		public String getSha256(String str) {
			MessageDigest messageDigest = null;
			try {
				messageDigest = MessageDigest.getInstance("SHA-256");
				messageDigest.update(str.getBytes());
			}catch(Exception e) {
				e.printStackTrace();
			}
			byte[] b = messageDigest.digest();	// ��ȣȭ�� 32����Ʈ ũ���� byte �迭 b�� �����ȴ�.
			StringBuilder sb = new StringBuilder();
			for(int i = 0; i < b.length; i++) {
				sb.append(String.format("%2X", b[i]));	// %X : 16������ �ǹ�, %2X : 2�ڸ��� 16������ �ǹ�
			}
			return sb.toString();
		}

}
