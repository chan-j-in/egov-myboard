package main.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;
import main.service.CommentVO;

@Repository("commentDAO")
public class CommentDAO extends EgovAbstractDAO {

	public String insertComment(CommentVO vo) {
		
		return (String) insert("commentDAO.insertComment", vo);
	}

	public List<?> selectCommentsByBoardUnq(int boardUnq) {
		
		return list("commentDAO.selectCommentsByBoardUnq", boardUnq);
	}
	
	public int deleteComment(CommentVO vo) {
		
		return delete("commentDAO.deleteComment", vo);
	}
}
