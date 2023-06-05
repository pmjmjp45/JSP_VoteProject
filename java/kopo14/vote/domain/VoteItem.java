package kopo14.vote.domain;

public class VoteItem {

	private int number;
	private String name;
	private int resultVote;
	private double resultRate;
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getResultVote() {
		return resultVote;
	}
	public void setResultVote(int resultVote) {
		this.resultVote = resultVote;
	}
	public double getResultRate() {
		return resultRate;
	}
	public void setResultRate(double resultRate) {
		this.resultRate = resultRate;
	}

}
