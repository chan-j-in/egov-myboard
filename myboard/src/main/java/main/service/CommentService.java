package main.service;

import java.util.List;

public interface CommentService {

	public String insertComment(CommentVO vo) throws Exception;
	public List<?> selectCommentsByBoardUnq(int boardUnq) throws Exception;
	public int deleteComment(CommentVO vo) throws Exception;
}
