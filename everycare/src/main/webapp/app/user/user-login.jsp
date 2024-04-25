<!--  로그인 jsp입니다.  -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<!DOCTYPE HTML>

<html>
<head>
<title>everycare</title>
<meta charset="utf-8" />
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/1924b51539.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<style>
h1{
	margin: 0 !important;
}
* {
   box-sizing: border-box;
}

.main {
   margin-top: 10%;
   padding: 0 30%;
   font-family: 'Pretendard-Regular' !important;
}

a {
   text-decoration: none;
   border-bottom: none;
}

#wrap {
   width: 90%;
   height: auto;
   text-align: center;
   border-radius: 50px;
   box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
   background-color: white;
   font-family: 'Pretendard-Regular' !important;
}

body {
   background: #f6f5f7;
   justify-content: center;
   align-items: center;
   margin: -20px 0 50px;
}
table th {
   text-align : center;
   font-weight: bold;
}

h1 {
   text-align: center;
   font-size: 40px;
}

.login>span {
   margin-top: 20px;
   margin-bottom: 20px;
   font-size: 50px;
}

.radius3 {
   display: flex;
   vertical-align: baseline;
   align-items : center;
   text-align: center;
   align-items: center;
   margin-left: 60px;
}

.radius3 div {
    margin-right : 20px;
}
</style>
</head>
<body class="is-preload">

   <!-- Wrapper -->
   <div id="wrapper">
      <!-- Header -->
      <header id="header">
         <!-- Logo -->
         <div class="logo">
            <a href="/index.jsp"><strong>&nbsp;&nbsp;&nbsp;EveryCare</strong>
               <span class="extra"></span></a>
         </div>
      </header>
      <!-- Section -->
      <section id="one" class="main alt">
         <div id="wrap" class="login">
            <span class="fa-solid fa-user"></span>
            <h1>로그인</h1>
            <form action="${cp}/userloginok.us" method="post" name="loginForm">
               <table>
                  <tbody>
                     <tr>
                        <th id="join-color" class="radius1"><div id="join-userid">아이디</div></th>
                        <td id="join-color" class="radius2"><input type="text"
                           name="user_id" value="${cookie.joinid.value}"></td>
                     </tr>
                     <tr>
                        <th id="join-color"><div id="join-userpw">비밀번호</div></th>
                        <td id="join-color"><input type="password" name="pw"></td>
                     </tr>
                     <tr>
                        <td></td>
                        <td id="join-color" class="radius3">
                           <div class="btn_area" style="margin-left: 10px">
                              <input type="submit" value="로그인">
                           </div>
                           <div class="join_area" id="join-btn">
                              <a class="btn" href="user-join.jsp" id="join-color"><input
                                 type="button" value="회원가입" id="join-color"></a>
                           </div>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </form>
            <!-- <div id="join-btn">
                  <a class="btn" href="user-join.jsp" id="join-color"><input
                     type="submit" value="회원가입" id="join-color"></a>
               </div> -->
         </div>
         </header>
      </section>
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
   <script src="${cp}/js/user.js"></script>
   <script>
      document.cookie = "joinid=; path=/;"
      window.setTimeout(function() {
         document.querySelector("#wrap.login+img").classList = "hdd";
         document.querySelector("#wrap.login").style.display = "block";
      }, 1300)

      xhr.onre = function() {

      }
      /* xhr.open("GET","boardlist.bo") */
   </script>

</body>
</html>