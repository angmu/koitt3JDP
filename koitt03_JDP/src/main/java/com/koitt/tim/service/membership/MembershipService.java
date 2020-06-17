package com.koitt.tim.service.membership;

import com.koitt.tim.dto.member.MemberDto;

public interface MembershipService {

	int loginCheck(String id, String pw);

	int signUp(MemberDto dto);

	MemberDto getMemInfo(String id);

	int getNonMemInfo(String o_num, String orderTel);

	String searchId(String name, String email);

	String searchPw(String id, String email);
}
