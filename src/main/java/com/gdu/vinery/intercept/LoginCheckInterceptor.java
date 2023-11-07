package com.gdu.vinery.intercept;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginCheckInterceptor implements HandlerInterceptor {
	
	// �α��� ���θ� Ȯ���ؼ� �α����� �Ǿ� ���� ������ �α��� �������� �̵���Ű�� ���ͼ��� 
	
		@Override	// preHandle : ����
		public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
			
			HttpSession session = request.getSession();
			
			// �α��� ���� Ȯ��
			if(session != null && session.getAttribute("loginId") == null) {
				
				// ����
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("if(confirm('�α����� �ʿ��� ����Դϴ�. �α����Ͻðڽ��ϱ�?')){");
				out.println("location.href='"+ request.getContextPath()+"/users/login.form';");
				out.println("} else {");
				out.println("history.back();");
				out.println("}");
				out.println("</script>");
				out.flush();
				out.close();
				
				return false; // ��Ʈ�ѷ��� ��û�� ó������ �ʴ´�.
				
			}

			
			return true; // ��Ʈ�ѷ��� ��û�� ó���ȴ�. 
		}

}
