package main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.CommentService;
import main.service.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Resource(name="commentDAO")
	private CommentDAO commentDAO;
	
	@Override
	public String insertComment(CommentVO vo) throws Exception {
		
		return commentDAO.insertComment(vo);
	}

	@Override
	public List<?> selectCommentsByBoardUnq(int boardUnq) throws Exception {
		
		return commentDAO.selectCommentsByBoardUnq(boardUnq);
	}

	@Override
	public int deleteComment(CommentVO vo) throws Exception {
		
		return commentDAO.deleteComment(vo);
	}
}
