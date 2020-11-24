<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="notice.model.vo.Notice"%>
    <% Notice notice = (Notice)request.getAttribute("notice"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>NANOONDA_NOTICE</title>
<!--  관리자가 보는 공지사항 상세보기 -->
<%@ include file="../../views/common/meta.jsp"%>

</head>
<body>
<%@ include file="../common/adminheader.jsp" %>

<!-- Sidebar -->
	<div id="ad_sidebar" class="w3-sidebar w3-light-grey w3-bar-block">
		<ul>			
	 	<li><a href="/nnd/anlist?page=1" class="w3-bar-item w3-button">공지사항</a></li>
		</ul>
	</div>

<div id="ad_listview"> <!-- 전체 묶은 div : start -->	

<h2 align="center"><%= notice.getNoticeNo() %> 번 공지사항 상세보기</h2>
<br>
<table align="center" class="w3-table-all w3-small" style="width: 90%; float: right">

<tr>
<th>제목</th>
<td><%= notice.getNoticeTitle() %></td>
</tr>

<tr>
<th>작성자</th>
<td><%= notice.getNname() %></td>
</tr>

<tr>
<th>등록날짜</th>
<td><%= notice.getNoticeDate() %></td>
</tr>

<tr>
<th>첨부파일 : </th>
<td><% if(notice.getOriginalFilepath() != null) { %>
<a href="/nnd/nfdown?ofile=<%= notice.getOriginalFilepath() %>&rfile=<%= notice.getRenameFilepath() %>"><%= notice.getOriginalFilepath() %></a>
<% } else{ %>
&nbsp;
<% } %>
</td>
</tr>

<tr>
<th>내용</th>
<td><%= notice.getNoticeContent() %></td>
</tr>

<tr>
      <th colspan="2" float="center">
      <button onclick="javascript:location.href='/nnd/npmove?notice_no=<%= notice.getNoticeNo()%>';">수정페이지로 이동</button> &nbsp;
      <button onclick="javascript:location.href='/nnd/ndel?notice_no=<%= notice.getNoticeNo() %>&rfile=<%= notice.getRenameFilepath() %>';">삭제하기</button> &nbsp;
      <button onclick="javascript:history.go(-1);">목록으로</button>
      </th>
   </tr>
</table>
<br>

</body>
</html>