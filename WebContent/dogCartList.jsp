<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.Cart"%>
<%@ page import="vo.Dog"%>
<%@ page import="dao.DogDAO"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	#listForm{
		width:700px;
		/* border:1px solid red; */
		margin:auto;
	}
	
	h2{
		text-align:center;
	}
	
	table{
		width:350px;
		margin:auto;
	}
	
	.tr_top{
		background-color:lime;
	}
	
	.div_empty{
		text-align:center;
		background-color:
	}
	
	.td_command{
		text-align:right;
	}
	
	#todayImageList{
		text-align:center;
	}
	
	#productImage{
		width:150px;
		height:150px;
		border:none;
	}
	
	#cartImage{
		width:70px;
		height:70px;
		border:none;
	}
	
	#select{
		text-align:right;
	}
	
	#commandList{
		text-align:center;
	}
	
	#upImage{
		width:15px;
	}
	
	#downImage{
		width:15px;
	}
</style>

<script>
	function checkBoxChk(theForm){
		
		//html 속성중 이름이이름이 remove인 것에 대해 값을 배열에 대입 (별도의 배열선언필요없음)
		var removeArray = document.getElementsByName("remove");
		var removeCnt = 0; //체크가 몇 개가 되었는지 변수를 확인 
		
		for(var i=0; i<removeArray.length;i++){
			
			//체크박스가 체크되었다면 
			if(removeArray[i].checked==true){
				removeCnt += 1;
			}
		}
		//체크박스 선택이 하나도 안되었다면
		if(removeCnt == 0){
			alert("삭제할 항목을 선택하세요");
			return false;
		}else{
			return true;
		}
		
	}

	function checkAll(theForm){
		
		if(theForm.remove.length == undefined){
			theForm.remove.checked = theForm.allCheck.checked;
		}else{
			for(var i=0;i<theForm.remove.length;i++){
				theForm.remove[i].checked = theForm.allCheck.checked;
			}
		}
	}
	
	function checkQty(kind,qty){
		if(qty != 1){
			location.href="dogCartQtyDown.dog?kind=" + kind;
		}
	}
	
</script>

<body>
	<c:if test="${startMoney != null}">
		<c:set var="startMoney" value="${startMoney}"/>
	</c:if>
	
	<c:if test="${endMoney != null}">
		<c:set var="endMoney" value="${endMoney}"/>
	</c:if>
	
	<section id="listForm">
		<c:if test="${cartList != null && cartList.size() > 0}">
			<h2>장바구니 목록</h2>
			<form method="post">
				<table>
					<tr id="select">
						<td colspan="6">
							<select id="startMoney" name="startMoney">
								<option>=최하=</option>
								<c:choose>
									<c:when test="${startMoney == 1000}">
										<option selected="selected">1000</option>
										<option>2000</option>
									    <option>3000</option>
									    <option>4000</option>
									</c:when>
									<c:when test="${startMoney == 2000}">
										<option>1000</option>
										<option selected="selected">2000</option>
									    <option>3000</option>
									    <option>4000</option>
									</c:when>
									<c:when test="${startMoney == 3000}">
										<option>1000</option>
										<option>2000</option>
									    <option selected="selected">3000</option>
									    <option>4000</option>
									</c:when>
									<c:when test="${startMoney == 4000}">
										<option>1000</option>
										<option>2000</option>
									    <option>3000</option>
									    <option selected="selected">4000</option>
									</c:when>																		
									<c:otherwise>
										<option>1000</option>
										<option>2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:otherwise>
								</c:choose>
							</select>
							
							<select id="endMoney" name="endMoney">
								<option>=최고=</option>
								<c:choose>
									<c:when test="${endMoney == 1000}">
										<option selected="selected">1000</option>
										<option>2000</option>
									    <option>3000</option>
									    <option>4000</option>
									</c:when>
									<c:when test="${endMoney == 2000}">
										<option>1000</option>
										<option selected="selected">2000</option>
									    <option>3000</option>
									    <option>4000</option>
									</c:when>
									<c:when test="${endMoney == 3000}">
										<option>1000</option>
										<option>2000</option>
									    <option selected="selected">3000</option>
									    <option>4000</option>
									</c:when>
									<c:when test="${endMoney == 4000}">
										<option>1000</option>
										<option>2000</option>
									    <option>3000</option>
									    <option selected="selected">4000</option>
									</c:when>																		
									<c:otherwise>
										<option>1000</option>
										<option>2000</option>
										<option>3000</option>
										<option>4000</option>
									</c:otherwise>
								</c:choose>
							</select>
							
							<input type="submit" value="검색" formaction="dogCartSearch.dog"/>
														
						</td>
					</tr>
					
					<tr class="tr_top">
						<td>
							<input type="checkbox" 
								   id="allCheck" 
								   name="allCheck" onclick="checkAll(this.form)"/>
						</td>
						
						<td>번호</td>
						<td>상품이미지</td>
						<td>상품명</td>
						<td>가격</td>
						<td>수량</td>
					</tr>
					
					<c:forEach var="cart" items="${cartList}" varStatus="status">
					
						<tr>
							<td>
								<input type="checkbox" 
								       id="remove" 
								       name="remove" value="${cart.kind}"/>
							</td>
							<td>
								${status.index+1}
							</td>
							<td>
								<img src="resources/images/${cart.image}" id="cartImage"/>
							</td>
							
							<td>
								${cart.kind}
							</td>
							
							<td style = "text-align:right">
							<fmt:formatNumber
								type="number"
								maxFractionDigits="3"
								value= "${cart.price}"/>
								
							</td>
							<td style = "text-align:center">
								<a href="dogCartQtyUp.dog?kind=${cart.kind}">
									<img src="resources/images/up.jpg" id="upImage" border=0/>
								</a><br>
								${cart.qty}<br>
								<a href="javascript:checkQty('${cart.kind}',${cart.qty})">
									<img src="resources/images/down.jpg" id="downImage" border=0/>
								</a>
							</td>
						</tr>
					
					</c:forEach>
	
					<tr>
						<td colspan="5" style="text-align:center">
							총금액:
							<fmt:formatNumber
								type="number"
								maxFractionDigits="3"
								value= "${totalMoney}"/>
						</td>
					</tr>
					
<%--
	formaction 태그란?
	
	  form 데이터가 서버로 전송될때 입력 데이터를 처리할
	  파일의 URL 을 명시하는 태그
	
	- input  태그의 type이 submit 혹은 image 인 경우만 사용가능함
 --%>					
					<tr>
						<td colspan="5" style="text-align:center">
						<!-- <input type="submit" value="삭제" formaction="dogCartRemove.dog"/>
						  -->	
						  
						<input type="submit" value = "삭제"
							onclick="javascript:return checkBoxChk(this.form);form.action='dogCartRemove.dog'" />
						
						</td>
					</tr>
				</table>
			</form>
		</c:if>
		
		<c:if test="${cartList == null}">
			<section class="div_empty">
				강아지 정보가 없습니다.
			</section>
		</c:if>
		
		<nav id="commandList">
			<a href="dogList.dog">쇼핑 계속하기</a>
		</nav>
	</section>
	
</body>
</html>