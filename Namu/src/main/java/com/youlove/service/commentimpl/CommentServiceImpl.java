package com.youlove.service.commentimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.youlove.service.comment.CommentDao;
import com.youlove.service.comment.CommentService;
import com.youlove.service.domain.Comment;

@Service("commentServiceImpl")
public class CommentServiceImpl implements CommentService{
	
	//Field
	@Autowired
	@Qualifier("commentDaoImpl")
	private CommentDao commentDao;
	
	//Constructor
	public CommentServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		commentDao.addComment(comment);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		commentDao.updateComment(comment);
	}

	@Override
	public void deleteComment(Comment comment) throws Exception {
		commentDao.deleteComment(comment);
	}

	




}

