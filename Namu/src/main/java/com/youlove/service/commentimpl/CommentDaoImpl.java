package com.youlove.service.commentimpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.youlove.service.comment.CommentDao;
import com.youlove.service.domain.Comment;

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	
	//Constructor
	public CommentDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment",comment);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment",comment);
		
	}

	@Override
	public void deleteComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.deleteComment",comment);
	}

	@Override
	public List<Comment> getComment(Map<String, Object> map) throws Exception {
		
		return sqlSession.selectList("CommentMapper.getComment",map);
	}

	@Override
	public int countComment(Comment comment) throws Exception {
		return sqlSession.selectOne("CommentMapper.countComment",comment);
	}

	@Override
	public Comment getCommentOne(Comment comment) throws Exception {
		return sqlSession.selectOne("CommentMapper.getCommentOne",comment);
	}

	
	
		
}
