<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/hangjungdong.js"></script>

    <link rel="apple-touch-icon" href="/assets/img/apple-icon.png">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/img/favicon.ico">

    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/templatemo.css">
    <link rel="stylesheet" href="/assets/css/custom.css">
    <!-- Load fonts style after rendering the layout styles -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
    <link rel="stylesheet" href="assets/css/fontawesome.min.css">
    <style>
   		.main { width: 70%; margin: 0 auto; }
		.container2 { max-width:1024px; margin:30px auto;}
		.writebtn { text-align: right;  display:inline-block; float:right; margin-right:10%; }
		.routebtns { width: 100%; height:60px; display:inline-block; align-items: center; margin-top:50px; margin-bottom:50px; }
		.routebtn { width:150px; height:50px; display:inline-block; }
		.route_mini { width: 32%; height:500px; display: inline-block; border: 1px solid gray; border-radius: 13px; margin: 30px 0.5% 15px 0.5%; }
		.userProfile { width:25px;; height:25px; }
		.routeThumbImg { width:100%;height:300px; display:block; margin: auto; }
		
		.route_miniHeader { margin: 10px 5% 10px 2%; }
		.route_miniInfo { padding-left:10px; padding-right:10px; } 
		.route_miniFooter { display: inline-block;  margin: 10px 5% 10px 4%; }
		
    /*
    	.active{
        	color: white;
        	background-color: #4caf50;
    	}
    	table th {
 	 		width: 350px;
	  		padding: 10px;
  			vertical-align: top;
		}
		*/
	</style>
</head>
<body>
	<header>
		<%@include file ="header.jsp" %>
		<%@include file ="slides.jsp" %>
    </header>
    
	<main class="main">
	<div class="container2">
		<h2>나처럼 달려</h2>
		<div id="route_buttons" class="routebtns">
			<div class="routebtn">
    			<form action ="/route" method="post" >
    				<button id="routes_all" class="btn btn-success" style="width:150px;">전체보기</button>
    			</form>
    		</div>
    		<div class="routebtn">
    			<form action ="/route_sort" method="post">
    					<button id="routes_sort" class="btn btn-success" style="width:200px;">지역별/거리별 보기</button>
    			</form>
    		</div>
    		<div class="writebtn">
    			<form action ="/route_write" method="post">
    				<c:if test="${!empty id }">
    					<button id="route_reg" class="btn btn-success" style="width:150px; ">코스등록하기</button>
    				</c:if>
    			</form>
    		</div>
		</div>
		
		<fieldset style="padding-bottom: 30px; border: 1px solid gray;">
		<form action="/sortRoutes" method="post">
			<div id="area_div" style="margin: 0 auto; padding-top: 20px;">
				<div style="height:50px; margin: 0 auto;" >
					<div class="btn btn-success" style="width:10%; margin-left: 10%; display:inline-block;">지역</div>
					<input type="text" id="area_text" name="area" value="${area }"class="form-control mt-1" style="display:inline-block; width:70%;"/>
				</div>
			</div>
			<div id="distance_div" style="margin: 0 auto; padding-top: 20px;">
				<div style="height:50px; margin: 0 auto;" >
					<div class="btn btn-success" style="width:10%; margin-left: 10%; display:inline-block;">거리</div>
					<div id="btn_length1" style="width:15%; height:40px; text-align : center; line-height: 20px; display:inline-block;" class="btn btn-light">~5km</div>
					<div id="btn_length2" style="width:15%; height:40px; text-align : center; line-height: 20px; display:inline-block;" class="btn btn-light">5km~20km</div>
					<div id="btn_length3" style="width:15%; height:40px; text-align : center; line-height: 20px; display:inline-block;" class="btn btn-light">20km~</div>
					<input type="hidden" id="distance_left" name="distance_left" value="${distance_left}" />
					<input type="hidden" id="distance_right" name="distance_right" value="${distance_right}" />
				</div>
			</div><br><br>

			<div style="margin: 0 auto; text-align:center;">
				<button id="submit" style="width:15%; height:40px; text-align : center; line-height: 20px;" >검색</button>
			</div>
		</form>
		</fieldset>
		
		<c:choose>
			<c:when test="${routesinfolist!=null && pageInfo.listCount>0 }">
			<div id="routes_list">
				<c:forEach items="${routesinfolist }" var="route">
					<a href="routepost?articleNo=${route.route_articleNo}">
					<div id="route_mini" class="route_mini">
            			<div id="route_miniHeader" class="route_miniHeader">
                			<img src="/profileview/${route.memberthumb }" id="userImage" class="userProfile">
                			<span id="route_userName">${route.user_id }</span>
                			<span id="route_uploadTime" style="float:right;">${route.route_date }</span> 
           				 </div>
            			<div id="route_miniInfo" class="route_miniInfo">
                			<div id="route_miniTitle" style="text"></div>
                			<div id="route_miniThumbInfo">
              					<img src="/routethumbfileview/${route.route_thumb }" id="routeThumbImg" class="routeThumbImg">
                    			<div id="route_miniContent"></div>
                			</div>
            			</div>
           				<div id="route_miniFooter" >
                			<div id="route_miniFooterLeft" class="route_miniFooter" >
                    			<img src="${pageContext.request.contextPath }/images/like.PNG" class="userProfile" />
                    			<span id="route_likes">${route.route_likes }</span>
                    			<img src="${pageContext.request.contextPath }/images/reply.PNG" class="userProfile" />
                   				<span id="route_Replies">4</span>
                			</div>
               	 			<div id="route_miniFooterRight" class="route_miniFooter" style="float:right;" >
                    			<span>조회</span>
                    			<span id="route_myViews">${route.route_views }</span>
                			</div>
           			 	</div>
        			</div>
        			</a>
				</c:forEach>
			</div>
			
			<div id="pageList" style="text-align: center; margin-top:30px; margin-bottom :30px;">
			<c:choose>
				<c:when test="${pageInfo.page<=1}">
					[이전]&nbsp;
				</c:when>
				<c:otherwise>
					<a href="sortRoutes?page=${pageInfo.page-1}&&area=${area}&&distance_left=${distance_left}&&distance_right=${distance_right}">[이전]</a>&nbsp;
				</c:otherwise>
			</c:choose>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<c:choose>
					<c:when test="${pageInfo.page==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="sortRoutes?page=${i}&&area=${area}&&distance_left=${distance_left}&&distance_right=${distance_right}">[${i }]</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${pageInfo.page>=pageInfo.maxPage }">
					[다음]
				</c:when>
				<c:otherwise>
					<a href="sortRoutes?page=${pageInfo.page+1}&&area=${area}&&distance_left=${distance_left}&&distance_right=${distance_right}">[다음]</a>
				</c:otherwise>
			</c:choose>
			</div>
			</c:when>	
			
			<c:otherwise>
				<section id="emptyArea">등록된 글이 없습니다.</section>
			</c:otherwise>
		</c:choose>
	</div>
	</main>
		
	<script>
	$(function(){
		$("#btn_length1").click(function(){
			$("#btn_length1").removeClass("btn btn-success");
			$("#btn_length2").removeClass("btn btn-success");
			$("#btn_length3").removeClass("btn btn-success");
			$("#btn_length1").attr('class','btn btn-success');
		});
		$("#btn_length2").click(function(){
			$("#btn_length1").removeClass("btn btn-success");
			$("#btn_length2").removeClass("btn btn-success");
			$("#btn_length3").removeClass("btn btn-success");
			$("#btn_length2").attr('class','btn btn-success');
		});
		$("#btn_length3").click(function(){
			$("#btn_length1").removeClass("btn btn-success");
			$("#btn_length2").removeClass("btn btn-success");
			$("#btn_length3").removeClass("btn btn-success");
			$("#btn_length3").attr('class','btn btn-success');
		});
		
		$("#submit").click(function(){
			var distance_left, distance_right;
			if($("#btn_length1").hasClass("btn btn-success")===true){
				distance_left=0;
				distance_right=5000;
			}else if($("#btn_length2").hasClass("btn btn-success")===true){
				distance_left=5000;
				distance_right=20000;
			}else if($("#btn_length3").hasClass("btn btn-success")===true){
				distance_left=20000;
				distance_right=100000000;
			} else{
				distance_left=0;
				distance_right=0;
			}
			$("#distance_left").attr('value', distance_left);
			$("#distance_right").attr('value', distance_right);
		});
	});
	</script>
</body>
</html>