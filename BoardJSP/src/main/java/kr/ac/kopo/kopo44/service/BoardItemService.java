package kr.ac.kopo.kopo44.service;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.domain.BoardItem;

public interface BoardItemService {
	void create(BoardItem boardItem);
	BoardItem selectOne(int id);
	List<BoardItem> selectAll(int boardId, int cPage);
	void update(BoardItem boardItem);
	void delete(BoardItem boardItem);
	List<BoardItem> search(String keyWord, String searchWord, int boardId);
	ArrayList<Integer> pages(int cPage, int boardId);
	void viewCntUp(BoardItem boardItem);
}
