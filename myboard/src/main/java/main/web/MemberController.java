package main.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
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
	
	@RequestMapping("/post1.do")
	public String post1() {
		
		return "member/post1";
	}

	@RequestMapping("/post2.do")
	public String post2(String dong, ModelMap model) throws Exception {
		
		List<?> resultList = memberService.selectPostList(dong);
		
		if(resultList == null || resultList.isEmpty()) {
			model.addAttribute("errorMsg", "검색된 주소가 없습니다.");
			return "member/post1";
		}
		model.addAttribute("resultList", resultList);
		return "member/post2";
	}
	
	@RequestMapping("/loginWrite.do") 
	public String loginWrite() {
		
		return "member/loginWrite";
	}
	
	@RequestMapping("/loginWriteSub.do")
	@ResponseBody
	public String selectMemberCount(MemberVO vo, HttpSession session) throws Exception {
		
		if(memberService.selectMemberIdCheck(vo.getUserid())==0) return "-1";

		if(memberService.selectMemberCount(vo)==1) {
			session.setAttribute("SessionUserId", vo.getUserid());
			return "ok";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		
		session.removeAttribute("SessionUserId");
		return "member/loginWrite";
	}
	
	@RequestMapping("/memberPassCheck.do")
	public String memberPassCheck(HttpSession session, ModelMap model) throws Exception {
		
		String userid = (String) session.getAttribute("SessionUserId");
		
		if(userid == null) return "redirect:/loginWrite.do";
		
		model.addAttribute("userid", userid);
		return "member/passWrite";
	}
	
	@RequestMapping("/memberPassCheck2.do")
	@ResponseBody
	public String memberPassCheck2(HttpSession session, String pass) throws Exception {
		
		String userid = (String) session.getAttribute("SessionUserId");
		
		if(userid == null) return "redirect:/loginWrite.do";
		
		MemberVO vo = new MemberVO();
		vo.setUserid(userid);
		vo.setPass(pass);

		return memberService.selectMemberCount(vo) > 0 ? "1" : "-1";
	}
	
	@RequestMapping("/memberModify.do")
	public String memberModify(HttpSession session, ModelMap model) throws Exception {
		
		String userid = (String) session.getAttribute("SessionUserId");
		
		if(userid == null) return "redirect:/loginWrite.do";
		
		MemberVO vo = memberService.selectMemberByUserid(userid);
		vo.setUserid(userid);
		vo.setBirthday(vo.getBirthday().substring(0,10));
		model.addAttribute("member", vo);
		return "member/memberModify";
	}
	
	@RequestMapping("/memberModifySave.do")
	@ResponseBody
	public String memberUpdate(MemberVO vo, HttpSession session) throws Exception {

        if (memberService.updateMember(vo) > 0)	return "ok";
        else return "fail";

	}
}
