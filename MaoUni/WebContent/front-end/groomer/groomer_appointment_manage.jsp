<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Groomer Appointment Manage</title>

<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/tooplate-gymso-style.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/sweetalert2.css">

<script src="<%= request.getContextPath() %>/resources/js/fontawesome.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/sweetalert2.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/jquery_1.12.4.min.js"></script>
<style>


i:hover {
	cursor: pointer;
}


.showDeatail{
width: 100%;
heigh: 200px;
}

.svcItem, .pet{

  margin: 15px 2px;
  margin-top: 5px;
  padding: 3px;
}

.detail{
  background-color: #77AF9C;
  color: #F8F8FF;
  border-radius: 5px;
  margin: 3px;
  padding: 2px;
  margin-top:0;
}

.detail:hover{
cursor: pointer;
}
.cancle:hover{
cursor: pointer;
}
.done:hover{
cursor: pointer;
}

.svcList{
display:none;}

.cancle{
  background-color: #ED9282;
  color: #F8F8FF;
  border-radius: 5px;
  margin: 3px;
  padding: 2px;
  margin-top:0;
}

.done{
  background-color: #47b8e0;
  color: #F8F8FF;
  border-radius: 5px;
  margin: 3px;
  padding: 2px;
  margin-top:0;
}

#serchForm{
margin-top: 30px;
}

.disabled{
	background-color: #E0E3DA;
}

.display {
   text-align: right;
   width: 61%;
   padding: 5px;
   display: inline-block;
}

#map {
    width: 740px;
    height: 500px;
    margin: 10px auto;
}


</style>
</head>

<body>
	<!-- MENU BAR -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">

            <a class="navbar-brand" href="<%= request.getContextPath() %>/front-end/groomer/groomer_appointment_manage.jsp">??????????????????</a>

            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-lg-auto">
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/front-end/member/grooming_groomerInfo.jsp?groomerId=${groVO.groomerId}" class="nav-link smoothScroll">????????????</a>
                    </li>
					<li class="nav-item">
                        <a href="<%= request.getContextPath() %>/front-end/groomer/groomer_infoEdit.jsp" class="nav-link smoothScroll">??????????????????</a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/front-end/groomer/groomer_appointment_manage.jsp" class="nav-link smoothScroll" class="nav-link smoothScroll">???????????????</a>
                    </li>

                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/front-end/groomer/groomer_schedule.jsp" class="nav-link smoothScroll">??????</a>
                    </li>
                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/front-end/member/memberpage.jsp" class="nav-link smoothScroll">????????????</a>
                    </li>
                </ul>

<!--                 <ul class="social-icon ml-lg-3"> -->
<!--                     <li><a href="https://fb.com/tooplate" class="fa fa-facebook"></a></li> -->
<!--                     <li><a href="#" class="fa fa-twitter"></a></li> -->
<!--                     <li><a href="#" class="fa fa-instagram"></a></li> -->
<!--                 </ul> -->
            </div>

        </div>
    </nav>
	<main>
		<c:if test="${not empty errorMsgs}">
			<c:forEach var="message" items="${errorMsgs}">
				<p style="color: red">${message}</p>
			</c:forEach>

		</c:if>

		

		<div class="container">

			
<!------------------------------------------------------ appointment list start ------------------------------------------------>			
			<section class="showList row">
			<!------------------------ search appointment start --------------------->			
			<form method="get" id="serchForm" >
				<div class="searchGM col-md-12 row mt-5">
					<div class="col-md-3 my-1">
						<select class="form-control condition" name="month">
							<option value="" selected>??????</option>
							<option value="1">01</option>
							<option value="2">02</option>
							<option value="3">03</option>
							<option value="4">04</option>
							<option value="5">05</option>
							<option value="6">06</option>
							<option value="7">07</option>
							<option value="8">08</option>
							<option value="9">09</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
						</select>
					</div>
					<div class="col-md-4 my-1">
						<input class="form-control condition" name=apmDate type="date" >
					</div>
					<div class="col-md-3 my-1">
						<select class="form-control condition" name="apmStatus">
							<option value="">ALL</option>
							<option value="0">?????????</option>
							<option value="1">??????</option>
							<option value="2">??????</option>
							<option value="3">??????</option>
							<option value="4">??????</option>
						</select>
					</div>
					<input class="action" type="hidden" name="groomerId" value="${groVO.groomerId}">
					<input class="action" type="hidden" name="action" value="getAll">
					<div class="col-md-1 my-1">
						<i class=" fas fa-search search mt-4 fa-2x"></i>
					</div>
				</div>
			</form>
		<!------------------------ search appointment end --------------------->
				<div class="col-9">
					<table class="table table-hover table-sm text-center">
						<thead>
							<tr>
								<th scope="col">??????</th>
								<th scope="col">??????</th>
								<th scope="col">?????????</th>
								<th scope="col">??????</th>
								<th scope="col">??????</th>
								<th scope="col">??????</th>
								<th scope="col">??????</th>
								<th scope="col">   </th>
							</tr>
						</thead>
						<tbody class="appointmentList">
		<!------------------------ ???????????????????????? ajax ??????????????????  --------------------->
						</tbody>
					</table>
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					   <!------------------------ ?????? ajax ????????????  --------------------->
					  </ul>
					</nav>
				</div>
				
		<!------------------------ ??????????????????????????????????????????????????? --------------------->		
				<div class="col-3 svcList" style="height: 500px;">
					<div class="card border-secondary mb-3" style="max-width: 18rem;">
					  <div class="card-header"><label class="targetId"></label> ???????????? <button type="button" class="close">
					          <span>&times;</span></div>
					        </button>
					  <div class="card-body text-secondary">
					    <div class="card-text showDeatail"></div>
<!-- 					    <button type="button" class="btn btn-secondary refuse">??????</button> -->
<!-- 						<button type="button" class="btn btn-info accept">??????</button> -->
 						<input type="hidden" class="apmManage" name="apmId" value="">
					  </div>
				</div>
			</section>
<!------------------------------------------------------ appointment list end ------------------------------------------------>			
		<section class="showList row">
			<div class="display">
	        	<div id="map"></div>
	    	</div>
		</section>
		
		</div>

	</main>
	<footer></footer>
	
<script>
let groomerId = "${groVO.groomerId}";
let lat = "${groVO.lat}";
let lng = "${groVO.lng}";
let grange = "${groVO.grange}";
console.log(lat)
console.log(lng)
</script>	
	

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyALjOdTPZMiMWQVlR01yYwLZWHAVuhk6_w&libraries=places&callback=initMap" async defer></script>
<script src="<%= request.getContextPath() %>/resources/js/bootstrap.min.js"></script>
<script src="<%= request.getContextPath() %>/resources/js/groomer_appointment_manage.js"></script>
<%-- <script src="<%= request.getContextPath() %>/resources/js/grooming_appointment_manage.js"></script> --%>

<%-- 	<script src="<%= request.getContextPath() %>/resources/js/googleMap.js"></script> --%>


</body>
</html>