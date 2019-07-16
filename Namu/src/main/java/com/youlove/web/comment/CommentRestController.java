package com.youlove.web.comment;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.youlove.service.user.UserService;

@RestController
@RequestMapping("/comment/*")
public class CommentRestController {
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
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
		
		comment.setWriterComment(user);
		
		System.out.println(comment.toString());
		
		commentService.addComment(comment);
		
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

		
		commentService.deleteComment(comment);
		
		return true;
		
	}
	
	
	@RequestMapping(value ="/json/getComment", method=RequestMethod.POST)
	public List<Comment> getComment(@RequestBody Comment comment, Map<String,Object> map) throws Exception {

		System.out.println("/json/getComment 들어옴");
		System.out.println(comment.getBoardCode());
		System.out.println(comment.getDetailCode());
		
		map.put("boardCode", comment.getBoardCode());
		map.put("detailCode", comment.getDetailCode());
		
		List<Comment> list = commentService.getComment(map);
		
		/*
		 * 			
				
		select * from (
			select ROWNUM ronum ,innerT.* 
			from ( select * 
				   from comments 
				   where BOARD_CODE = #{boardCode} and DETAIL_CODE = #{detailCode}
				   order by reply_code, step) innerT
			WHERE ROWNUM &lt;= 5 )
		where ronum BETWEEN 1 AND 5;		
				
				
		 * 
		 */
		
		System.out.println(list.size() + "댓글 길이");
		
		
		return list;
		
	}
	
	
	
	

}
