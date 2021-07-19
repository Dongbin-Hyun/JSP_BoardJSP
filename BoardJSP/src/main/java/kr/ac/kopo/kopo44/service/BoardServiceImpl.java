package kr.ac.kopo.kopo44.service;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.dao.BoardDao;
import kr.ac.kopo.kopo44.dao.BoardDaoImpl;
import kr.ac.kopo.kopo44.domain.Board;

public class BoardServiceImpl implements BoardService {
	
	private BoardDao boardDao = BoardDaoImpl.getInstance();

	@Override
	public void create(Board board) {
		boardDao.create(board);
		
	}

	@Override
	public Board selectOne(int id) {
		return boardDao.selectOne(id);
	}

	@Override
	public List<Board> selectAll(int cPage) {
		ArrayList<Integer> pages = new ArrayList<Integer>();
		pages = pages(cPage);
			
		return boardDao.boardListPaing(pages.get(0), pages.get(6));
	}

	@Override
	public void update(Board board) {
		boardDao.update(board);
	}

	@Override
	public void delete(Board board) {
		boardDao.delete(board);
	}

	@Override
	public List<Board> search(String searchWord) {
		
		return boardDao.search(searchWord);
	}

	@Override
	public ArrayList<Integer> pages(int cPage) {
		ArrayList<Integer> pages = new ArrayList<Integer>();
		
		int totalCnt = boardDao.selectAll().size(); //�ѰԽñ� ��
		int CntList = 5; //�� �������� ǥ�õ� �Խñ� ��
		int totalPage = totalCnt/CntList; //�� ������ ��
		
		if (totalCnt % CntList > 0) {
			totalPage++;
		}
		
		int current_page = cPage; //����������
		
		
		if (totalPage < current_page) {
			current_page = totalPage;
		}
		
		Integer countPage = 10; //�ϴܿ� ǥ�õ� ������ ��
		Integer startPage = ((current_page - 1) / countPage) * countPage + 1; //����������
		Integer endPage = startPage + countPage - 1; //�� ������

		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		int prePage;
		if(current_page == 1) {
			prePage = 1;
		} else {
			prePage = current_page - 1;
		}

		int nextPage;
		if (current_page == totalPage) {
			nextPage = current_page;
		} else {
			nextPage = current_page + 1;
		}
		pages.add(current_page);
		pages.add(startPage);
		pages.add(endPage);
		pages.add(totalPage);
		pages.add(nextPage);
		pages.add(prePage);
		pages.add(CntList);
	
		return pages;
	}
	
}
