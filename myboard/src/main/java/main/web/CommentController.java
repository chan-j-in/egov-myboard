package main.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.CommentService;
import main.service.CommentVO;

@Controller
public class CommentController extends BaseController {
	
	@Resource(name="commentService")
	private CommentService commentService;
	
	@RequestMapping("/commentWriteSave.do")
	@ResponseBody
	public String insertComment(HttpSession session, CommentVO vo) throws Exception {
		
		String userid = (String) session.getAttribute("SessionUserId");
		
		String name = "";
		if(userid == null) {
			name = generateVisitorName();
		} else {
			name = userid;
		}
		vo.setName(name);
		
		System.out.println("vo.getBoardUnq() : " +vo.getBoardUnq());
		System.out.println("vo.getContent() : " +vo.getContent());
		System.out.println("vo.getName() : " +vo.getName());
		if (commentService.insertComment(vo) == null) return "ok";
	    return "fail";
	}

}
