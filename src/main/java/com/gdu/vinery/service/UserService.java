package com.gdu.vinery.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdu.vinery.domain.UserDTO;

public interface UserService {
	
	public Map<String, Object> verifyId(String userId);									// ���̵� �ߺ� üũ ajax
	public Map<String, Object> verifyEmail(String userEmail);							// �̸��� �ߺ� üũ ajax
	public Map<String, Object> sendAuthCode(String userEmail);							// �̸��Ϸ� ������ȣ�� ������ ajax			
	public void join(HttpServletRequest request, HttpServletResponse response);			// ȸ������
	public void login(HttpServletRequest request, HttpServletResponse response);		// �α���
	public void autoLogin(HttpServletRequest request, HttpServletResponse response);	// �ڵ� �α���
	public void logout(HttpServletRequest request, HttpServletResponse response);		// �α׾ƿ�
	public void leave(HttpServletRequest request, HttpServletResponse response);		// ȸ��Ż��
	public Map<String, Object> findUser(UserDTO userDTO);                        // 아이디 찾기
}
