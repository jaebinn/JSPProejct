<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<c:set var="cp" value="${pageContext.request.contextPath}"
   scope="session" />
<html>
   <head>
      <title>everycare</title>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="icon" href="${cp}/images/everycare.ico" />
      <script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="${cp}/css/main.css"/>
      <link rel="stylesheet" href="${cp}/css/paymentLst.css"/>
   </head>
   <body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">
         
            <!-- Header -->
               <header id="header">
                  <!-- Logo -->
                     <div class="logo">
                        <a href="${cp}/index.jsp"><strong>everycare</strong></a>
                     </div>
                  <!-- Nav -->
               </header>
            <!-- 여기부터-------------------------------------- -->
            <!-- Section -->
               <section id="one" class="main alt">
                  <header id="he">
                     <img src="${cp}/images/matchicon.png" id="icon">
                     <br>
                     <p>서비스이용 내역을 확인하실 수 있습니다!</p>
                  </header>
                  <div class="inner alt">
                     <div class="content">
                        <c:choose>
                           <c:when test="${list != null and list.size() > 0}">
                               <c:forEach var="i" begin="0" end="${list.size() - 1}">
                                  <c:set var="p" value="${list[i]}"/>
                                  <div id=valueArea>
                                  <a href="${cp}/expertPaymentDetailView.pm?payment_idx=${p.payment_idx}">
                                     <table>
                                        <tr>
                                           <td>매칭번호</td>
                                           <td>${p.payment_idx}</td>
                                        </tr>
                                        <tr>
                                           <td>유저아이디</td>
                                           <td>${p.user_id}</td>
                                        </tr>
                                        <tr>
                                           <td>전문가</td>
                                           <td>${p.expert_name}</td>
                                        </tr>
                                        <tr>
                                           <td>키워드</td>
                                           <td>${p.keyword}</td>
                                        </tr>
                                        <tr>
                                           <td>서비스날짜</td>
                                           <td>${p.service_day}</td>
                                        </tr>
                                        <tr>
                                           <td>서비스시간</td>
                                           <td>${p.start_date} ~ ${p.end_date}</td>
                                        </tr>
                                     </table>
                                  </a>
                                  <hr>
                                  </div>
                                  <br>
                               </c:forEach>
                           </c:when>
                           <c:otherwise>
                              <tr>
                                 <td>매칭내역이 없습니다.</td>
                              </tr>
                           </c:otherwise>
                        </c:choose>
                     </div>
                  </div>
                  <br>
                  <div id="pagenumArea">
                     <table id="pagenum">
                        <tbody>
                           <tr>
                              <td>
                              <c:if test="${startPage != 1}">
                                 <a class="btn" href="${cp}/test.pm?page=${startPage-1}">&lt;</a>
                              </c:if> 
                              <c:forEach begin="${startPage}" end="${endPage}" var="i">
                                 <c:choose>
                                    <c:when test="${page == i}">
                                       <span class="nowPage">${i}</span>
                                    </c:when>
                                    <c:otherwise>
                                       <a class="btn" href="${cp}/getpaymentlist.pm?page=${i}">${i}</a>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach> <c:if test="${endPage != totalPage}">
                              <a class="btn" href="${cp}/getpaymentlist.pm?page=${endPage+1}">&gt;</a>
                              </c:if>
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>
               </section>
            <!-- 여기까지 ------------------------------------------->
            <!-- Footer -->
            <footer id="footer">
               <div class="inner">
                  <section>
                     <h3>EveryCare</h3>
                     <p>EveryCare는 사용자들의 개인 정보와 상담 내용을 철저히 보호하며, 안전한 결제 시스템을 통해 사용자들이 안심하고 서비스를 이용할 수 있도록 최선을 다하고 있습니다.</p>
                     <ul class="icons">
                        <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
                     </ul>
                  </section>
                  <section class="narrow">
                     <h4>EveryCare SNS</h4>
                     <ul class="links">
                        <li><a href="#">인스타그램</a></li>
                        <li><a href="#">페이스북</a></li>
                        <li><a href="#">유튜브</a></li>
                     </ul>
                  </section>
                  <section class="narrow">
                     <h4>EveryCare 오픈채팅</h4>
                     <ul class="links">
                        <li><a href="#">링크</a></li>
                        <li><a href="#">Vulputate tristique</a></li>
                        <li><a href="#">Ultrices nulla</a></li>
                        <li><a href="#">Cursus sed magna</a></li>
                        <li><a href="#">Sed lectus donec</a></li>
                     </ul>
                  </section>
                  <section>
                     <h3>고객센터</h3>
                     <p>EveryCare 고객센터는 여러분의 궁금증이나 문의사항에 친절하고 신속하게 대응해 드립니다. 저희 팀은 24시간 365일 연중무휴로 운영되며, 다음과 같은 서비스를 제공합니다.<p>
                     <p><a href="#" class="major">(000) 000-0000</a></p>
                  </section>
               </div>
               <div class="copyright">
                  <p>&copy; EveryCare. All rights reserved.</p>
               </div>
            </footer>
         </div>

      <!-- Scripts -->
   <script src="${cp}/js/jquery.min.js"></script>
   <script src="${cp}/js/jquery.dropotron.min.js"></script>
   <script src="${cp}/js/jquery.selectorr.min.js"></script>
   <script src="${cp}/js/jquery.scrollex.min.js"></script>
   <script src="${cp}/js/jquery.scrolly.min.js"></script>
   <script src="${cp}/js/browser.min.js"></script>
   <script src="${cp}/js/breakpoints.min.js"></script>
   <script src="${cp}/js/util.js"></script>
   <script src="${cp}/js/main.js"></script>

   </body>
</html>