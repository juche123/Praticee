<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jquerys/get_send.jsp</title>
<style>

*{
padding:0px;
margin:0px;
box-sizing:border-box;
}
#div1{

border:thin solid black;
height:500px;
overflow: auto;
margin:0px 10%;
}

form{

margin-right:20%;
margin-left:35%;
}

input{
padding:5px;
width:50%;
border:2px solid green;
}
button{
width:10%;
border: none;
background-color:rgba(127,255,0);
padding:7px;
color:white;
}

button:hover{

background-color:rgba(102,205,0,0.5)
}

ul li {

border-bottom: solid thin black;
list-style-type:none;
padding:0px;
margin:0px;
}

header{
text-align:center;

}

</style>
<script
 src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 // 입력한 데이터 전송
 function sendData(pFrm) {
  // alert(pFrm.name.value);
  // $ : 제이쿼리 ,    get : get방식으로 request
  /*
  전송데이터
   {
   key : pFrm.name.value,
   age : pFrm.age.value
  }
  */
  $.get("http://192.168.56.1:8080/Web/apis/api.jsp", {
   key : pFrm.name.value
  }, function(d) {  // d : jsp가 response한 json 
	 var ul1= document.getElementById("ul1");
	
  var data = d.items;
  
  ul1.innerHTML = "";
  for (var i = 0; i < data.length; i++) {
	 
	 ul1.innerHTML += "<li>"+data[i].title+"<p>"+d.items[i].link+"</p>"+"</li>";
	 
}
  
  });

  // $.get("요청처리파일",  { 전송데이터 }  )
  // JSON표기법 :  { 키 : 값 }
  //  function(d){ }  <= 서버쪽에서 요청처리후 리스펀스한 데이터 처리
 }
 
 
 
 
function myFunc(sel) {
	 alert(sel.value);
	 if(sel.value.equals("blog")){
		 
		 
			  
			   
		 
	 }
	 

 }

</script>
</head>
<body>
<header><h1>NAVER</h1></header>
<div id = "div1">
<ul id = "ul1"></ul>

</div>
<div>
 <form>
 <select id = "sel"onchange="myFunc(this)">
 <option value = "news">news</option>
 <option value = "blog">blog</option>
 </select>
 </form>
 <form>
  <input type="text" name="name" />
  <button type="button" onclick="sendData(this.form);">전송</button>
 </form>
 </div>

 
 
 
</body>
</html>
