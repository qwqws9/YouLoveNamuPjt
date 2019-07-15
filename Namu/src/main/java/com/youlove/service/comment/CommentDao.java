package com.youlove.service.comment;

import com.youlove.service.domain.Comment;

public interface CommentDao {

	public void addComment(Comment comment) throws Exception;
	
	public void updateComment(Comment comment) throws Exception;
	
	public void deleteComment(Comment comment) throws Exception;
	
	
	
}


	
