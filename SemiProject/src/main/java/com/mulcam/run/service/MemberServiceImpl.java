package com.mulcam.run.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mulcam.run.dao.MemberDAO;
import com.mulcam.run.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Override
	public boolean memOverlap(String id) throws Exception {
		Member mem=memberDAO.queryMember(id);
		if(mem==null) return false;
		return true;
	}

	@Override
	public void makeMember(Member mem) throws Exception {
		memberDAO.insertMember(mem);
	}

	@Override
	public boolean accessMember(String id, String password) throws Exception {
		Member mem=memberDAO.queryMember(id);
		if(id.equals(mem.getId())&&password.equals(mem.getPassword())) {
			return true;
		} else if(id.equals(mem.getId())&&!password.equals(mem.getPassword())) {
			throw new Exception("비밀번호가 일치하지 않습니다");
		} else return false;
	}

	@Override
	public List<Member> AllMemberList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertMember(Member mem) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(Member mem) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(String phone, String address) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertImg(String id, String userimg) throws Exception {
		// TODO Auto-generated method stub
		
	}

	
}
