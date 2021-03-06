package com.koitt.tim.controller.product;

import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductAnswerDto;
import com.koitt.tim.dto.product.ProductDto;
import com.koitt.tim.dto.product.ProductQuestionDto;
import com.koitt.tim.dto.product.RelatedProductDto;
import com.koitt.tim.dto.review.ReviewDto;
import com.koitt.tim.service.product.ProductService;
import com.koitt.tim.utils.CommonUtils;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Member;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Controller
@SessionAttributes("abcd1234")
@RequestMapping("product")
public class ProductController {

    @Autowired
    ProductService pServ;
    @Autowired
    CommonUtils utils;


    @RequestMapping("list")
    public String productList(HttpSession session, Model model) {
        List<ProductDto> list = pServ.getProductList();
        session.setAttribute("admin", "abcd1234");
        model.addAttribute("dtos", list);
        return "product/list";
    }

    @RequestMapping("detail")
    public String productDetail(String pro_num, Model model, @RequestParam(value = "page", defaultValue = "1") int page, @RequestParam(value = "pageQA", defaultValue = "1") int pageQA, @RequestParam(value = "pagePhoto", defaultValue = "1") int pagePhoto,
                                @RequestParam(value = "initVal", defaultValue = "0") String initVal) {

        List<ProductDto> relatedProduct = pServ.relatedProduct(pro_num); //상품번호로 연관상품 불러오기
        ProductDto pDto = pServ.getProductChoice(pro_num);  //상품번호로 상품 정보 불러오기

        List<ReviewDto> photoReviewDtos = pServ.getReviewPhotoList(pro_num, pagePhoto);       //상품번호로 상품 리뷰리스트 불러오기(포토리뷰)
        List<Integer> getPageListPhoto = pServ.getPageListPhoto(pro_num, pagePhoto);     //포토리뷰 페이징
        int lastNumPhoto = pServ.LastpageNumPhoto(pro_num); //포토리뷰 마지막 페이징 번호 호출


        List<ReviewDto> reviewDtos = pServ.getReviewList(pro_num, page);  //상품번호로 상품에 달린 리뷰 리스트 불러오기
        List<Integer> getPageList = pServ.getPageList(pro_num, page);   //리뷰 페이징
        int lastNum = pServ.LastpageNum(pro_num);   //페이징 마지막 번호 호출
        int allReview = pServ.getBoardCount(pro_num);   //해당 상품 전체 리뷰 카운트 호출


        int questionCount = pServ.getQuestionCount(pro_num);        //해당 상품 문의 카운트
        //List<ProductQuestionDto> pQuestionDtos = pServ.getPQuestion(pro_num);   //해당 상품 문의 불러오기
        List<HashMap<String, Object>> QAList = pServ.getQAList(pro_num, pageQA);       //해당 상품 문의/질의 전부 불러오기
        List<Integer> getPageListQA = pServ.getPageListQA(pro_num, pageQA);
        int allQA = pServ.getBoardCountQA(pro_num);  //해당 상품 전체 질문/문의 카운트
        int lastNumQA = pServ.LastpageNumQA(pro_num);  //페이징 마지막 번호 호출(질문/문의)


        model.addAttribute("initVal", initVal);

        model.addAttribute("dto", pDto);
        model.addAttribute("reviewDtos", reviewDtos);
        model.addAttribute("relProduct", relatedProduct);
        model.addAttribute("pageList", getPageList);
        //model.addAttribute("questDtos",pQuestionDtos);
        model.addAttribute("page", page);
        model.addAttribute("lastNum", lastNum);
        model.addAttribute("allReview", allReview);
        model.addAttribute("qCount", questionCount);

        model.addAttribute("pageQA", pageQA);
        model.addAttribute("qaList", QAList);
        model.addAttribute("pageListQA", getPageListQA);
        model.addAttribute("allQA", allQA);
        model.addAttribute("lastNumQA", lastNumQA);

        model.addAttribute("pagePhoto", pagePhoto);
        model.addAttribute("photoReviewDtos", photoReviewDtos);
        model.addAttribute("pageListPhoto", getPageListPhoto);
        model.addAttribute("lastNumPhoto", lastNumPhoto);

        return "product/detail";
    }

    @RequestMapping("review")   //detail 페이지에서 상품 리뷰 페이지 띄우기
    public String writeReview(Model model, String pro_num,HttpSession session) {

        String id="";
        if(session.getAttribute("loginInfo")!=null){
            MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
            id = mDto.getId();
        }
        //session.setAttribute("admin","abcd1234");

        model.addAttribute("id",id);
        model.addAttribute("pro_num", pro_num);

        return "mypage/ordercheck";
    }


    @RequestMapping("photo")
    public String writePhotoReview(Model model, String pro_num) {

        model.addAttribute("pro_num", pro_num);

        return "product/photo";
    }
    //리뷰추가  이미지 업로드 파일
    @RequestMapping(value=".addReview", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
    public String addReview(Model model ,@RequestParam(value="image",defaultValue = "")MultipartFile image,String stars,String title,String content,String proNum,String key,HttpSession session)throws Exception{

        MemberDto mDto = (MemberDto) session.getAttribute("loginInfo");
        String id = mDto.getId();
        String image1="";
        int check=1;

        if(!image.isEmpty()){
            image1=utils.FileUploaderCDN(image,"review/");
        }else{
            String nonimage="";
            image1=nonimage;
        }

        try{
            pServ.addReview(id,key,title,stars,content,image1,proNum);
        }catch(Exception e){
            e.printStackTrace();
            check=0;
        }

        model.addAttribute("check",check);
        System.out.println(check);
        return "product/photo";

    }

}
