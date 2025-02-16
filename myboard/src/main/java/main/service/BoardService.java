package main.service;

import java.util.Map;

public interface BoardService {

	public String insertNBoard(BoardVO vo) throws Exception;
	public Map<String, Object> selectNBoardList(int page, BoardVO vo) throws Exception;
	public int selectNBoardTotal(BoardVO vo) throws Exception;
}
