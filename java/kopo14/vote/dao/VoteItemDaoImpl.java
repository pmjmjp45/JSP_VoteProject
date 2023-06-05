package kopo14.vote.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import kopo14.vote.domain.VoteItem;

public class VoteItemDaoImpl implements VoteItemDao{
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<VoteItem> showCandidates() throws ClassNotFoundException, SQLException {
		List<VoteItem> listAll = new ArrayList<>();
		
		Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 드라이버 로딩
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.63:33060/kopo14", "root", "0405");
        //데이터베이스와 연결
        Statement stmt = conn.createStatement(); // 스테이트먼트 객체 생성
        ResultSet rset = stmt.executeQuery("select * from candidate_table;"); //실행문 결과 리절트셋에 저장 
        
        while(rset.next()) {
    		VoteItem showAll = new VoteItem();
    		showAll.setNumber(rset.getInt(1));
        	showAll.setName(rset.getString(2));
        	listAll.add(showAll);
        }
        rset.close();
        stmt.close();
		conn.close();
		return listAll;
	}
	
	@Override
	public List<VoteItem> deleteCandidates(int number) throws ClassNotFoundException, SQLException {
		List<VoteItem> listAll = new ArrayList<>();
		
		Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 드라이버 로딩
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.63:33060/kopo14", "root", "0405");
        //데이터베이스와 연결
        Statement stmt = conn.createStatement(); // 스테이트먼트 객체 생성
        
        stmt.execute("delete from vote_table where number =" + number + ";");
        stmt.execute("delete from candidate_table where number =" + number + ";");
        ResultSet rset = stmt.executeQuery("select * from candidate_table;"); //실행문 결과 리절트셋에 저장 
        
        while(rset.next()) {
    		VoteItem showAll = new VoteItem();
    		showAll.setNumber(rset.getInt(1));
        	showAll.setName(rset.getString(2));
        	listAll.add(showAll);
        }
        rset.close();
        stmt.close();
		conn.close();
		return listAll;
	}

	@Override
	public List<VoteItem> insertCandidates(int num, String name) throws ClassNotFoundException, SQLException {
		List<VoteItem> listAll = new ArrayList<>();
		
		Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 드라이버 로딩
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.63:33060/kopo14", "root", "0405");
        //데이터베이스와 연결
        Statement stmt = conn.createStatement(); // 스테이트먼트 객체 생성
        
        stmt.execute("insert into candidate_table (number, name) values ("+ num + ", '" + name + "');");
        ResultSet rset = stmt.executeQuery("select * from candidate_table;"); //실행문 결과 리절트셋에 저장 
        
        while(rset.next()) {
    		VoteItem showAll = new VoteItem();
    		showAll.setNumber(rset.getInt(1));
        	showAll.setName(rset.getString(2));
        	listAll.add(showAll);
        }
        rset.close();
        stmt.close();
		conn.close();
		return listAll;
	}

	@Override
	public boolean vote(int number, int age) throws ClassNotFoundException, SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 드라이버 로딩
	        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.63:33060/kopo14", "root", "0405");
	        //데이터베이스와 연결
	        Statement stmt = conn.createStatement(); // 스테이트먼트 객체 생성
	        
	        stmt.execute("insert into vote_table (number, age) values ("+ number + ", '" + age + "');");
	        
	        stmt.close();
			conn.close();
		} catch (Exception e) {
			return false;
		}
		return true;	
	}

	@Override
	public List<VoteItem> showResultAll() throws ClassNotFoundException, SQLException {
		List<VoteItem> listAll = new ArrayList<>();
		
		Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 드라이버 로딩
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.63:33060/kopo14", "root", "0405");
        //데이터베이스와 연결
        Statement stmt = conn.createStatement(); // 스테이트먼트 객체 생성
        
        ResultSet rset = stmt.executeQuery("select "
        		+ "a.number, a.name"
        		+ ", count(b.number), format(count(b.number) / (select count(*) from vote_table) * 100,2)"
        		+ "	from candidate_table as a left join vote_table as b on a.number = b.number group by a. number;"); 
        
        while(rset.next()) {
    		VoteItem showAll = new VoteItem();
    		showAll.setNumber(rset.getInt(1));
        	showAll.setName(rset.getString(2));
        	showAll.setResultVote(rset.getInt(3));
        	showAll.setResultRate(rset.getDouble(4));
        	listAll.add(showAll);
        }
        rset.close();
        stmt.close();
		conn.close();
		return listAll;
	}

	@Override
	public List<VoteItem> showResultOne(int number) throws ClassNotFoundException, SQLException {
		List<VoteItem> listAll = new ArrayList<>();
		
		Class.forName("com.mysql.cj.jdbc.Driver"); //jdbc 드라이버 로딩
        Connection conn = DriverManager.getConnection("jdbc:mysql://192.168.23.63:33060/kopo14", "root", "0405");
        //데이터베이스와 연결
        Statement stmt = conn.createStatement(); // 스테이트먼트 객체 생성
        
        ResultSet rset = stmt.executeQuery("select "
        		+ "a.age"
        		+ ", COUNT(vote_table.number)"
        		+ ", format(COUNT(vote_table.number) * 100.0 / (SELECT COUNT(*) FROM vote_table where number ="+ number + "), 2)"
        		+ "	from age_table as a left join vote_table on a.age = vote_table.age and vote_table.number =" + number 
        		+ " group by a.age order by a.age;"); //실행문 결과 리절트셋에 저장 
        
        while(rset.next()) {
    		VoteItem showAll = new VoteItem();
    		showAll.setNumber(rset.getInt(1));
        	showAll.setResultVote(rset.getInt(2));
        	showAll.setResultRate(rset.getDouble(3));
        	listAll.add(showAll);
        }
        rset.close();
        stmt.close();
		conn.close();
		return listAll;
	}
}
