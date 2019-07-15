package com.youlove.web.comment;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.youlove.common.DateFormat;
import com.youlove.service.comment.CommentService;
import com.youlove.service.domain.Comment;
import com.youlove.service.domain.User;

@RestController
@RequestMapping("/comment/*")
public class CommentRestController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	public CommentRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping(value ="/json/addComment", method=RequestMethod.POST)
	public boolean addComment(@RequestBody Comment comment, HttpSession session, User user) throws Exception {

		//결과보고 if문 처리 ( 부모댓글로 조회해서 step 맥스 +1 해주기
		System.out.println(comment.getReplyCode());
		System.out.println("+++++++++++++++++++++++");
		
		user = (User)session.getAttribute("user");
		
		comment.setCommentDate(DateFormat.minute());
		
		comment.setWriterComment(user.getUserCode()+"");
		
		System.out.println(comment.toString());
		if(comment.getReplyCode() == 0) {
			commentService.addComment(comment);
		}else {
			//스텝 구해서 집어넣기
		}
		
		return true;
		
	}
	
	
	
	@RequestMapping(value ="/json/updateComment", method=RequestMethod.POST)
	public boolean updateComment(@RequestBody Comment comment) throws Exception {

		comment.setCommentDate(DateFormat.minute());
		
		commentService.updateComment(comment);
		
		return true;
		
	}
	
	
	@RequestMapping(value ="/json/deleteComment", method=RequestMethod.POST)
	public boolean deleteComment(@RequestBody Comment comment) throws Exception {

		
		commentService.updateComment(comment);
		
		return true;
		
	}
	
	
	
	

}
