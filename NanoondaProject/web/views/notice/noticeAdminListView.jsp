<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	/*  int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	int maxPage = ((Integer) request.getAttribute("maxPage")).intValue();
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();   */
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANOONDA_NOTICE</title>
<!--  관리자가 보는  공지사항 목록 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<%@ include file="../../views/common/meta.jsp"%>

<!-- 전체 선택 체크박스 -->
<script type="text/javascript">
function allCk(objCheck){
	var checks = document.getElementsByName('nno');
	for(var i = 0; i < checks.length; i++){
		checks[i].checked = objCheck;
	}
}
</script>

</head>
<body>
	<%@ include file="../common/adminheader.jsp"%>

	 <!-- Sidebar -->
	<div id="ad_sidebar" class="w3-sidebar w3-light-grey w3-bar-block">
		<ul>			
	 	<li><a href="/nnd/anlist?page=1" class="w3-bar-item w3-button">공지사항</a></li>
		</ul>
	</div>

<!-- 여기서 부터 -->
<script type="text/javascript">
		function deleteRow(ths) {
			var $ths = $(ths);
				$ths.parents("tr").remove();
		}
	</script>
<!-- 여기까지 -->	
	
<div id="ad_listview"> <!-- 전체 묶은 div : start -->	
	
	<h1 class="ad_pagetit"><span>Notice Management</span>공지사항 관리</h1>
	<br>
		<!-- 기능 관련 폼 -->	
<tablealign="center" class="w3-table-all w3-small" style="width: 87%; float: right">
<tbody>
<tr style="width: 90%;">
<td style="width: 30%;">

</td>
<td style="width: 30%;"></td>
<td style="width: 30%;">


</td>
</tr>
</tbody>
</table>	

	
<form action="" class="ad_serch_in">
<!-- 2. 항목별 검색 기능 추가 -->
<fieldset id = "ss" class="ad_serch clear"> <!-- 항목들의 영역을 묶어주기 위해서 사용 -->
<legend>공지사항 목록</legend>
<span class="topserch">
	
	<a href="/nnd/views/notice/noticeWriterForm.jsp"><label>공지글 등록</label></a>
	<a href="/nnd/ndel?"><label>공지글 삭제</label></a>
	
</span>
</fieldset>
</form>
<!-- 검색 기능 영역 끝 -->	
	<table align="center" class="w3-table-all w3-small serchlist">
		<tr align="center">
		<th><input type="checkbox" id="allck" name="allck" onclick="allCk(this.checked);"></th>
			<th width="100">글번호</th>
			<th width="120">글제목</th>
			<th width="300">등록일</th>
			<th>첨부파일</th>
			<th width="300">작성자</th>
		</tr>
		<%
			for (Notice n : list) {
		%>
		<tr>
		<td align="center"><input type="checkbox" name="nno" value="<%= n.getNoticeNo() %>"></td>
			<td><%=n.getNoticeNo()%></td>
			<td><a href="/nnd/andetail?notice_no=<%=n.getNoticeNo()%>"><%=n.getNoticeTitle()%></a></td>
			<td><%=n.getNoticeDate()%></td>
			<td><% if(n.getOriginalFilepath() != null){ %>
			첨부파일 있음
			<%} else{ %>
			첨부파일 없음
			<%} %>
			</td>
			<td><%=n.getNname()%></td>
		</tr>
		<%
			}
		%>
	</table>
	
<%-- 	<!-- 페이징 처리 -->
<div id="page" style="text-align:center;">
		<% if(currentPage <= 1){ %>
			<span>◀◀</span>
		<% } else { %>
			<span><a href="/nnd/anlist?page=1">◀◀</a></span>
		<% } %>
	
		<!-- 현재 페이지가 속한 페이지그룹의 숫자 출력 처리 -->
		<% for(int p = startPage; p <= endPage; p++){
			if(p == currentPage){ %>
				<span><font color="steelblue" size="4"><b><%= p %></b></font></span>
			<% } else { %>
				<span><a href="/nnd/anlist?page=<%= p %>"><%= p %></a></span>
			<% } %>
		<% } %>

		<% if(currentPage >= maxPage){ %>
			<span>▶▶</span>
		<% } else { %>
			<span><a href="/nnd/anlist?page=<%= maxPage %>">▶▶</a></span>
		<% } %>
	</div> --%>
</div> <!-- 전체 묶은 div : end -->
</body>
</html>