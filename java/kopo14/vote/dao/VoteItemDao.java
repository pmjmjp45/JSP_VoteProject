
package kopo14.vote.dao;

import java.sql.SQLException;
import java.util.*;

import kopo14.vote.domain.VoteItem;

public interface VoteItemDao {
	List<VoteItem> showCandidates() throws ClassNotFoundException, SQLException;
	List<VoteItem> deleteCandidates(int number)  throws ClassNotFoundException, SQLException;
	List<VoteItem> insertCandidates(int num, String name)  throws ClassNotFoundException, SQLException;
	boolean vote(int number, int age)  throws ClassNotFoundException, SQLException;
	List<VoteItem> showResultAll() throws ClassNotFoundException, SQLException;
	List<VoteItem> showResultOne(int number) throws ClassNotFoundException, SQLException;
}
