package main.web;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.BoardService;
import main.service.BoardVO;
import main.service.CommentService;

@Controller
public class BoardController extends BaseController {

	@Resource(name="boardService")
	private BoardService boardService;
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping("/boardWrite.do")
	public String boardWrite() {
		
		return "board/boardWrite";
	}
	
	@RequestMapping("/boardWriteSave.do")
	@ResponseBody
	public String insertNBoard(HttpSession session, BoardVO vo) throws Exception {
		
		String userid = (String) session.getAttribute("SessionUserId");
		
		String name = "";
		if(userid == null) {
			name = generateVisitorName();
		} else {
			name = userid;
		}
		vo.setName(name);
		
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
		model.addAttribute("comments", commentService.selectCommentsByBoardUnq(unq));
		return "board/boardDetail";
	}
	
	@RequestMapping("/boardModifyWrite.do")
	public String boardModifyWrite(int unq, ModelMap model) throws Exception {
		
		BoardVO boardVO = boardService.selectNBoardDetail(unq);
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
	
	@RequestMapping("/passWrite.do")
	public String passWrite(int unq, ModelMap model) {
		
		model.addAttribute("unq", unq);
		return "board/passWrite";
	}
	
	@RequestMapping("/boardDelete.do")
	@ResponseBody
	public String deleteNBoard(BoardVO vo) throws Exception {
		
		int result = boardService.deleteNBoard(vo);
		System.out.println("result : " + result);
		return result+"";
	}
}
