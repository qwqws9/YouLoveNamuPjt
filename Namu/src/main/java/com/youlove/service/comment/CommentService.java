package com.youlove.service.comment;

import java.util.List;
import java.util.Map;

import com.youlove.service.domain.Comment;

public interface CommentService {

	public void addComment(Comment comment) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	
	public List<Comment> getComment(Map<String,Object> map) throws Exception;
	
	public int countComment(Comment comment) throws Exception;
	
	
}

