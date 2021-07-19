package kr.ac.kopo.kopo44.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.domain.Board;
import kr.ac.kopo.kopo44.domain.BoardItem;

public class BoardItemDaoImpl implements BoardItemDao {
	private static String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	private static String DB_URL = "jdbc:mysql://localhost:3306/myBoard";
	private static String DB_ID = "root";
	private static String DB_PW = "gusehdqls92410!@";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rset;
	private static BoardItemDaoImpl instance;
	
	private BoardItemDaoImpl() {
		 try {
	         Class.forName(DRIVER_NAME);
	         conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	}
	
	public static BoardItemDaoImpl getInstance() {
		 if (instance == null) {
	          instance = new BoardItemDaoImpl();
	       }
	       return instance;
	}
	
	@Override
	public void create(BoardItem boardItem) {
		try {
			stmt = conn.createStatement();
			stmt.execute("insert into gongji(title,date,content,boardId) values('" + 
			boardItem.getTitle() + "','"+
			boardItem.getDate() + "','" + 
			boardItem.getContent() + "'," + 
			boardItem.getBoardId() + ");");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public BoardItem selectOne(int id) {
		BoardItem boardItem = new BoardItem();
		try {
			stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from gongji where id=" + id + ";");
			
			
			
			while(rset.next()) {
				boardItem.setId(rset.getInt(1));
				boardItem.setTitle(rset.getString(2));
				boardItem.setDate(rset.getString(3));
				boardItem.setContent(rset.getString(4));
				boardItem.setViewCnt(rset.getInt(5));
				boardItem.setBoardId(rset.getInt(6));
			}
			
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return boardItem;
	}

	@Override
	public List<BoardItem> selectAll(int boardItemId) {
		List<BoardItem> boarditems = new ArrayList<BoardItem>();
		try {
			stmt = conn.createStatement();
			ResultSet rset = stmt.executeQuery("select * from gongji where boardId = " + boardItemId + " order by id desc;");
			while(rset.next()) {
				BoardItem boarditem = new BoardItem();
				boarditem.setId(rset.getInt(1));
				boarditem.setTitle(rset.getString(2));
				boarditem.setDate(rset.getString(3));
				boarditem.setContent(rset.getString(4));
				boarditem.setViewCnt(rset.getInt(5));
				boarditem.setBoardId(rset.getInt(6));
				boarditems.add(boarditem);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boarditems;

	}

	@Override
	public void update(BoardItem boardItem) {
		try {
			stmt = conn.createStatement();
			stmt.execute("update gongji set title='" + boardItem.getTitle() + "', date='" + boardItem.getDate() + "',content='" + boardItem.getContent() + "', viewCnt=" + boardItem.getViewCnt() + " where id = " + boardItem.getId() + ";");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
	}

	@Override
	public void delete(BoardItem boardItem) {
		try {
			stmt = conn.createStatement();
			stmt.execute("delete from gongji where id = " + boardItem.getId() + ";");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BoardItem> search(String keyWord, String searchWord, int boardId) {
		List<BoardItem> boarditems = new ArrayList<BoardItem>();
		
		try {
			stmt = conn.createStatement();
			if (keyWord.equals("content")) {
				rset = stmt.executeQuery("select * from gongji where boardId=" + boardId + " and content like '%" + searchWord + "%';");
			} else if (keyWord.equals("title")) {
				rset = stmt.executeQuery("select * from gongji where boardId=" + boardId + " and title like '%" + searchWord + "%';");
			}
			
			while(rset.next()) {
				BoardItem boarditem = new BoardItem();
				boarditem.setId(rset.getInt(1));
				boarditem.setTitle(rset.getString(2));
				boarditem.setDate(rset.getString(3));
				boarditem.setContent(rset.getString(4));
				boarditem.setViewCnt(rset.getInt(5));
				boarditem.setBoardId(rset.getInt(6));
				boarditems.add(boarditem);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return boarditems;
	}

	@Override
	public List<BoardItem> boardListPaging(int current_page, int CntList, int boardId) {
		List<BoardItem> boarditems = new ArrayList<BoardItem>();
		
		try {
			stmt = conn.createStatement();
				rset = stmt.executeQuery("select * from gongji where boardId=" + boardId +" order by id desc limit " + ((current_page - 1) * CntList) + ", " + CntList + ";");

			while(rset.next()) {
				BoardItem boarditem = new BoardItem();
				boarditem.setId(rset.getInt(1));
				boarditem.setTitle(rset.getString(2));
				boarditem.setDate(rset.getString(3));
				boarditem.setContent(rset.getString(4));
				boarditem.setViewCnt(rset.getInt(5));
				boarditem.setBoardId(rset.getInt(6));
				boarditems.add(boarditem);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return boarditems;
	}
	

}
