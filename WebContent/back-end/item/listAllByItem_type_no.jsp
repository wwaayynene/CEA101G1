<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.item.model.*" %>
<%
	String item_type_no = request.getParameter("item_type_no");
	ItemService itemSvc = new ItemService();
    List<ItemVO> list = itemSvc.getAllByItem_type_no(item_type_no);
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��ӫ~��� - listAllItem.jsp</title>

<style>
#title {
	width: 100%;
	height: auto;
	margin-top: 15px;
	background-color: rgb(204, 202, 202);
	border: 1px solid;
	font-size: 30px;
	text-align: center;
	padding-top: 5px;
	display: flex;
	flex-direction: row;
}
.titleAll{
    margin-left:auto; 
    margin-right:auto;
}
.home{
    margin-left: 0px;
    margin-right: 5px;
    float: right;
    font-size:27px;
    }
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
    margin-bottom: 5px;
    margin-left:auto; 
    margin-right:auto;
    border: 1px gray ;
    
}
tr:nth-of-type(even){
    background-color: #f3f3f3;
}
tr:nth-of-type(odd){
    background-color: #ddd;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>


	<div id="title">

		<div class="titleAll">�Ҧ��ӫ~��� </div>
		<div>
			<a href="<%=request.getContextPath()%>/back-end/item/select_item.jsp" class="home">�^�ӫ~�޲z</a>
		</div>

	</div>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~���O</th>
		<th>�ӫ~����</th>
		<th>��s�ɶ�</th>
		<th>�ӫ~���A</th>
		<th>�P�P���A</th>
		<th>�ӫ~�Բ�</th>
		<th>�ӫ~�Ӥ�</th>
		<th>�n��</th>
		<th>�ק�</th>
		
	</tr>
	<%@ include file="page1.file" %> 
	<jsp:useBean id="item_typeSvc" scope="page" class="com.item_type.model.Item_typeService" />
	<jsp:useBean id="item_picsSvc" scope="page" class="com.item_pics.model.Item_picsService" />
	<c:forEach var="itemVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${itemVO.item_no}</td>
			<td>${itemVO.item_name}</td>
			<td>${item_typeSvc.getOneItem_type(itemVO.item_type_no).type_name}</td>
			<td>${itemVO.item_price}</td>
			<td> <fmt:formatDate value="${itemVO.item_renew}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
			<td>${((itemVO.item_status)==1)?"�W�[��":"�U�[��"}</td>
			<td>${((itemVO.item_on_sale)==1)?"�P�P��":"���`����"}</td> 
			<td>${itemVO.item_detail}</td>
			<td><a href="<%=request.getContextPath()%>/back-end/item_pics/listAllByItem_no.jsp?item_no=${itemVO.item_no}">�ԲӷӤ�</a></td> 
			<td>${itemVO.points}</td>
			<td> 
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/item/item.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="item_no"  value="${itemVO.item_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>