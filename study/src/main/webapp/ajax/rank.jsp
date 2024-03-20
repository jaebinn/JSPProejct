<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1>
		<tbody>
			<tr>
				<td id="rank">실시간 검색 순위</td>
				<td id="data">키워드</td>
			</tr>
		</tbody>
	</table>
</body>
<script>
let obj = null;
let datas = null;

getData();
setInterval(getData, 20000);

let i = 0;
setInterval(change,2000);

function change(){
    const rank = document.getElementById("rank");
    const data = document.getElementById("data");

    i %= datas.length;
    rank.innerHTML = datas[i].rank;
    data.innerHTML = datas[i].data;
	i++;
}

function getData(){
    const xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function(){
        if(xhr.readyState == 4){
            if(xhr.status == 200){
                obj = JSON.parse(xhr.responseText);
                datas = obj.datas;   
            }
        }
    }
    xhr.open("GET", "datas.json");
    xhr.send();
}
</script>
</html>