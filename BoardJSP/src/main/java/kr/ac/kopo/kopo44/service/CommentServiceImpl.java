package kr.ac.kopo.kopo44.service;

import java.util.List;

import kr.ac.kopo.kopo44.dao.CommentDao;
import kr.ac.kopo.kopo44.dao.CommentDaoImpl;
import kr.ac.kopo.kopo44.domain.Comment;

public class CommentServiceImpl implements CommentService {
	CommentDao commentDao = CommentDaoImpl.getInstance();
	
	@Override
	public void create(Comment comment) {
		commentDao.create(comment);
	}

	@Override
	public List<Comment> selectAll(int gongjiId) {
		return commentDao.selectAll(gongjiId);
	}

	@Override
	public void update(Comment comment) {
		
	}

	@Override
	public void delete(Comment comment) {
		commentDao.delete(comment);
	}

}
