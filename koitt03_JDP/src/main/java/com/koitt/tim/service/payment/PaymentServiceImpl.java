//이준희
package com.koitt.tim.service.payment;

import com.koitt.tim.dao.member.MemberDao;
import com.koitt.tim.dao.payment.PaymentDao;
import com.koitt.tim.dao.product.ProductDao;
import com.koitt.tim.dto.member.MemberDto;
import com.koitt.tim.dto.product.ProductDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService {

    @Autowired
    private PaymentDao paymentDao;
    @Autowired
    private ProductDao productDao;
    @Autowired
    private MemberDao memberDao;

    public ProductDto selectOne(String pro_num){
        ProductDto productDto = productDao.selectProductOne(pro_num);
        productDto.setPoint();
        return productDto;
    }
    @Override
    public MemberDto selectOneMember(String member_id) {
        return memberDao.selectOneMember(member_id);
    }

}
