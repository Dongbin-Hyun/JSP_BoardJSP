package kr.ac.kopo.kopo44.dao;

import java.util.List;

import kr.ac.kopo.kopo44.domain.Board;

public interface BoardDao {

	// C
	void create(Board board);
	
	//R
	Board selectOne(int id);
	List<Board> selectAll();
	
	//U
	void update(Board board);
	
	//D
	void delete(Board board);
	
	//search
	List<Board> search(String searchWord);
	
	//paging
	List<Board> boardListPaing(int current_page, int CntList);
}
