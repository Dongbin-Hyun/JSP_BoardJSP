package kr.ac.kopo.kopo44.service;

import java.util.List;

import kr.ac.kopo.kopo44.domain.Comment;

public interface CommentService {
	//C
void create(Comment comment);
	
	//R
	List<Comment> selectAll(int gongjiId);
	
	//U
	void update(Comment comment);
	
	//D
	void delete(Comment comment);
}
