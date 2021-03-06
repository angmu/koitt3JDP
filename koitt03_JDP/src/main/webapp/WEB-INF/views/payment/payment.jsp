<%--        이준희
  Created by IntelliJ IDEA.
  User: user
  Date: 2020-06-01
  Time: 오후 2:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../common/header.jsp"/>

<script src="/js/jquery.min.js"></script>
<script src="/js/getSessionInfo.js"></script>
<script src="/js/payee.js"></script>

<script src="/js/couponBook.js"></script>
<%--<script>--%>
<%--    function setParent() {--%>

<%--    var list = [];--%>
<%--    var coupons = document.getElementsByName("chBox");--%>

<%--    coupons.forEach((c) => {--%>
<%--    if (c.checked === true) {--%>
<%--    list.push(parseInt(c.value));--%>
<%--    }--%>
<%--    })--%>
<%--    var sum = list.reduce((a, b) => a + b);--%>


<%--    opener.document.getElementById("pInput").value = sum;--%>
<%--    opener.document.getElementById("pInput1").value = sum;--%>




<%--}--%>

<%--  </script>--%>

<%--<%session.setAttribute("adtmin", "abcd1234"); %>--%>
<!-- container -->
<div id="container" onload="javascript:getProduct();">

    <div id="location">
        <ol>
            <li><a href="#">HOME</a></li>
            <li class="last">주문/결제</li>
        </ol>
    </div>

    <div id="outbox">

        <!-- maxcontents -->
        <div id="maxcontents">
            <div id="mypage">
                <h2><strong>주문/결제</strong></h2>

                <!-- 주문 상품 -->
                <h3 class="dep">주문 제품 확인</h3>
                <div class="orderDivNm">
                    <table summary="주문 제품 확인 게시판으로 상품명, 가격, 수량, 합계순으로 조회 하실수 있습니다." class="orderTable" border="1"
                           cellspacing="0">
                        <caption>주문 제품 확인</caption>
                        <colgroup>
                            <col width="*"/>
                            <col width="16%" class="tnone"/>
                            <col width="14%"/>
                            <col width="16%" class="tw28"/>
                        </colgroup>

                        <thead>
                        <th scope="col">상품명</th>
                        <th scope="col" class="tnone">가격/포인트</th>
                        <th scope="col">수량</th>
                        <th scope="col">합계</th>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="left">
                                <p class="img"><img src="${dto.front_image1}" alt="상품" width="66"
                                                    height="66"/></p>

                                <ul class="goods">
                                    <li>
                                        <a href="/product/detail?pro_num=${dto.pro_num}">${dto.product_name}</a>
                                    </li>
                                </ul>
                            </td>
<%--                            <script>--%>
<%--                                $(document).ready(function(${pDto}){--%>

<%--                                    const productDto = JSON.parse(${pDto});--%>
<%--                                    var pinValue=${spin};--%>

<%--                                    const $proDto_price = $('.proDto_price');--%>
<%--                                    $proDto_price.val(productDto.product_price);--%>

<%--                                    const $proDto_total = $('.proDto_total');--%>
<%--                                    $proDto_total.val(productDto.product_price * pinValue);--%>

<%--                                    }--%>
<%--                                );--%>

<%--                            </script>--%>
                            <td class="tnone">
                                ${dto.product_price} 원
                                <!-- 회원일 시 -->
                                <br/><span class="pointscore">${dto.point} Point</span>
                                <!-- //회원일 시 -->
                            </td>

                            <td>${spin} 개</td>
                           <c:set var="total" value="${dto.product_price * spin}"/>
                            <td>${total} 원</td>
                        </tr>


                        </tbody>
                    </table>
                </div>
                <div class="poroductTotal">
                    <ul>
                        <li>상품 합계금액 <strong>${total}</strong> 원</li>
                        <li>+ 배송비 <strong>2,500</strong> 원</li>
                        <li>= 총 합계 <strong>${total +2500}</strong> 원</li>
                    </ul>
                </div>
                <!-- //주문 상품 -->


                <!-- 주문자 주소 입력 -->
                <h3 class="diviLeft">주문자 주소 입력</h3>
                <div class="diviRight">
                    <%
                        if (!(session == null || !request.isRequestedSessionIdValid())) {
                    %>
                    <ul>
                        <li>수정 내용을 회원정보에도 반영합니다.&nbsp;&nbsp;</li>
                        <li>
                            <a onclick=memberCheck('${spin}','${dto.pro_num}')>회원정보수정</a>
<%--                            <a onclick=memberCheck('${mDto}')>회원정보반영</a>--%>
                        </li>

                    </ul>
                    <%
                        }
                    %>
                </div>

                <div class="checkDiv">
                    <table summary="주문자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable"
                           border="1" cellspacing="0">
                        <caption>주문자 주소 입력</caption>
                        <colgroup>
                            <col width="22%" class="tw30"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span>이름</span></th>
                            <td><input type="text" id="orderName" class="w134" value="${memDto.name}"/></td>
                        </tr>

                        <tr>
                            <th scope="row"><span>주소</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="text" id="orderAddress1" class="w134" value="${memDto.address1}"/>&nbsp;
                                    </li>

                                    <li><a href="../member/zip.html" class="addressBtn"><span>우편번호 찾기</span></a></li>
                                    <li class="pt5"><input type="text" id="orderAddress2" class="addressType2" value="${memDto.address2}"/></li>
                                    <li class="pt5"><input type="text" id="orderAddress3" class="addressType2" value="${memDto.address3}"/></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>이메일</span></th>
                            <td>
                                <ul class="pta">
                                    <li><input type="text" id="orderEmail1" class="w134" value="${memDto.email1}"/></li>
                                    <li><span class="valign">&nbsp;@&nbsp;</span></li>
                                    <li class="r10"><input type="text" id="orderEmail2" class="w134" value="${memDto.email2}"/></li>

                                    <li>
                                        <select id="emailList" onchange="emailChange()">
                                            <option value="#" selected="selected">직접입력</option>
                                            <option value="naver.com">naver.com</option>
                                            <option value="daum.net">daum.net</option>
                                            <option value="hanmail.net">hanmail.net</option>
                                            <option value="nate.com">nate.com</option>
                                            <option value="yahoo.co.kr">yahoo.co.kr</option>
                                            <option value="paran.com">paran.com</option>
                                            <option value="empal.com">empal.com</option>
                                            <option value="hotmail.com">hotmail.com</option>
                                            <option value="korea.com">korea.com</option>
                                            <option value="lycos.co.kr">lycos.co.kr</option>
                                            <option value="dreamwiz.com">dreamwiz.com</option>
                                            <option value="hanafos.com">hanafos.com</option>
                                            <option value="chol.com">chol.com</option>
                                            <option value="gmail.com">gmail.com</option>
                                            <option value="empas.com">empas.com</option>
                                        </select>&nbsp;&nbsp;&nbsp;
                                        <script>
                                            function emailChange() {

                                                var email = ${memDto.email};
                                                var reg = email.split('@');
                                                document.getElementById("orderEmail1").value=reg[0];
                                                document.getElementById("orderEmail2").value=reg[1];
                                                console.log(reg[0]);
                                                console.log(reg[1]);

                                                // //이메일 파싱///////////////
                                                // const $log = mDtoObj.email;
                                                // const $reg = $log.split('@');
                                                // const $email_first = $('#orderEmail1');
                                                // const $email_last = $('#orderEmail2');
                                                // $email_first.val($reg[0]);
                                                // $email_last.val($reg[1]);

                                                document.getElementById("orderEmail2").text = document.getElementsByName("emailList")[document.getElementsByName("emailList").selectedIndex].value;
                                                document.getElementById("orderEmail2").onchange();
                                            }
                                        </script>
                                    </li>

                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>휴대폰 번호</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="text" id="orderTel" class="w74" maxlength="30" value="${memDto.tel}"/>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>전화번호</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="text" id="orderTel2" class="w74" maxlength="30" value="${memDto.phone}"/>
                                    </li>
                                </ul>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <!-- //주문자 주소 입력 -->


                <!-- 수취자 주소 입력 -->
                <h3 class="dep">
                    수취자 주소 입력
                    <%
                        if (!(session == null || !request.isRequestedSessionIdValid())) {
                    %>
                    <a id="infosame" onclick="sameMemberInfo()" >
                    <label for="infosame">회원정보와 동일</label>
                    <%
                        }
                    %>
                </h3>
                <div class="checkDiv">
                    <table summary="수취자 주소를 입력할 수 있는 란으로 이름, 주소, 이메일, 휴대폰 번호, 전화번호 순으로 입력 하실수 있습니다." class="checkTable"
                           border="1" cellspacing="0">
                        <caption>수취자 주소 입력</caption>
                        <colgroup>
                            <col width="22%" class="tw30"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span>이름</span></th>
                            <td><input type="text" class="w134" id="payeeName"/></td>
                        </tr>

                        <tr>
                            <th scope="row"><span>주소</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="text" id="payeeAddress1" class="w134"/>&nbsp;
                                    </li>
                                    <li><a href="../member/zip.html" class="addressBtn"><span>우편번호 찾기</span></a></li>
                                    <li class="pt5"><input type="text" id="payeeAddress2" class="addressType2"/></li>
                                    <li class="pt5"><input type="text" id="payeeAddress3" class="addressType2"/></li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>휴대폰 번호</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="text" id="payeeTel" class="w74" maxlength="30"/>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>전화번호</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="text" id="payeePhone" class="w74" maxlength="30"/>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><span>배송시 <u>요구사항</u></span></th>
                            <td><textarea class="demandtta" id="payeeDemmand" ></textarea></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //수취자 주소 입력 -->


                <!-- 쿠폰 및 포인트 사용 -->
                <h3 class="dep">쿠폰 및 포인트 사용</h3>
                <div class="checkDiv">
                    <table summary="쿠폰 및 포인트를 입력 또는 확인 할 수 있는 란으로 총 주문금액, 배송비, 쿠폰할인, 포인트 사용, 총 결제금액 순으로 입력 또는 확인 하실수 있습니다."
                           class="checkTable" border="1" cellspacing="0">
                        <caption>쿠폰 및 포인트 사용</caption>
                        <colgroup>
                            <col width="22%" class="tw30"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span>총 주문금액</span></th>
                            <td>${total} 원</td>
                        </tr>
                        <tr>
                            <th scope="row"><span>배송비</span></th>
                            <td>2,500 원 (선불)</td>
                        </tr>
                        <tr>


                            <th scope="row"><span>쿠폰 할인</span></th>
                            <td>
                                <ul class="pta">
                                    <li class="r10">
                                        <input type="text" class="w134" id="pInput" readonly onchange="finalTotal()"/>&nbsp;&nbsp;
                                        <span class="valign"><strong>원</strong></span>
                                    </li>
                                    <li class="r10"><span class="valign">( 보유 쿠폰 내역 : ${couponCount} 장 )&nbsp;</span></li>
                                    <input type="hidden" name="store" id="couponStore" value="">
                                    <li><a onclick="couponBook('${dto.pro_num}','${spin}')">쿠폰목록</a></li>

<%--                                <li><a href="coupon_list?pro_num=${dto.pro_num}&&id='<%=session.getAttribute("admin")%>'&&spin=${spin}">쿠폰목록</a></li>--%>

                                </ul>
                            </td>
                        </tr>


                        <!-- 회원 일시 -->
                        <tr>
                            <th scope="row"><span>포인트 사용</span></th>
                            <td>
                                <ul class="pta">
                                    <li class="r10">
                                        <input type="text" id="usePoint" class="w134" value="0" onchange="finalTotal()" />&nbsp;&nbsp;
                                        <span class="valign"><strong>Point</strong></span>
                                    </li>
                                    <li>
                                        <span class="valign">( 사용 가능 포인트 : </span>
                                        <span id="pointInput" class="orange" onchange="finalTotal()">${memDto.point}</span>
                                        <span class="valign"> Point)</span>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        <!-- //회원 일시 -->


                        <tr>
                            <th scope="row"><span>총 결제금액</span></th>
                            <td>
                                <ul class="pta">
                                    <li><span class="valign"><strong id="finallyTotal">${total+2500} </strong><span>원</span> <%--( ${total}원 + 배송비 2,500 원 - 쿠폰 <span id="pInput1"></span> 원 - 포인트 <span>${memDto.point}</span> 원)--%>
                                    </li>
                                    <script>
                                        function finalTotal(){

                                            const total=Number(${total});
                                            const coupon = Number(document.getElementById("pInput").value);
                                            const point = Number(document.getElementById("usePoint").value);

                                            console.log(total);
                                            console.log(coupon);
                                            console.log(point);

                                            const money = total+ 2500 -(coupon + point);
                                            console.log(money);

                                            $('#usePointPrint').text(point);
                                            $('#finallyTotal').text(money);
                                            $('#finallyTotal2').text(money);

                                            //$orderName.val(mDtoObj.name);
                                            //$('#totalCoupon').text(total+parseInt(coupon));
                                        }
                                     </script>


                                </ul>
                            </td>

                        </tr>

                        </tbody>
                    </table>
                </div>
                <!-- //쿠폰 및 포인트 사용 -->


                <!-- 총 주문금액 -->
                <div class="amount">

                    <!-- 회원 일때 -->
                    <h4 class="member">총 주문금액</h4>
                    <!-- 회원 일때 -->
                    <!-- 비회원 일때  <h4>총 주문금액</h4> //비회원 일때 -->

                    <ul class="info">
                        <li>
                            <span class="title">상품 합계금액</span>
                            <span class="won"><strong>${total}</strong> 원</span>
                        </li>
                        <li>
                            <span class="title">배송비</span>
                            <span class="won"><strong>2,500</strong> 원</span>
                        </li>

                        <!-- 회원 일때만 -->
                        <li>
                            <span class="title">포인트 할인</span>
                            <span class="won"><strong><span id="usePointPrint"></span> </strong> P</span>
                        </li>
                        <script>
                            $('#usePointPrint').value = $('#usePoint').value;
                        </script>
                        <li>
                            <span class="title">쿠폰 할인</span>
                            <span class="won"><strong><span id="pInput1">원</span></strong> </span>
                        </li>
                        <!-- //회원 일떄만 -->
                    </ul>

                    <ul class="total">
                        <!-- 회원 일때만 -->
                        <li class="mileage">(적립 포인트 <strong>xxxxxx</strong> Point)</li>
                        <!-- //회원 일때만 -->

                        <li class="txt"><strong>결제 예정 금액</strong></li>
                        <li class="money"><span id="finallyTotal2">${total+2500}</span> 원</li>
                    </ul>
                </div>
                <!-- //총 주문금액 -->

                <!-- 결제수단 선택 -->
                <h3 class="dep">결제수단 선택</h3>
                <div class="checkDiv">
                    <table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다."
                           class="checkTable" border="1" cellspacing="0">
                        <caption>결제수단 선택</caption>
                        <colgroup>
                            <col width="22%" class="tw30"/>
                            <col width="*"/>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row"><span>결제수단</span></th>
                            <td>
                                <ul class="pta">
                                    <li>
                                        <input type="radio" id="method01" name="method" checked="checked"/><label
                                            for="method01">신용카드 결제</label>
                                    </li>
                                    <li>
                                        <input type="radio" id="method02" name="method"/><label for="method02">실시간
                                        계좌이체</label>
                                    </li>
                                    <li>
                                        <input type="radio" id="method03" name="method"/><label
                                            for="method03">가상계좌</label>
                                    </li>
                                    <li>
                                        <input type="radio" id="method04" name="method"/><label for="method04">가상계좌(에스크로)</label>
                                    </li>
                                    <li>
                                        <input type="radio" id="method05" name="method"/><label for="method05">무통장
                                        입금</label>
                                    </li>
                                </ul>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <!-- //결제수단 선택 -->

                <div class="disnone method01"><!-- 신용카드 -->
                    <p class="orderalert"><strong>[신용카드]</strong> 온라인상에서 소유하신 신용카드를 통해, 전자결제를 진행합니다.</p>
                </div>
                <div class="disnone method02"><!-- 실시간 계좌이체 -->
                    <p class="orderalert"><strong>[실시간 계좌이체]</strong> 주민번호, 계좌 정보, 공인인증서를 통해 실시간 계좌이체를 진행합니다.</p>
                </div>
                <div class="disnone method03"><!-- 가상계좌 -->
                    <p class="orderalert"><strong>[가상계좌]</strong> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접 송금합니다.</p>
                </div>
                <div class="disnone method04"><!-- 가상계좌 에스크로 -->
                    <p class="orderalert"><strong>[가상계좌 에스크로]</strong> 원하시는 은행으로 가상계좌를 발급해 드리며, 발급된 계좌로 구매대금을 직접
                        송금합니다.(에스크로 안전결제)</p>
                </div>

                <div class="disnone method05"><!-- 무통장 입금 -->
                    <p class="orderalert"><strong>[무통장 입금]</strong> 쇼핑몰의 대표 계좌로 구매대금을 직접 송금합니다.</p>

                    <div class="checkDiv">
                        <table summary="신용카드 결제, 실시간 계좌이체, 가상계좌, 가상계좌(에스크로), 무통장 입금 순으로 결제수단을 선택하실 수 있습니다."
                               class="checkTable" border="1" cellspacing="0">
                            <caption>결제수단 선택</caption>
                            <colgroup>
                                <col width="22%" class="tw30"/>
                                <col width="*"/>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th scope="row"><span>입금은행</span></th>
                                <td>
                                    <select name="bank">
                                        <option value="">선택하세요.</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th scope="row"><span>입금자 명</span></th>
                                <td><input type="text" class="w134"/></td>
                            </tr>
                            <tr>
                                <th scope="row"><span>영수증 신청</span></th>
                                <td>
                                    <select name="receiptChk">
                                        <option value="none">신청안함</option>
                                        <option value="individual">개인소득공제</option>
                                        <option value="corporate">사업자 지출증빙</option>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <!-- 개인소득공제 -->
                    <div class="receipt individual">
                        <dl>
                            <dt>발급방식</dt>
                            <dd>
                                <ul>
                                    <li><input type="radio" name="individual" id="phone" checked="checked"/><label
                                            for="phone">휴대폰</label></li>
                                    <li><input type="radio" name="individual" id="securitynumber"/><label
                                            for="securitynumber">주민등록번호</label></li>
                                    <li><input type="radio" name="individual" id="cashreceipts"/><label class="fn"
                                                                                                        for="cashreceipts">현금영수증카드</label>
                                    </li>
                                </ul>
                            </dd>
                        </dl>

                        <ul class="inform phone"><!-- 휴대폰 -->
                            <li class="title">이름</li>
                            <li class="interval"><input type="text" class="w134"/></li>
                            <li class="title cb">휴대폰</li>
                            <li><input type="text" class="w134"/></li>
                        </ul>

                        <ul class="inform securitynumber"><!-- 주민등록번호 -->
                            <li class="title">이름</li>
                            <li class="interval"><input type="text" class="w134"/></li>
                            <li class="title cb">주민등록번호</li>
                            <li><input type="text" class="w134"/></li>
                        </ul>

                        <ul class="inform cashreceipts"><!-- 현금영수증카드 -->
                            <li class="title">이름</li>
                            <li class="interval"><input type="text" class="w134"/></li>
                            <li class="title2 cb">현금영수증카드 번호</li>
                            <li><input type="text" class="w134"/></li>
                        </ul>

                        <p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
                    </div>
                    <!-- //개인소득공제 -->

                    <!-- 사업자 지출증빙 -->
                    <div class="receipt corporate">
                        <dl>
                            <dt>발급방식</dt>
                            <dd>
                                <ul>
                                    <li><input type="radio" name="corporate" id="corporatenumber"
                                               checked="checked"/><label for="corporatenumber">사업자번호</label></li>
                                    <li><input type="radio" name="corporate" id="corporate_cash"/><label class="fn"
                                                                                                         for="corporate_cash">현금영수증카드</label>
                                    </li>
                                </ul>
                            </dd>
                        </dl>

                        <ul class="inform corporatenumber"><!-- 사업자번호 -->
                            <li class="title">이름</li>
                            <li class="interval"><input type="text" class="w134"/></li>
                            <li class="title2 cb">사업자등록 번호</li>
                            <li><input type="text" class="w134"/></li>
                        </ul>

                        <ul class="inform corporate_cash"><!-- 현금영수증카드 -->
                            <li class="title">이름</li>
                            <li class="interval"><input type="text" class="w134"/></li>
                            <li class="title2 cb">현금영수증카드 번호</li>
                            <li><input type="text" class="w134"/></li>
                        </ul>

                        <p class="txt">* 번호 입력시 하이픈(-)을 제외한 숫자만 입력하세요.</p>
                    </div>
                    <!-- //사업자 지출증빙 -->

                </div>


                <!-- Btn Area -->
                <div class="btnArea">
                    <div class="orderCenter">
                        <ul>
                            <li><a href="#" class="nbtnbig iw0140">뒤로가기</a></li>
                            <li><a onclick="orderSuccess()" class="sbtnMini iw0140">주문 / 결제</a></li>
                        </ul>
                        <script>
                            function orderSuccess() {

                                var pro_num = ${dto.pro_num};   //상품 번호
                                var pro_name = ${dto.product_name}; //상품 이름
                                var pro_price = $('#finallyTotal2').text;   //최종 비용
                                <%--var spin = ${spin};--%>
                                console.log(pro_num);
                                console.log(pro_name);
                                console.log(pro_price);

                                var useCouponNum = document.getElementById("couponStore").value;
                                 var orderPoint = document.getElementById("usePoint").value;      //사용 포인트
                                var orderName = document.getElementById("orderName").value;      //주문자 이름
                                var orderTel = document.getElementById("orderTel").value;        //주문자 번호
                                var orderCost = document.getElementById("finallyTotal").innerText;   //주문 비용

                                location.href="order_clear?useCoupon="+useCouponNum+"&orderPoint="+orderPoint+"&orderName="+orderName+"&orderCost="+orderCost+"&orderTel="+orderTel+"&spinner="+String(${spin})+"&pro_num="+pro_num+"&pro_name="+pro_name+"&pro_price="+pro_price;

                            }

                        </script>
                    </div>
                </div>
                <!-- //Btn Area -->


            </div>
        </div>
        <!-- //maxcontents -->

<%--
        <script type="text/javascript" src="js/jquery.fancybox-1.3.4.pack.js"></script>
        <link rel="stylesheet" type="text/css" href="css/jquery.fancybox-1.3.4.css"/>--%>
<%--        <script type="text/javascript">--%>
<%--            $(function () {--%>
<%--                // select, radio - display check--%>

<%--                // 1 Step Radio--%>
<%--                var firstchk = $("input:radio[name=method]:checked").attr("id");--%>
<%--                $("div." + firstchk).css("display", "block");--%>
<%--                $("input:radio[name=method]").click(function () {--%>
<%--                    var divchk = $(this).attr("id");--%>
<%--                    $(".disnone").css("display", "none");--%>
<%--                    $("div." + divchk).css("display", "block");--%>
<%--                });--%>

<%--                // 2 Step 영수증 Select--%>
<%--                var firstselect = $("select[name=receiptChk] option:selected").attr("value");--%>
<%--                $("div." + firstselect).css("display", "block");--%>
<%--                $("select[name=bank]").css("width", "125px");--%>
<%--                $("select[name=receiptChk]").css("width", "112px");--%>
<%--                $("select[name=receiptChk]").change(function () {--%>
<%--                    $(".receipt").css("display", "none");--%>
<%--                    if ($(this).val() == "none") {--%>
<%--                        $(".receipt").css("display", "none");--%>
<%--                    } else if ($(this).val() == "individual") {--%>
<%--                        $(".individual").css("display", "block");--%>
<%--                    } else {--%>
<%--                        $(".corporate").css("display", "block");--%>
<%--                    }--%>

<%--                    var firstindi = $("input:radio[name=individual]:checked").attr("id");--%>
<%--                    var firstcorp = $("input:radio[name=corporate]:checked").attr("id");--%>
<%--                    $("ul." + firstindi).css("display", "block");--%>
<%--                    $("ul." + firstcorp).css("display", "block");--%>
<%--                });--%>

<%--                // 3-1 Step 발급방식 - 개인--%>
<%--                var firstindi = $("input:radio[name=individual]:checked").attr("id");--%>
<%--                $("ul." + firstindi).css("display", "block");--%>
<%--                $("input:radio[name=individual]").click(function () {--%>
<%--                    var divchk = $(this).attr("id");--%>
<%--                    $(".inform").css("display", "none");--%>
<%--                    $("ul." + divchk).css("display", "block");--%>
<%--                });--%>

<%--                // 3-2 Step 발급방식 - 사업자--%>
<%--                var firstcorp = $("input:radio[name=corporate]:checked").attr("id");--%>
<%--                $("ul." + firstcorp).css("display", "block");--%>
<%--                $("input:radio[name=corporate]").click(function () {--%>
<%--                    var divchk = $(this).attr("id");--%>
<%--                    $(".inform").css("display", "none");--%>
<%--                    $("ul." + divchk).css("display", "block");--%>
<%--                });--%>


<%--                // layer popup--%>
<%--                var winWidth = $(window).width();--%>
<%--                if (winWidth > 767) {--%>
<%--                    var layerCheck = 540;--%>
<%--                    var couponCheck = 760;--%>
<%--                } else {--%>
<%--                    var layerCheck = 320;--%>
<%--                    var couponCheck = 320;--%>
<%--                }--%>

<%--                $(".addressBtn").fancybox({--%>
<%--                    'autoDimensions': false,--%>
<%--                    'showCloseButton': false,--%>
<%--                    'width': layerCheck,--%>
<%--                    'padding': 0,--%>
<%--                    'type': 'iframe',--%>
<%--                    'onComplete': function () {--%>
<%--                        $('#fancybox-frame').load(function () { // wait for frame to load and then gets it's height--%>
<%--                            $('#fancybox-content').height($(this).contents().find('body').height());--%>
<%--                        });--%>
<%--                    }--%>
<%--                });--%>

<%--                $(".nbtn").fancybox({--%>
<%--                    'autoDimensions': false,--%>
<%--                    'showCloseButton': false,--%>
<%--                    'width': couponCheck,--%>
<%--                    'padding': 0,--%>
<%--                    'type': 'iframe',--%>
<%--                    'onComplete': function () {--%>
<%--                        $('#fancybox-frame').load(function () { // wait for frame to load and then gets it's height--%>
<%--                            $('#fancybox-content').height($(this).contents().find('body').height());--%>
<%--                            $('#fancybox-wrap').css('top', '400px');--%>
<%--                            $('html,body').animate({scrollTop: 400}, 500);--%>
<%--                        });--%>
<%--                    }--%>
<%--                });--%>


<%--            });--%>
<%--        </script>--%>


    </div>
</div>
<!-- //container -->

<jsp:include page="../common/footer.jsp"/>