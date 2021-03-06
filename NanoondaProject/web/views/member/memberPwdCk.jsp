<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member" %>
<%
	Member member = (Member)request.getAttribute("member");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANOONDA_LOGIN</title>
<%@ include file="../../views/common/meta.jsp"%>
</head>
<body>
	<%@ include file="../common/header.jsp" %>
	<div id="wrap">
		<div class="my_page">
			<h1 align="center">회원 정보 수정 페이지</h1>
			<%@ include file="../common/mypageMenu.jsp" %>
			<div class="my_table update">
				<form method="post" action="/nnd/passdateCk" onsubmit="return">
					<table id="outer" align="center" width="500" cellspacing="5" cellpadding="0">
						<caption>회원 정보를 수정하시려면 현재 비밀번호를 확인해주세요.</caption>
						<tr>
							<th width="220">아이디</th>
							<td><%= member.getId() %></td>
						</tr>

						<tr>
							<th>현재 비밀번호</th>
							<td><input style="border: 1px solid #d1d1d1" type="password" name="pwd" id="pwd"></td>
						</tr>
					</table>
					<div class="btn_in">
						<input type="submit" value="확인">
						<input onclick="location.href='/nnd/myinfo?id=<%= loginMember.getId() %>';" type="reset" value="취소">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 상대경로만 사용 가능함 -->
	<%@ include file="../common/footer.jsp" %>
</body>
</html>