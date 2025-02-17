package main.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.BoardService;
import main.service.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public String insertNBoard(BoardVO vo) throws Exception {

		return boardDAO.insertNBoard(vo);
	}

	@Override
	public Map<String, Object> selectNBoardList(int page, BoardVO vo) throws Exception {
		
		int total = selectNBoardTotal(vo);
		int totalPage = (int) Math.ceil(total / 10.0);
		
		if(page < 1 || page > totalPage) page = 1;
		
		int pageSize = 10;
		int startIndex = (page - 1) * pageSize + 1;
		int endIndex = page * pageSize;
		
		vo.setStartIndex(startIndex);
		vo.setEndIndex(endIndex);
		
		List<?> resultList=boardDAO.selectNBoardList(vo);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("total", total);
		resultMap.put("totalPage", totalPage);
		resultMap.put("resultList", resultList);
		resultMap.put("startIndex", startIndex);
		resultMap.put("endIndex", endIndex);
		
		return resultMap;
	}

	@Override
	public int selectNBoardTotal(BoardVO vo) throws Exception {
		
		return boardDAO.selectNBoardTotal(vo);
	}

	@Override
	public BoardVO selectNBoardDetail(int unq) throws Exception {
		
		updateNBoardHits(unq);
		return boardDAO.selectNBoardDetail(unq);
	}

	@Override
	public int updateNBoardHits(int unq) throws Exception {
		
		return boardDAO.updateNBoardHits(unq);
	}

}
