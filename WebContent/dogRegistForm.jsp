<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		#registForm{
			width:500px;
			height:1px solid red;
			margin:auto;
		}
		table{
			margin:auto;
			width:450px;
		}
		.td_left{
			width:150px;
			background:orange;
		}
		.td_right{
			width:300px;
			background:skyblue;
		}
		#commandCell{
			text-align:center;
		}
	
	</style>
</head>
<body>
	<section id = "registForm">
		<header>
			<h2>강아지 정보등록</h2>
		</header>
		<form action="dogRegist.dog" 
			  method="post" 
			  name="writeForm" 
			  enctype="multipart/form-data">
		
		<table>
		<tr>
			<td colspan="2">
				<a href="dogList">목록보기</a>
			</td>
			
		</tr>
		
		<tr>
			<td class = "td_left">
				<label for="kind">품종</label>
			</td>
			
			<td class = "td_right">
				<input type="text" name ="kind" id="kind" required="required"/>
			</td>
		</tr>	
		
		<tr>
			<td class = "td_left">
				<label for="nation">원산지</label>
			</td>
			
			<td class = "td_right">
				<input type="text" name ="nation" id="nation"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
				<label for="price">가격</label>
			</td>
			
			<td class = "td_right">
				<input type="text" name ="price" id="price"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
				<label for="nation">신장</label>
			</td>
			
			<td class = "td_right">
				<input type="text" name ="height" id="height"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
				<label for="nation">체중</label>
			</td>
			
			<td class = "td_right">
				<input type="text" name ="weight" id="weight"/>
			</td>
		</tr>
		
		<tr>
			<td class = "td_left">
				<label for="content">글내용</label>
			</td>
			
			<td class = "td_right">
				<textarea name="content" id="content" rows="13" cols="40" wrap="off">
			</textarea>
			</td>
		</tr>
		<tr>
			<td class = "td_left">
				<label for="image">상품이미지</label>
			</td>
			
			<td class = "td_right">
				<input type="file" name ="image" id="image"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" id="commandCell">
				<input type="submit" value="강아지 상품등록"/>
				<input type="reset" value="다시작성"/>
				<input type="button" value="강아지상품보기" onclick="window.location.href='dogList.dog'"/>
			</td>	
			</tr>			
		</table>
		
		</form>
		
	</section>
</body>
</html>