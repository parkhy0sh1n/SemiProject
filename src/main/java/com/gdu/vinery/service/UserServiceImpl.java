package com.gdu.vinery.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.vinery.domain.LeaveUserDTO;
import com.gdu.vinery.domain.UserDTO;
import com.gdu.vinery.mapper.UserMapper;
import com.gdu.vinery.util.UserJavaMailUtil;
import com.gdu.vinery.util.UserSecurityUtil;

import lombok.AllArgsConstructor;

@AllArgsConstructor		// field占쏙옙 @Autowired 처占쏙옙占쏙옙 占쏙옙占쌔쇽옙
@Service
public class UserServiceImpl implements UserService {
	
	
	private UserMapper userMapper;
	private UserJavaMailUtil userJavaMailUtil;
	private UserSecurityUtil userSecurityUtil;
	 
	
	@Override
	public Map<String, Object> verifyId(String userId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enableId", userMapper.selectUserById(userId) == null && userMapper.selectSleepUserById(userId) == null && userMapper.selectLeaveUserById(userId) == null);
		return map;
	}
	
	@Override
	public Map<String, Object> verifyEmail(String userEmail) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enableEmail", userMapper.selectUserByEmail(userEmail) == null && userMapper.selectSleepUserByEmail(userEmail) == null && userMapper.selectLeaveUserByEmail(userEmail) == null);
		return map;
	}
	
	@Override
	public Map<String, Object> sendAuthCode(String userEmail) {
		
		// 占쏙옙占쏙옙悶占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌘듸옙 6占쌘몌옙
		String authCode = userSecurityUtil.getRandomString(6, true, true);	// 6占쌘몌옙, 占쏙옙占쌘삼옙占�, 占쏙옙占쌘삼옙占�
		
		// 占쏙옙占쏙옙悶占쏙옙占� 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
		userJavaMailUtil.sendJavaMail(userEmail, "[占쏙옙占쏙옙占쏙옙] 占쏙옙占쏙옙占쏙옙청", "占쏙옙占쏙옙占쏙옙호占쏙옙 <strong>" + authCode + "</strong>占쌉니댐옙.");
		
		// 占쏙옙占쏙옙悶占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쌘드를 join.jsp占쏙옙 占쏙옙占쏙옙
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("authCode", authCode);
		
		return map;
		
	}
	
	
	@Override
		public void join(HttpServletRequest request, HttpServletResponse response) {
		
			// 占쏙옙청 占식띰옙占쏙옙占�
			String userName = request.getParameter("userName");
			String userBirth = request.getParameter("userBirth");
			String userGender = request.getParameter("userGender");
			String userTel = request.getParameter("userTel");
			String userId = request.getParameter("userId");
			String userPw = request.getParameter("userPw");
			String userEmail = request.getParameter("userEmail");
			String userPost = request.getParameter("userPost");
			String userRoadAddress = request.getParameter("userRoadAddress");
			String userJibunAddress = request.getParameter("userJibunAddress");
			String userDetailAddress = request.getParameter("userDetailAddress");
			String userExtraAddress = request.getParameter("userExtraAddress");
			
			String location = request.getParameter("location");
			String event = request.getParameter("event");
			
			// 占쏙옙橘占싫� SHA-256 占쏙옙호화
			userPw = userSecurityUtil.getSha256(userPw);
			
			// 占싱몌옙 XSS 처占쏙옙
			userName = userSecurityUtil.preventXSS(userName);
			
			// 占쏙옙占쌍쇽옙 XSS 처占쏙옙
			userDetailAddress = userSecurityUtil.preventXSS(userDetailAddress);
			
			// 占쏙옙占쏙옙占쌓몌옙 XSS 처占쏙옙
			userExtraAddress = userSecurityUtil.preventXSS(userExtraAddress);
			
			// agreecode
			int userAgreecode = 0;
			if(location.isEmpty() == false && event.isEmpty() == false) {
				userAgreecode = 3;
			}else if(location.isEmpty() && event.isEmpty() == false) {
				userAgreecode = 2;
			}else if(location.isEmpty() == false && event.isEmpty()) {
				userAgreecode = 1;
			}
			
			
			// UserDTO 占쏙옙占쏙옙占�
			UserDTO userDTO = new UserDTO();
			userDTO.setUserName(userName);
			userDTO.setUserBirth(userBirth);
			userDTO.setUserGender(userGender);
			userDTO.setUserTel(userTel);
			userDTO.setUserId(userId);
			userDTO.setUserPw(userPw);
			userDTO.setUserEmail(userEmail);
			userDTO.setUserPost(userPost);
			userDTO.setUserRoadAddress(userRoadAddress);
			userDTO.setUserJibunAddress(userJibunAddress);
			userDTO.setUserDetailAddress(userDetailAddress);
			userDTO.setUserExtraAddress(userExtraAddress);
			userDTO.setUserAgreecode(userAgreecode);
			userDTO.setUserState(1);
			
			// 회占쏙옙占쏙옙占쏙옙(UserDTO占쏙옙 DB占쏙옙 占쏙옙占쏙옙占쏙옙)
			int joinResult = userMapper.insertUser(userDTO);
			
			// 占쏙옙占쏙옙
			try {
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				if(joinResult == 1) {
					out.println("alert('회占쏙옙 占쏙옙占쌉되억옙占쏙옙占싹댐옙.');");
					out.println("location.href='" + request.getContextPath() + "/users/index.page';");	// 占싸깍옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쌕댐옙 占쏙옙!
				}else {
					out.println("alert('회占쏙옙 占쏙옙占쌉울옙 占쏙옙占쏙옙占쌩쏙옙占싹댐옙.');");
					out.println("history.go(-2);");	// 2占쌤곤옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占� 占쏙옙!
				}
				out.println("</script>");
				out.flush();
				out.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	
	
	@Override
	public void login(HttpServletRequest request, HttpServletResponse response) {
		
		// 占쏙옙청 占식띰옙占쏙옙占�
		String url = request.getParameter("url");	// 占싸깍옙占쏙옙 화占쏙옙占쏙옙 占쏙옙占쏙옙 占쌍쇽옙(占싸깍옙占쏙옙 占쏙옙 占실듸옙占싣곤옙 占쌍쇽옙)sy
		String userId = request.getParameter("userId");	
		String userPw = request.getParameter("userPw");	
		
		if(userPw.equals("1111")) {
	         System.out.println("관리자가 로그인 했습니다.");
	      }else {
	         // 비밀번호 SHA-256 암호화
	         userPw = userSecurityUtil.getSha256(userPw);
	      }
		
		// UserDTO 占쏙옙占쏙옙占�
		UserDTO userDTO = new UserDTO();
		userDTO.setUserId(userId);
		userDTO.setUserPw(userPw);
		
		
		// DB占쏙옙占쏙옙 UserDTO 占쏙옙회占싹깍옙
		UserDTO loginUserDTO = userMapper.selectUserByUserDTO(userDTO);
		
		
		
		// ID, PW占쏙옙 占쏙옙치占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙 占쏙옙占쏙옙
		// 0. 占쌘듸옙 占싸깍옙占쏙옙 처占쏙옙占싹깍옙(autoLogin 占쌨소드에 占시깍옙占�)
		// 1. session占쏙옙 ID 占쏙옙占쏙옙占싹깍옙
		// 2. 회占쏙옙 占쏙옙占쏙옙 占쏙옙占� 占쏙옙占쏙옙占�
		// 3. 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占싹깍옙
		if(loginUserDTO != null) {
			
			// 占쌘듸옙 占싸깍옙占쏙옙 처占쏙옙占쏙옙 占쏙옙占쏙옙 autoLogin 占쌨소듸옙 호占쏙옙占싹깍옙
			autoLogin(request, response);
			
			HttpSession session = request.getSession();
			session.setAttribute("loginId", userId);
			
			int updateResult = userMapper.updateUserAccess(userId);
			if(updateResult == 0) {
				userMapper.insertUserAccess(userId);
			}
			
			try {
				if(userId.equalsIgnoreCase("admin")) {
					response.sendRedirect(request.getContextPath() + "/admin/prodList.page");
				} else {
					response.sendRedirect(request.getContextPath() + "/main");
				}				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		} else {
			// ID, PW占쏙옙 占쏙옙치占싹댐옙 회占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙 占쏙옙占쏙옙
			
			// 占쏙옙占쏙옙
			try {
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('占쏙옙치占싹댐옙 회占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싹댐옙.');");
				out.println("location.href='" + request.getContextPath() + "/main';");
				out.println("</script>");
				out.flush();
				out.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	@Override
	public void autoLogin(HttpServletRequest request, HttpServletResponse response) {
		
		/*
	 	占쌘듸옙 占싸깍옙占쏙옙 처占쏙옙占싹깍옙
	 	
	 	1. 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 체크占쏙옙 占쏙옙占�
	 		1) session占쏙옙 id占쏙옙 DB占쏙옙 AUTOLOGIN_ID 칼占쏙옙占쏙옙 占쏙옙占쏙옙占싼댐옙. (占쌩븝옙占쏙옙 占쏙옙占쏙옙, 占쌕몌옙 占쏙옙占쏙옙占� 占싯깍옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占싱울옙占쌔쇽옙 占쌘듸옙 占싸깍옙占싸울옙占쏙옙 占쏙옙占쏙옙占� ID占쏙옙 占쏙옙占쏙옙占싼댐옙.)
	 		2) 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占썩간(占쏙옙占쏙옙 : 15占쏙옙)占쏙옙 DB占쏙옙 AUTOLOGIN_EXPIRED_AT 칼占쏙옙占쏙옙 占쏙옙占쏙옙占싼댐옙.
	 		3) session占쏙옙 id占쏙옙 占쏙옙키占쏙옙 占쏙옙占쏙옙占싼댐옙. (占쏙옙키 : 占쏙옙 占쏙옙占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙풔占� 占쏙옙占쏙옙)
	 			占쏙옙 占쏙옙 占쏙옙키占쏙옙 占쏙옙占쏙옙 占시곤옙占쏙옙 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占썩간占쏙옙 占쏙옙占쏙옙占싹곤옙 占쏙옙占쏙옙占�.
	 	
	 	2. 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 체크占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占�
	 		1) DB占쏙옙 占쏙옙占쏙옙占� AUTOLOGIN_ID 칼占쏙옙占쏙옙 AUTOLOGIN_EXPIRED_AT 칼占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싼댐옙.(NULL 占쏙옙占쏙옙占쏙옙 처占쏙옙?)
	 		2) 占쏙옙키占쏙옙 占쏙옙占쏙옙占싼댐옙.
		*/
	
		// 占쏙옙청 占식띰옙占쏙옙占�
		String userId = request.getParameter("userId");
		String chkAutoLogin = request.getParameter("chkAutologin");
		
		
		// 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 체크占쏙옙 占쏙옙占�
		if(chkAutoLogin != null) {
			
			// session占쏙옙 id占쏙옙 占쏙옙占쏙옙占승댐옙.
			HttpSession session = request.getSession();
			String sessionId = session.getId();	// session占쏙옙 占쌘듸옙占쏙옙占쏙옙 id占쏙옙 占쏙옙占쏙옙占쏙옙 占쌍댐옙.(占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쌘듸옙占쏙옙占쏙옙 id占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싫댐옙)
			
			
			// DB占쏙옙 占쏙옙占쏙옙 UserDTO 占쏙옙占쏙옙占�
			UserDTO userDTO = new UserDTO();
			userDTO.setUserId(userId);
			userDTO.setUserAutologinId(sessionId);
			userDTO.setUserAutologinExpiredAt(new Date(System.currentTimeMillis() + 1000 * 60 * 60 * 24 * 15));	
										  // 占쏙옙占쏙옙 + 15占쏙옙 : java.sql.Date 클占쏙옙占쏙옙占쏙옙 占싱울옙占쌔쇽옙 占쌜억옙占쏙옙 占쏙옙占쏙옙占싼댐옙.
										  // java.sql.Date 클占쏙옙占쏙옙占쏙옙 타占쌈쏙옙占쏙옙占쏙옙占쏙옙 占싱울옙占쌔쇽옙 占쏙옙짜占쏙옙 占쏙옙占쏙옙占싼댐옙.
			
			
			
			// session id占쏙옙 占쏙옙키占쏙옙 占쏙옙占쏙옙占싹깍옙
			Cookie cookie = new Cookie("userAutologinId", sessionId);
			cookie.setMaxAge(60 * 60 * 24 * 15);		// 占쏙옙 占쏙옙占쏙옙占쏙옙 15占쏙옙 占쏙옙占쏙옙
			cookie.setPath(request.getContextPath());	// 占쏙옙占시몌옙占쏙옙占싱쇽옙占쏙옙 占쏙옙占� URL占쏙옙占쏙옙 userAutologinId 占쏙옙키占쏙옙 확占쏙옙占쏙옙 占쏙옙 占쌍댐옙.
			response.addCookie(cookie);
			
			
			// DB占쏙옙 UserDTO 占쏙옙占쏙옙占쏙옙
			userMapper.insertAutologin(userDTO);
			
			
			
		}
		// 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 체크占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占�
		else {
			
			// DB占쏙옙占쏙옙 AUTOLOGIN_ID 칼占쏙옙占쏙옙 AUTOLOGIN_EXPIRED_AT 칼占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙
			userMapper.deleteAutologin(userId);
			
			// autoLoginId 占쏙옙키 占쏙옙占쏙옙占싹깍옙
			Cookie cookie = new Cookie("userAutologinId", "");
			cookie.setMaxAge(0);	// 占쏙옙키 占쏙옙占쏙옙占시곤옙占쏙옙 0占십뤄옙 占쏙옙占쏙옙
			cookie.setPath(request.getContextPath());	// autoLoginId 占쏙옙키占쏙옙 path占쏙옙 占쏙옙占쏙옙占싹곤옙 占쏙옙占쏙옙
			response.addCookie(cookie);
			
		}
		
	}
	
	
	@Override
	public void logout(HttpServletRequest request, HttpServletResponse response) {
		
		// 1. 占쌘듸옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占쏙옙占싼댐옙.
		
		// DB占쏙옙占쏙옙 AUTOLOGIN_ID 칼占쏙옙占쏙옙 AUTOLOGIN_EXPIRED_AT 칼占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占싹깍옙
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("loginId");	// 占쌕꾸뤄옙占쏙옙占싹댐옙 타占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙磯占�.
		userMapper.deleteAutologin(userId);
		
		// autoLoginId 占쏙옙키 占쏙옙占쏙옙占싹깍옙
		Cookie cookie = new Cookie("userAutologinId", "");
		cookie.setMaxAge(0);	// 占쏙옙키 占쏙옙占쏙옙占시곤옙占쏙옙 0占십뤄옙 占쏙옙占쏙옙
		cookie.setPath(request.getContextPath());	// userAutologinId 占쏙옙키占쏙옙 path占쏙옙 占쏙옙占쏙옙占싹곤옙 占쏙옙占쏙옙
		response.addCookie(cookie);
		
		// 2. session占쏙옙 占쏙옙占쏙옙占� 占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占�.(invalidate() 占쏙옙占�)
		session.invalidate();
		
	}
	
	
	
	@Transactional(readOnly=true)
	@Override
	public void leave(HttpServletRequest request, HttpServletResponse response) {
		
		// 탈占쏙옙占쏙옙 회占쏙옙占쏙옙 ID占쏙옙 session占쏙옙 loginId 占쌈쇽옙占쏙옙占쏙옙 占쏙옙占쏙옙퓸占� 占쌍댐옙.
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("loginId");
		
		// 탈占쏙옙占쏙옙 회占쏙옙占쏙옙 占쏙옙占쏙옙(ID, EMAIL, JOINED_AT) 占쏙옙占쏙옙占쏙옙占쏙옙
		UserDTO userDTO = userMapper.selectUserById(userId);
		
		// LeaveUserDTO 占쏙옙占쏙옙占�
		LeaveUserDTO leaveUserDTO = new LeaveUserDTO();
		leaveUserDTO.setUserId(userId);
		leaveUserDTO.setUserEmail(userDTO.getUserEmail());
		leaveUserDTO.setUserJoinedAt(userDTO.getUserJoinedAt());
		
		// 회占쏙옙 탈占쏙옙占싹깍옙
		int insertResult = userMapper.insertLeaveUser(leaveUserDTO);
		int delectResult = userMapper.deleteUser(userId);
		
		
		// 占쏙옙占쏙옙
		try {
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			if(insertResult == 1 && delectResult == 1) {
				
				// session 占십깍옙화 占쌜억옙
				session.invalidate();
				
				out.println("alert('회占쏙옙 탈占쏙옙 占실억옙占쏙옙占싹댐옙.');");
				out.println("location.href='" + request.getContextPath() + "/';");	// 占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙占쏙옙 占싱듸옙占싹댐옙 占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙占식울옙 占쏙옙占쏙옙!
			}else {
				out.println("alert('회占쏙옙 탈占쏙옙 占쏙옙占쏙옙占쌩쏙옙占싹댐옙.');");
				out.println("history.back;");	
			}
			out.println("</script>");
			out.flush();
			out.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@Override 
    public Map<String, Object> findUser(UserDTO userDTO) {
       Map<String, Object> map = new HashMap<String, Object>();
       map.put("findUser", userMapper.selectUserByEmail(userDTO.getUserEmail()));
       return map; 
    }
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
