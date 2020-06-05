package com.koitt.tim.service.event;

import java.util.List;

import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.event.EventReplyBean;
import com.koitt.tim.dto.event.EventCouponBean;

public interface EventService {

	// 글보기,쿠폰
	EventCouponBean selectEventView(String ev_num);

	// 이전글,다음글
	List<EventDto> selectEventPreNext(int rnum);

	// 댓글가져오기
	List<EventReplyBean> selectEventReply(String event_num);

	// 글목록보기(search)-----------------------------------
	List<EventDto> selectEvent(int pageNum, String search, String text);

	List<Integer> getPageList(int pageNum, String search, String text);

	// 전체글 리스트 카운트(search)
	int getListCount(String search, String text);

	// 마지막페이지 번호를 알려줌
	int getLastNum(double cnt);
}
