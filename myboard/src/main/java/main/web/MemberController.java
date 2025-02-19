package main.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.service.MemberService;
import main.service.MemberVO;

@Controller
public class MemberController {
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@RequestMapping("/memberWrite.do")
	public String memberWrite() {
		
		return "member/memberWrite";
	}
	
	@RequestMapping("/memberWriteSave.do")
	@ResponseBody
	public String insertMember(MemberVO vo) throws Exception {
		
		if (memberService.insertMember(vo) == null) return "ok";
	    return "fail";
	}
	
	@RequestMapping("/idCheck.do")
	@ResponseBody
	public String idCheck(String userid) throws Exception {
		
		return memberService.selectMemberIdCheck(userid)+"";
	}
}
