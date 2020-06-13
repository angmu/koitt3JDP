package com.koitt.tim.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.koitt.tim.dao.board.NoticeDao;
import com.koitt.tim.dao.category.CategoryDao;
import com.koitt.tim.dao.coupon.CouponDao;
import com.koitt.tim.dao.event.EventDao;
import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.product.MainProductDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dao.product.ProductSerialDao;
import com.koitt.tim.dao.product.RelatedProductDao;
import com.koitt.tim.dto.admin.MallDto;
import com.koitt.tim.dto.board.NoticeDto;
import com.koitt.tim.dto.category.CategoryDept1Dto;
import com.koitt.tim.dto.category.CategoryDept2Dto;
import com.koitt.tim.dto.coupon.CouponDto;
import com.koitt.tim.dto.event.EventDto;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductSerialDto;
import com.koitt.tim.dto.product.RelatedProductDto;

@Service
public class AdminServiceImpl implements AdminService {

//	@Autowired
//	private MallDao mallDao;
	@Autowired
	private MemberDao memberDao;
	@Autowired
	private EventDao eventDao;
	@Autowired
	private CouponDao couponDao;
	@Autowired
	private NoticeDao noticeDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private ProductSerialDao psDao;
	@Autowired
	private ProductDao pDao;
	@Autowired
	private RelatedProductDao rpDao;
	@Autowired
	private MainProductDao mpDao;

	@Override
	public MallDto getMallInfo() {
		return null;
	}

	@Override
	public List<MemberDto> getAllMembers() {
		return memberDao.selectAllMember();
	}

	@Override
	public List<EventDto> getAllEvents(int start, int end) {
		// return eventDao.selectEvent(start, end);
		return eventDao.selectEventforA();
	}

	@Override
	public List<CouponDto> getAllCoupons() {
		return couponDao.selectAllCoupon();
	}

	@Override
	public void insertEvent(EventDto eDto) {
		eventDao.insertEvent(eDto);
	}

	@Override
	public List<NoticeDto> getAllNotices() {
		// 공지사항공사중...임시로 넣었습니다.
		return noticeDao.selectAllNotice(1, 1, "", "");

	}

	@Override
	public void insertNotice(NoticeDto nDto) {
		noticeDao.insertNotice(nDto);
	}

	@Override
	public List<ProductDto> getAllProducts() {
		return productDao.selectProduct();
	}

	@Override
	public List<CategoryDept1Dto> getAllCate1() {
		return categoryDao.selectAllDept1();
	}

	@Override
	public List<CategoryDept2Dto> getAllCate2() {
		return categoryDao.selectAllDept2();
	}

	@Transactional
	@Override
	public void insertProduct(ProductSerialDto psDto, ProductDto pDto) {

		// 상품번호 넣기
		psDao.insertProductSerial(psDto);
		String pro_num = psDto.getPro_num();
		pDto.setPro_num(pro_num);

		// 상품 넣기
		pDao.insertProduct(pDto);
		// 연관상품 넣기
		rpDao.insertRProduct(pro_num);

		// 메인화면 상품 넣기
		mpDao.insertMProduct(pro_num);
	}

	@Override
	public List<RelatedProductDto> getAllRelatedProducts() {
		return rpDao.selectAllRProduct();
	}

	@Override
	public void insertRelatedProduct(String targetId, String additionId, String index) {
		String realIdx = "REC_PRO_NUM" + index;
		rpDao.insertRProductEach(targetId, additionId, realIdx);

	}

	@Override
	public void updateRelateProduct(String targetId, String index) {
		String realIdx = "REC_PRO_NUM" + index;
		rpDao.updateRProduct(targetId, realIdx);

	}

}
