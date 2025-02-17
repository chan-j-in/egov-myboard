package main.web;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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
	
	@RequestMapping("/boardDetail.do")
	public String selectNBoardDetail(int unq, ModelMap model) throws Exception {
		
		model.addAttribute("boardVO", boardService.selectNBoardDetail(unq));
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String boardModifyWrite(BoardVO vo, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.selectNBoardDetail(vo.getUnq());
		model.addAttribute("boardVO", boardVO);
		
		System.out.println("title = " + boardVO.getTitle());
		System.out.println("title = " + boardVO.getUnq());
		return "board/boardModifyWrite";
	}
	
	@RequestMapping("/boardModifySave.do")
	@ResponseBody
	public String updateNBoard(BoardVO vo) throws Exception {
		
		return boardService.updateNBoard(vo)+"";
	}
}
