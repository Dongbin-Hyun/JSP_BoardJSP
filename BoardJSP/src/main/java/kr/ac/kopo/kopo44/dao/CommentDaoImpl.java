package kr.ac.kopo.kopo44.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kr.ac.kopo.kopo44.domain.Comment;

public class CommentDaoImpl implements CommentDao{
	private static String DRIVER_NAME = "com.mysql.cj.jdbc.Driver";
	private static String DB_URL = "jdbc:mysql://localhost:3306/myBoard";
	private static String DB_ID = "root";
	private static String DB_PW = "gusehdqls92410!@";
	
	private Connection conn;
	private Statement stmt;
	private ResultSet rset;
	private static CommentDaoImpl instance;
	
	public CommentDaoImpl() {
		 try {
	         Class.forName(DRIVER_NAME);
	         conn = DriverManager.getConnection(DB_URL, DB_ID, DB_PW);
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } catch (ClassNotFoundException e) {
	         e.printStackTrace();
	      }
	}
	
	public static CommentDaoImpl getInstance() {
		if (instance == null) {
			instance = new CommentDaoImpl();
		} 
		return instance;
	}
	
	@Override
	public void create(Comment comment) {
		try {
			stmt = conn.createStatement();
			stmt.execute("update gongji set viewCnt = viewCnt-1 where id=" + comment.getPostid() + ";");
			stmt.execute("insert into comments(postid, user, content, date) value(" + comment.getPostid() +",'" + comment.getUser() + "','" + comment.getContent() +  "', (select now()));");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Comment> selectAll(int gongjiId) {
		List<Comment> comments = new ArrayList<Comment>();
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery("select * from comments where postid=" + gongjiId + ";");
			
			while(rset.next()) {
				Comment comment = new Comment();
				comment.setId(rset.getInt(1));
				comment.setPostid(rset.getInt(2));
				comment.setUser(rset.getString(3));
				comment.setContent(rset.getString(4));
				comment.setDate(rset.getString(5));
				comments.add(comment);
			}
		
			rset.close();
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return comments;
	}

	@Override
	public void update(Comment comment) {
		
	}

	@Override
	public void delete(Comment comment) {
		try {
			stmt = conn.createStatement();
			stmt.execute("update gongji set viewCnt = viewCnt-1 where id=" + comment.getPostid() + ";");
			stmt.execute("delete from comments where id=" + comment.getId() + ";");
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
