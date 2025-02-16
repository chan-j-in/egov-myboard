package main.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;

@Controller
public class BoardController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(BoardVO vo) throws Exception {
		
	    if (boardService.insertNBoard(vo) == null) return "ok";
	    return "fail";
	}
	
	@RequestMapping("/boardList.do")
	public String selectNBoardList(@RequestParam(value="page", defaultValue="1")int page, BoardVO vo, ModelMap model) throws Exception {
		
		Map<String, Object> data = boardService.selectNBoardList(page, vo);
		
		model.addAllAttributes(data);
		return "board/boardList";
	}
}
