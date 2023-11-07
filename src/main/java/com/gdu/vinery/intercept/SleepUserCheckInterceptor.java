package com.gdu.vinery.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.gdu.vinery.domain.SleepUserDTO;
import com.gdu.vinery.mapper.UserMapper;

@Component
public class SleepUserCheckInterceptor implements HandlerInterceptor {
	
		// �α��� ������
		// �޸� ȸ������ Ȯ���ؼ� �޸����� ȭ������ �̵���Ű�� ���ͼ���
		
		@Autowired
		private UserMapper userMapper;
		
		@Override
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			
			// �α����� ���ؼ� ����ڰ� �Է��� ���̵�
			String userId = request.getParameter("userId");
			
			// �ش� ���̵� �޸� ���̺� �ִ��� Ȯ��
			SleepUserDTO sleepUserDTO = userMapper.selectSleepUserById(userId);
			
			// �޸� ���̺� ������ �ִٸ� �޸�����ȭ��(/user/wakeup.form)���� �̵�
			if(sleepUserDTO != null) {
				
				// session�� sleepUserId�� �÷� ������ wakeup.jsp���� �޸�ȸ���� ���̵� Ȯ���� �� �ִ�.
				HttpSession session = request.getSession();
				session.setAttribute("sleepUserId", userId);
				
				// ���� �̱��� Ȯ���ϰ� ó���ϱ�!
				// ���� �̱��� Ȯ���ϰ� ó���ϱ�!
				// ���� �̱��� Ȯ���ϰ� ó���ϱ�!
				// ���� �̱��� Ȯ���ϰ� ó���ϱ�!
				response.sendRedirect(request.getContextPath() + "/user/wakeup.form");
				return false;	// ��Ʈ�� ���� ���ϴ�.
			}
			
			return true;	// ��Ʈ�� ����!
		}

}
