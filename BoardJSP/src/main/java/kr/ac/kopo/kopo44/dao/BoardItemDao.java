package kr.ac.kopo.kopo44.dao;

import java.util.List;

import kr.ac.kopo.kopo44.domain.Board;
import kr.ac.kopo.kopo44.domain.BoardItem;

public interface BoardItemDao {

	// C
	void create(BoardItem board);
	
	//R
	BoardItem selectOne(int id);
	List<BoardItem> selectAll(int boardId);
	
	//U
	void update(BoardItem board);
	
	//D
	void delete(BoardItem board);
	
	//search
	List<BoardItem> search(String keyWord, String searchWord, int boardId);
	
	//paging
	List<BoardItem> boardListPaging(int current_page, int CntList, int boardId);
	
}
