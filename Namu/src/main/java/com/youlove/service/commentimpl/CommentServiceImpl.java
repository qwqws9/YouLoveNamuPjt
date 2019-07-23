package com.youlove.service.commentimpl;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Comment> getComment(Map<String, Object> map) throws Exception {
		
//		List<Comment> list = new ArrayList<Comment>();
		
//		list = commentDao.getComment(map);
//		int count = commentDao.countComment(map);
//		map.clear();
//		map.put("list", list);
//		map.put("count", count);
		
		return commentDao.getComment(map);
	}

	@Override
	public int countComment(Comment comment) throws Exception {
		return commentDao.countComment(comment);
	}

	@Override
	public Comment getCommentOne(Comment comment) throws Exception {
		return commentDao.getCommentOne(comment);
	}

	




}

