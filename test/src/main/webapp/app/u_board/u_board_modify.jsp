<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>Untitled</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/1924b51539.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="${cp}/css/main.css" />
<link rel="stylesheet" href="${cp}/css/u_boardupdate.css">
</head>
<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Header -->
        <header id="header" class="alt">

						<!-- Logo -->
							<div class="logo">
								<a href="${cp}/index.jsp"><strong>everycare</strong></a>
							</div>

						<!-- Nav -->
							<nav id="nav">
								<ul style="display:flex">
									<li class="current"><a href="${cp}/index.jsp">Home</a></li>
									<li><a href="${cp}/expertlist.ep">전문가매칭</a></li>
									<li>									
										<a href="${cp}/u_boardlist.ub" class="icon solid fa-angle-down" style="pointer-events: none;">게시판</a>
										<ul class="drop_menu">
											<li><a href="${cp}/u_boardlist.ub">전문가 찾기</a></li>
											<li><a href="${cp}/faqlist.fa">FAQ게시판</a></li>
											<li><a href="${cp}/reviewlist.rf">리뷰게시판</a></li>
										</ul>
									</li>
									<li class="mypage">
										<a href="${cp}/" class="icon solid fa-angle-down" style="pointer-events: none;">마이페이지</a>
										<ul class="drop_menu">
											<li class="mypage"><a href="${cp}/">유저 정보</a></li>
											<c:if test="${not empty expertSession}">
												<li class="expertpage"><a href="${cp}/">전문가 정보</a></li>
											</c:if>
										</ul>
										</li>									
									<c:if test="${not empty sessionScope.loginUser}">
									    <!-- 세션이 있을 때 (로그인된 상태) -->    
									    <c:choose>
									        <c:when test="${not empty expertSession}">
									            <!-- 전문가 세션이 있을 때 -->
									            <li><a href="${cp}/app/expert/expertChatList.jsp"><input type="button" value="전문가채팅" id="expert_chat"></a></li>						            
									        </c:when>
									        <c:otherwise>
									            <!-- 전문가 세션이 없을 때 -->
									            <li><a href="${cp}/app/expert/expertRegister.jsp"><input type="button" value="전문가등록" id="expert_btn"></a></li>
									        </c:otherwise>
									    </c:choose>
									    <li><a href="${cp}/app/user/user-logout.jsp"><input type="button" value="로그아웃" id="logout_btn"></a></li>
									    <li><p id="login_user" style="font-weight:bold">${sessionScope.loginUser}님</p></li>
									</c:if>
									<c:if test="${empty sessionScope.loginUser}"> 
										<li><a href="${cp}/app/user/user-login.jsp"><input type="button" value="로그인" id="login_btn"></a></li>
									</c:if>
								</ul>
							</nav>
					</header>

        <!-- Section -->
        <section id="one" class="main" style="margin-top:5%">
            <form id="boardForm" method="post" name="boardForm" action="${cp}/u_boardupdateok.ub" enctype="multipart/form-data">
            <input type="hidden" name="board_idx" value="${u_board.board_idx}">
            <input type="hidden" name="page" value="${param.page}">
            <table border="1">
                <tr>
                    <th>제목</th>
                    <td>
                        <input type="text" name="title" maxlength="50" value="${u_board.title}">
                    </td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>
                        <input type="text" name="user_id" maxlength="50" value="${u_board.user_id}" readonly>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>
                        <textarea name="contents">${u_board.contents}</textarea>
                    </td>
                </tr>
                <c:choose>
                    <c:when test="${u_files.size() > 0}">
                        <c:set var="len" value="${u_files.size()}"/>
                        <c:forEach var="i" begin="0" end="${len-1}">
                            <tr class="r${i}">
                                <th>파일 첨부${i+1}</th>
                                <td class="file${i}_cont">
                                    <div>
                                        <input type="file" name="file${i}" id="file${i}" style="display:none">
                                        <input type="hidden" name="system_name${i}" value="${u_files[i].system_name}">
                                        <span id="file${i}name" class="original_name">${u_files[i].original_name}</span>
                                    </div>
                                    <div>
                                        <a class="btn" href="javascript:upload(${i},'${u_files[i].system_name}')">파일 선택</a>
                                        <a class="btn" href="javascript:cancelFile(${i},'${u_files[i].system_name}')">첨부 삭제</a>
                                    </div>
                                    <c:if test="${fn:endsWith(u_files[i].original_name, '.jpeg') or fn:endsWith(u_files[i].original_name, '.jpg') or fn:endsWith(u_files[i].original_name, '.png') or fn:endsWith(u_files[i].original_name, '.gif') or fn:endsWith(u_files[i].original_name, '.webp')}">
                                        <img class="thumbnail" src="${cp}/file/${u_files[i].system_name}">
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr class="r${len}">
                            <th>파일 첨부${len+1}</th>
                            <td class="file${len}_cont">
                                <div>
                                    <input type="file" name="file${len}" id="file${len}" style="display:none">
                                    <input type="hidden" name="system_name${len}" value="">
                                    <span id="file${len}name" class="original_name">선택된 파일 없음</span>
                                </div>
                                <div>
                                    <a class="btn" href="javascript:upload(${len})">파일 선택</a>
                                    <a class="btn" href="javascript:cancelFile(${len})">첨부 삭제</a>
                                </div>
                            </td>
                        </tr>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <th>파일 첨부1</th>
                            <td>
                                <div>
                                    <input type="file" name="file0" id="file0" style="display:none">
                                    <input type="hidden" name="system_name0" value="">
                                    <span id="file0name" class="original_name">선택된 파일 없음</span>
                                </div>
                                <div>
                                    <a class="btn" href="javascript:upload(0)">파일 선택</a>
                                    <a class="btn" href="javascript:cancelFile(0)">첨부 삭제</a>
                                </div>
                            </td>
                        </tr>
                    </c:otherwise>
                </c:choose>

            </table>
            <input type="hidden" value="" name="updateCnt" id="updateCnt">
        </form>
        <table class="btn_area">
            <tbody>
                <tr>
                    <td>
                        <a class="btn" href="javascript:sendit();">수정완료</a>
                        <a class="btn" href="${cp}/u_boardlist.ub?page=${param.page}">목록</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">
            <section>
                <h3>Nullam sed gravida</h3>
                <p>Phasellus ultrices sed nulla quis nibh. Quisque a lectus.
                    Donec consectetuer ligula vulputate sem tristique cursus sed magna
                    gravida non.</p>
                <ul class="icons">
                    <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon brands fa-linkedin-in"><span class="label">LinkedIn</span></a></li>
                </ul>
            </section>
            <section class="narrow">
                <h4>Lorem aliquam</h4>
                <ul class="links">
                    <li><a href="#">Ultrices nulla</a></li>
                    <li><a href="#">Quis lectus donec</a></li>
                    <li><a href="#">Magna ligula</a></li>
                    <li><a href="#">Sed etiam tristique</a></li>
                    <li><a href="#">Cursus magna</a></li>
                    <li><a href="#">Gravida dolore</a></li>
                </ul>
            </section>
            <section class="narrow">
                <h4>Magna tempus</h4>
                <ul class="links">
                    <li><a href="#">Feugiat ligula</a></li>
                    <li><a href="#">Vulputate tristique</a></li>
                    <li><a href="#">Ultrices nulla</a></li>
                    <li><a href="#">Cursus sed magna</a></li>
                    <li><a href="#">Sed lectus donec</a></li>
                </ul>
            </section>
            <section>
                <h3>Morbi sed volutpat</h3>
                <p>Sed vulputate sem tristique cursus sed magna gravida non
                    lorem ipsum dolor sit amet.
                <p>
                <p>
                    <a href="#" class="major">(000) 000-0000</a>
                </p>
            </section>
        </div>
        <div class="copyright">
            <p>&copy; Untitled. All rights reserved.</p>
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
<script>
	let i = ${u_files.size()};
	let original_Size = i;
	const updateCnt = $("#updateCnt");
	
	let util_arr = null;
	
	util_arr = document.getElementsByClassName("original_name");
	
	const original_names = [];
	const system_names = [];
	for(let j=0;j<original_Size;j++){
	    original_names.push(util_arr[j].innerText.trim());
	    system_names.push(util_arr[j].previousElementSibling.value);
	}
	
	let deleteFiles = [];
	
	function sendit(){
	    const set = new Set(deleteFiles);
	    deleteFiles = [...set];
	    deleteFiles = deleteFiles.filter((item) => { return item != undefined })
	    updateCnt.val(deleteFiles.join("\\"));
	    console.log(updateCnt.val())
	    document.boardForm.submit();
	}
	
	let temp_system_name = "";
	
	function upload(num,system_name){
	    if(system_name == undefined){
	        $("#file"+num).click();
	    }
	    else{        
	        temp_system_name = system_name;
	        deleteFiles.push(system_name);
	        $("#file"+num).click();
	    }
	    
	}
	$("[type=file]").change(function(e){
	    
	    const fileTag = e.target;
	    const file = fileTag.files[0];
	    const num = Number(fileTag.id.split("e").pop());
	    
	    if(file == undefined){            
	        if(!system_names[num]){                
	            cancelFile(num);
	        }
	        else{                            
	            let original_name = original_names[num];            
	            $("#file"+num+"name").text(original_name);    
	            $("."+fileTag.id+"_cont .thumbnail").remove();
	            let ext = system_names[num].split(".")[1];
	            if(["jpeg", "png", "jpg", "webp", "gif"].includes(ext)){
	                const reader = new FileReader();
	                reader.onload = function(ie){
	                    const img = document.createElement("img");
	                    img.setAttribute("src","${cp}/file/"+system_names[num]);
	                    img.setAttribute("class","thumbnail");
	                    document.querySelector("."+fileTag.id+"_cont").appendChild(img);
	                }
	                reader.readAsDataURL(file);
	            }
	            
	            for(let j=0;j<deleteFiles.length;j++){
	                if(deleteFiles[j] == temp_system_name){
	                    deleteFiles[j] = undefined;
	                }
	            }
	            console.log(deleteFiles);
	        }
	    }
	    else{
	        $("#"+fileTag.id+"name").text(file.name);
	        let ext = file.name.split(".").pop();
	        if(["jpeg", "png", "jpg", "webp", "gif"].includes(ext)){
	            $("."+fileTag.id+"_cont .thumbnail").remove();
	            const reader = new FileReader();
	            reader.onload = function(ie){
	                const img = document.createElement("img");
	                img.setAttribute("src",ie.target.result);
	                img.setAttribute("class","thumbnail");
	                document.querySelector("."+fileTag.id+"_cont").appendChild(img);
	            }
	            reader.readAsDataURL(file);
	        }
	        else{
	            $("."+fileTag.id+"_cont .thumbnail").remove();
	        }
	        
	        if(fileTag.id == "file"+i){
	            const cloneElement = $(".r"+i).clone(true);
	            i++;
	            cloneElement.attr("class","r"+i);
	            cloneElement.children("th").text("파일 첨부"+(i+1));
	            cloneElement.children("td").attr("class","file"+i+"_cont");
	            
	            cloneElement.find("input[type='file']").attr("name","file"+i);
	            cloneElement.find("input[type='file']").attr("id","file"+i);
	            cloneElement.find("input[type='file']").val("");
	            
	            cloneElement.find("span").attr("id","file"+i+"name");
	            cloneElement.find("span").text("선택된 파일 없음");
	            
	            cloneElement.find("a")[0].href = "javascript:upload("+i+")";
	            cloneElement.find("a")[1].href = "javascript:cancelFile("+i+")";
	            
	            cloneElement.appendTo("#boardForm tbody")
	            
	        }
	    }
	})
	function cancelFile(num,system_name){
	    if(num == i){
	        return;
	    }
	    deleteFiles.push(system_name);    
	    if(num<original_Size){    
	        original_names.splice(num,1);
	        system_names.splice(num,1);
	    }
	    $(".r"+num).remove();
	    
	    for(let j=num+1;j<=i;j++){
	        console.log(j);
	        const el = $("#boardForm tbody .r"+j);
	        el.attr("class","r"+(j-1));
	        
	        el.find("th").text("파일 첨부"+j);
	        el.find("td").attr("class","file"+(j-1)+"_cont");
	        
	        el.find("input[type=file]").attr("name","file"+(j-1));
	        el.find("input[type=file]").attr("id","file"+(j-1));
	        
	        el.find("span").attr("id","file"+(j-1)+"name");
	        
	        let systemname = system_names[j-1] == undefined ? undefined : "'"+system_names[j-1]+"'";
	        
	        let format = `javascript:upload(${"${j-1}"},${"${system_name}"})`
	        console.log("format",format);
	        el.find("a")[0].href = `javascript:upload(${"${j-1}"},${"${system_name}"})`;
	        el.find("a")[1].href = `javascript:cancelFile(${"${j-1}"},${"${system_name}"})`;
	    }
	    i--;
	    console.log(deleteFiles);
	}
</script>
</body>
</html>
