<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.backstage_staff.model.*"%>
<%@ page import="com.backstage_authority.model.AuthorityVO"%>
<%@ page import="com.backstage_authority.controller.*"%>
<%@ page import="com.backstage_authority.model.*"%>
<%@ page import="com.SignIn.controller.*"%>


<%
	StaffService StaffSvc = new StaffService();
	List<StaffVO> list = StaffSvc.getAll();
	pageContext.setAttribute("list", list);

	AuthorityService authoritySvc = new AuthorityService();
	List<AuthorityVO> authoritylist = authoritySvc.getAll();
	pageContext.setAttribute("list", list);
%>


<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>hidden_menu</title>


<html style="height: auto;"><head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/hidden_menu.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/hidden_menu2.css">
<style>
.btn {
	background: #e8c497;
	color: #fff;
}

.btn:hover {
	background: #ffe6c7;
	color: #fff;
}

.pagination>li.active>a {
	background: #d6b286;
	color: #fff;
}

.pagination>li>a {
	color: #d6b286;
}

.pagination>li>a:hover {
	background: #fff;
	color: #5c3316;
}

.col-md-6 .pagination>li>a, .col-md-6 .pagination>li>span {
	border: 1px solid #d6b286;
}

.pagination>.active>a:hover {
	background-color: #e6c195;
	border: solid 1px #e6c195;
}

a.btsp {
	font-size: 35px;
	color: #e8c497;
	font-weight: bold;
	margin-left: -5px;
}

a.btsp:hover, a.btsp:active {
	color: #ffe6c7;
	text-decoration: none;
}

p.allitemtitle {
	color: #fff;
	font-weight: bold;
}

input.details {
	background-color: #bfbfbf;
	color: #fff;
}

input.details:hover {
	background-color: #e8c497;
}

input.update {
	background-color: #bfbfbf;
	color: #fff;
}

input.update:hover {
	background-color: #e8c497;
}

body {
	overflow-x: hidden;
	<!--
	???????????????BODY??????????????????????????????
	-->
}
</style>
</head>

<body style="height: auto;">

	<!-- ?????????????????????????????? -->
	     <header>
         <span class="toggle-button" style="margin-left:-5px;margin-top:-7px;">
             <div class="menu-bar menu-bar-top"></div>
             <div class="menu-bar menu-bar-middle"></div>
             <div class="menu-bar menu-bar-bottom"></div>
         </span>
         <div class="menu-wrap">
             <div class="menu-sidebar" style="margin-top:30px;">
                 <ul class="menu">
                    <li><a href="<%= request.getContextPath() %>/back-end/member/listAllMember.jsp">??????????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/item/itemHomePage.jsp">????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/message/message_home.jsp">??????????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/adopt/adopt_home.jsp">??????????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/article/select_page_art.jsp">???????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/announcemet/select_page.jsp">????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/groomer/groomerList.jsp">???????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/groomer/grooming_report.jsp">????????????????????????</a></li>
                <li><a href="<%= request.getContextPath() %>/back-end/staff/allStaff.jsp">????????????</a></li>
                 </ul>
             </div>
         </div>
     </header>

			<h5 align="center">
				<input type="button" value="??????"
					onclick="window.location.href = '<%=request.getContextPath()%>/back-end/staff/addStaff.jsp'">
			</h5>
			<table align="center" "border:3px #cccccc solid" cellpadding="10" 
				border='1'>
				<tr>
					<th>????????????</th>
					<th>????????????</th>
					<th>??????</th>
					<th>??????</th>					
					<th>?????????</th>	
					<th>??????</th>	
					<th>??????</th>
					<th>????????????</th>
					<th>??????</th>
					
				</tr>
				<c:forEach var="staffVO" items="${list}">

					<tr>
						<td>${staffVO.id}</td>
						<td>${staffVO.name}</td>
						<td>${staffVO.age}</td>
						<td>${staffVO.edu}</td>					
						<td>${staffVO.cont}</td>
						<td>${staffVO.status}</td>
						
												
						</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/StaffServlet"
								style="margin-bottom: 0px;">
								<input type="submit" value="??????"> <input type="hidden"
									name="id" value="${staffVO.id}"> <input type="hidden"
									name="action" value="UpdateStaff">
							</FORM>
						</td>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/StaffServlet"
								style="margin-bottom: 0px;">
								<input type="submit" value="????????????"> <input type="hidden"
									name="id" value="${staffVO.id}"> <input type="hidden"
									name="action" value="getOneStaff">
							</FORM>
						</td>
						
					
					<td>
					
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/backstage_authority/AuthorityServlet"
								style="margin-bottom: 0px;">
								<input type="submit" value="??????"> <input type="hidden"
									name="id" value="${staffVO.id}"> <input type="hidden"
									name="action" value="get_One_Display">
							</FORM>
							
						</td>
				</c:forEach>
			</table>

			<script
				src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>



			<!-- ??????????????????????????????(JSP)-->
			<script
				src="<%=request.getContextPath()%>/resources/js/hidden_menu3.js"></script>
			<script
				src="<%=request.getContextPath()%>/resources/js/hidden_menu4.js"></script>
</body>
</html>