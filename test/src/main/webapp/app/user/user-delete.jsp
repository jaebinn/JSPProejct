<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>everycare</title>
<meta charset="UTF-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/1924b51539.js"
   crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<style>
* {
   box-sizing: border-box;
}

.main {
   margin-top: 10%;
   padding: 0 30%;
   font-family: 'Pretendard-Regular' !important;
}

body {
   background: #f6f5f7;
   justify-content: center;
   align-items: center;
   margin: -20px 0 50px;
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

table th {
   text-align: center;
   font-weight: bold;
}

h1 {
   text-align: center;
   font-size: 40px;
    margin: 0 0 1rem 0;
}

.delete_user>span {
   margin-top: 20px;
   margin-bottom: 20px;
   font-size: 50px;
}
</style>
</head>
<body>
   <div id="wrapper">

      <!-- Header -->
      <header id="header">

         <!-- Logo -->
         <div class="logo">
            <a href="${cp}/index.jsp"><strong>&nbsp;&nbsp;&nbsp;Everycare</strong>
               <span class="extra"></span></a>
         </div>
      </header>

      <!-- Section -->
      <section id="one" class="main alt">
         <div id="wrap" class="delete_user">
            <span class="fa-solid fa-user-minus"></span>
            <h1>회원탈퇴</h1>
            <form action="${cp}/userdeleteok.us" method="post" name="joinForm">
               <table>
                  <tbody>
                     <tr>
                        <th>아이디</th>
                        <td><input type="text" name="user_id" value="${loginUser}" readonly
                           placeholder="아이디를 입력하세요"></td>
                     </tr>
                     <tr>
                        <th>비밀번호</th>
                        <td><input type="password" name="pw"
                           placeholder="비밀번호를 입력하세요"></td>
                     </tr>
                     <tr>
                        <td colspan="2">
                           <div class="btn_area">
                              <input type="submit" value="회원탈퇴">
                           </div>

                        </td>
                     </tr>
                  </tbody>
               </table>
            </form>

         </div>
         </header>
      </section>
   </div>

</body>
<script src="${cp}/js/user.js"></script>
<script src="${cp}/js/user.js"></script>
<script>
   function delete_user() {

      /*const User_id = document.joinForm.user_id;
      const User_pw = document.joinForm.pw;*/

      if (confirm("탈퇴하시겠습니까??")) {
         alert("정상적으로 탈퇴처리 되었습니다.");
      } else {
         alert("탈퇴처리에 실패했습니다");
      }

   }
</script>
</html>
<!-- onclick="delete_user" -->