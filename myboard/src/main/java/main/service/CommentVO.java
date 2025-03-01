package main.service;

public class CommentVO {

	private int unq;
	private int boardUnq;
	private String content;
	private String name;
	private String rdate;
	
	public int getUnq() {
		return unq;
	}
	public void setUnq(int unq) {
		this.unq = unq;
	}
	public int getBoardUnq() {
		return boardUnq;
	}
	public void setBoardUnq(int boardUnq) {
		this.boardUnq = boardUnq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
}
