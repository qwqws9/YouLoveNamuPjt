package com.youlove.service.comment;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import com.youlove.service.domain.Comment;

public interface CommentDao {

	public void addComment(Comment comment) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	
	public List<Comment> getComment(Map<String,Object> map) throws Exception;
	
	public int countComment(Comment comment) throws Exception;
	
	public Comment getCommentOne(Comment comment ) throws Exception;
	
	
	
}


	
