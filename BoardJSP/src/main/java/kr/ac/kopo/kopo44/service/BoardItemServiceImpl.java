package kr.ac.kopo.kopo44.service;

import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.dao.*;
import kr.ac.kopo.kopo44.domain.*;

public class BoardItemServiceImpl implements BoardItemService {
	private BoardItemDao boardDaoItem = BoardItemDaoImpl.getInstance();
	
	@Override
	public void create(BoardItem boardItem) {
		boardDaoItem.create(boardItem);
	}

	@Override
	public BoardItem selectOne(int id) {
		return boardDaoItem.selectOne(id);
	}

	@Override
	public List<BoardItem> selectAll(int boardId, int cPage) {
		ArrayList<Integer> pages = new ArrayList<Integer>();
		pages = pages(cPage, boardId);

		return boardDaoItem.boardListPaging(pages.get(0), pages.get(6), boardId);
	}

	@Override
	public void update(BoardItem boardItem) {
		boardDaoItem.update(boardItem);
	}

	@Override
	public void delete(BoardItem boardItem) {
		boardDaoItem.delete(boardItem);
	}

	@Override
	public List<BoardItem> search(String keyWord, String searchWord, int boardId) {
		return boardDaoItem.search(keyWord, searchWord, boardId);
	}

	@Override
	public ArrayList<Integer> pages(int cPage, int boardId) {
		ArrayList<Integer> pages = new ArrayList<Integer>();
		
		int totalCnt = boardDaoItem.selectAll(boardId).size();
		int CntList = 5; //�� �������� ǥ�õ� �Խñ� ��
		int totalPage = totalCnt/CntList; //�� ������ ��
		
		if (totalCnt % CntList > 0) {
			totalPage++;
		}
		
		int current_page = cPage; //����������
		
		
		if (totalPage != 0 && totalPage < current_page) {
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
		pages.add(current_page); //0
		pages.add(startPage);
		pages.add(endPage);
		pages.add(totalPage);
		pages.add(nextPage);
		pages.add(prePage);
		pages.add(CntList); //6
	
		return pages;

	}

	@Override
	public void viewCntUp(BoardItem boardItem) {
		boardItem.setViewCnt(boardItem.getViewCnt() + 1);
		boardDaoItem.update(boardItem);
	}


}
