package kr.ac.kopo.kopo44.service;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.domain.Board;

public interface BoardService {
	void create(Board board);
	Board selectOne(int id);
	List<Board> selectAll(int cPage);
	void update(Board board);
	void delete(Board board);
	List<Board> search(String searchWord);
	ArrayList<Integer> pages(int cPage);
}
