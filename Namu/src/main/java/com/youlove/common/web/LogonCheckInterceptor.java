package com.youlove.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.youlove.service.domain.User;

public class LogonCheckInterceptor extends HandlerInterceptorAdapter {

	///Field
	
	///Constructor
	public LogonCheckInterceptor(){
		System.out.println("\nCommon :: "+this.getClass()+"\n");		
	}
	
	///Method
	public boolean preHandle(	HttpServletRequest request,
														HttpServletResponse response, 
														Object handler) throws Exception {
		
		System.out.println("\n[ LogonCheckInterceptor start........]");
		
		HttpSession session = request.getSession(true);
		User user = (User)session.getAttribute("user");
		String uri = request.getRequestURI();
		
		
		if( user != null) {
			
			if(user.getRole().equals("admin")) {
				return true;
			}else {
				// 관리자만 접근 가능한 URL
				if(uri.indexOf("getUserList") != -1 ||
				   uri.indexOf("getPoliceList") != -1 ||
				   uri.indexOf("setUserBlock") != -1
						) {
					System.out.println(uri);
					System.out.println("일반회원 접근 불가......");
					response.sendRedirect("/");
					return false;
				}
			}
			
		// 비회원 접근 막을곳 
		}else {
			
			if(uri.indexOf("getUser") != -1) {
				if(uri.indexOf("json/getUser") != -1) {
					return true;
				}else {
					response.sendRedirect("/");
					return false;
				}
			}
			
			
			if( // UserController                       
				uri.indexOf("getPayList") != -1			                                 ||
				uri.indexOf("logout") != -1				                                 ||
				uri.indexOf("getUserList") != -1		                                 ||
				uri.indexOf("getPoliceList") != -1		                                 ||
				uri.indexOf("getPoliceList") != -1		                                 ||
				uri.indexOf("addPolice") != -1			                                 ||
				uri.indexOf("updatePolice") != -1		                                 ||
				uri.indexOf("updatePolice") != -1		                                 ||
				uri.indexOf("multipleAdd") != -1		                                 ||
				uri.indexOf("inviteUser") != -1			                                 ||
				uri.indexOf("addFriendMemo") != -1		                                 ||
				uri.indexOf("getFriend") != -1			                                 ||
				uri.indexOf("addPay") != -1				                                 ||
				uri.indexOf("updateImg") != -1			                                 ||
				uri.indexOf("updateUser") != -1			                                 ||
				uri.indexOf("setUserBlock") != -1		                                 ||
				// TimelineController                                                    ||
				uri.indexOf("getTimelineList") != -1	 	                             ||
				uri.indexOf("addTimeline") != -1		 	                             ||
				uri.indexOf("updateTimeline") != -1		 	                             ||
				// LikeController                                                        ||
				uri.indexOf("addLike") != -1				                             ||
				uri.indexOf("deleteLike") != -1				                             ||
				// CommentController                                                     ||
				uri.indexOf("addComment") != -1				                             ||
				uri.indexOf("updateComment") != -1		 	                             ||
				uri.indexOf("deleteComment") != -1		 	                             ||
				uri.indexOf("getCommentOne") != -1						                 ||
				// WalletController                                                      ||
				uri.indexOf("getWalletListView") != -1				                     ||
				uri.indexOf("getWalletList") != -1										 ||
				// CommunityController
				uri.indexOf("addCommunity") != -1				                         ||
				uri.indexOf("addPartyView") != -1
				// LikeController                                                        ||
//				uri.indexOf("addLike") != -1				                             ||
//				uri.indexOf("deleteLike") != -1				                             ||  
				
				
				
				
				
				
				
					) {
				System.out.println(uri);
				System.out.println("비회원 접근불가.........");
				response.sendRedirect("/user/loginView");
				return false;
			}
		}
		return true;
	}
}//end of class