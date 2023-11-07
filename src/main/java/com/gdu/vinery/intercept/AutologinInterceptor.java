package com.gdu.vinery.intercept;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.util.WebUtils;

import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.mapper.UserMapper;

@Component
public class AutologinInterceptor implements HandlerInterceptor {
	
	// �α����� �� �� �����̰�,
	  // ��Ű�� autologinId ���� �����ϴ� ��쿡
	  // �ڵ� �α����� �����ϴ� ���ͼ���
	  
	  @Autowired
	  private UserMapper userMapper;
	  
	  @Override
	  public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

	    HttpSession session = request.getSession();
	    
	    if(session != null && session.getAttribute("loginId") == null) {  // �α����� �Ǿ� �ִ°�?
	      
	      Cookie cookie = WebUtils.getCookie(request, "userAutologinId");	// �ش� ��Ű �ڵ尡������ �ڵ�
	      
	      if(cookie != null) {  // ��Ű userAutologinId�� �����ϴ°�?
	        
	        String userAutologinId = cookie.getValue();
	        UserDTO loginUserDTO = userMapper.selectAutologin(userAutologinId);
	        if(loginUserDTO != null) {
	          session.setAttribute("loginId", loginUserDTO.getUserId());
	        }
	        
	      }
	      
	    }
	    
	    return true;  // ���ͼ��͸� ���� ��Ų �� ��Ʈ�ѷ��� ��� ���۽�Ų��.
	    
	  }

}
