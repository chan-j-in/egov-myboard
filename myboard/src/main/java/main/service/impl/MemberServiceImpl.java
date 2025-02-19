package main.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import main.service.MemberService;
import main.service.MemberVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Resource(name="memberDAO")
	private MemberDAO memberDAO;
	
	@Override
	public String insertMember(MemberVO vo) throws Exception {
		
		return memberDAO.insertMember(vo);
	}

	@Override
	public int selectMemberIdCheck(String userid) throws Exception {
		
		return memberDAO.selectMemberIdCheck(userid);
	}
}
