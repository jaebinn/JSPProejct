<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>rank</title>
</head>
<body>
	<table border="1">
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
	setInterval(getData,20000);
	
	let i=0;
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
					//JSON.parse("JSON 형태의 데이터") : 안에 적혀있는 문자열로 자바스크립트 객체화
					//const mycar = JSON.parse('{"model":"ferrari","color":"red"}')
					//	--> const mycar = {"model","ferrari","color":"red"};
					
					//{키:값, 키:값, ...}
					obj = JSON.parse(xhr.responseText);
					datas = obj.datas;
				}
			}
		}
		
		xhr.open("GET","datas.json");
		xhr.send();
	}
</script>
</html>


