<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>同是天涯沦落人</title>
<script type="text/javascript" src="/resource/js/jquery-3.2.1/jquery.js" ></script>
<link href="/resource/bootstrap-4.3.1/css/bootstrap.css" rel="stylesheet">
<script type="text/javascript" src="/resource/bootstrap-4.3.1/js/bootstrap.js"></script>
<script type="text/javascript" src="/resource/js/jqueryvalidate/jquery.validate.js"></script>
<script type="text/javascript" src="/resource/js/jqueryvalidate/localization/messages_zh.js"></script>
<style type="text/css">

 body {
   font-family: PingFang SC,Hiragino Sans GB,Microsoft YaHei,WenQuanYi Micro Hei,Helvetica Neue,Arial,sans-serif;
  font-size: 17px;
 }
 

.menu {
	display: block;
	width: 110px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	color: #444;
	border-radius: 4px;
	margin-bottom: 2px;
	transition-property: color,background-color;
	font-size: 22px;
}

.menu:hover {
    animation-name: hvr-back-pulse;
    animation-duration: .2s;
    animation-timing-function: linear;
    animation-iteration-count: 1;
    background-color: 
	#ed4040;
	color:
	    #fff;
}

.ex {
		overflow: hidden;
		text-overflow:ellipsis;
		white-space: nowrap;
	}

</style>

</head>
<body>
 <!-- 导航条 -->
 
 <jsp:include page="common/header.jsp"></jsp:include>

<div class="container-fluid" style="margin-top:20px;margin-bottom:20px">
	<div class="row">
		<!-- 左侧栏目 -->
		<div class="col-md-2">
			<div>沦落人</div>
			<div>
				<ul class="nav flex-column" >
					<c:forEach items="${channels}" var="channel">
						<li  class="nav-item ">
						  <a class="nav-link menu" href="/channel?channelId=${channel.id}"> ${channel.name} </a>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<!-- 中间内容列表 -->
		<div class="col-md-6">
			<!-- 轮播图 -->
			<div>
				<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
					  	<c:forEach items="${slides}" var="slide" varStatus="index">
					    	<li data-target="#carouselExampleCaptions" data-slide-to="${index.index}" class='${index.index==0?"active":""}'></li>
					  	</c:forEach>
					  </ol>
					  
					  <div class="carousel-inner">
					    <c:forEach items="${slides}" var="slide" varStatus="index">
					    <div class="carousel-item ${index.index==0?'active':''}">
					      <img src="/pic/${slide.picture}" class="d-block w-100" alt="${slide.title}">
					      <div class="carousel-caption d-none d-md-block">
					        <h5>${slide.title} </h5>
					        <p>${slide.title}</p>
					      </div>
					    </div>
					    </c:forEach>
					  </div>
					  
					  
					  <a class="carousel-control-prev" href="#carouselExampleCaptions" role="button" data-slide="prev">
					    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					    <span class="sr-only">Previous</span>
					  </a>
					  <a class="carousel-control-next" href="#carouselExampleCaptions" role="button" data-slide="next">
					    <span class="carousel-control-next-icon" aria-hidden="true"></span>
					    <span class="sr-only">Next</span>
					  </a>
					</div>
			</div>
			<!-- 文章的列表 -->
			<div style="margin-top:20px">
				<c:forEach items="${articlePage.list}" var="article">
					<div class="row" style="margin-top:5px">
						<div class="col-md-3">
							<img  width="150px" height="120px" src="/pic/${article.picture}"
							  onerror="this.src='/resource/images/guest.jpg'"
							  class="rounded" style="border-radius:12px!important;"
							 >
						</div>
						<div class="col-md-9">
							<a href="/article/detail?id=${article.id}" target="_blank">${article.title}</a>
							<br>
							作者：${article.user.username}
							<br>
							栏目：<a> ${article.channel.name} </a>&nbsp;&nbsp;&nbsp;&nbsp; 分类：<a>${article.category.name}</a>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<!-- 分页开始 -->
			<div class="row justify-content-center" style="margin-top:20px">
				<nav aria-label="Page navigation example" >
					  <ul class="pagination ">
					  
					    <li class="page-item">
					      <a class="page-link" href="/index?page=${articlePage.pageNum-1}" aria-label="Previous">
					        <span aria-hidden="true">&laquo;</span>
					      </a>
					    </li>
					    
					    <c:forEach begin="1" end="${articlePage.pages}" varStatus="index">
					    	
					    	<!-- 当前页码的处理 -->
					    	<c:if test="${articlePage.pageNum==index.index}">
					    		<li class="page-item"><a class="page-link" href="javascript:void()"><font color="red"> ${index.index} </font></a>  </li>
					  		</c:if>
					  		
					  		<!-- 非当前页码的处理 -->
							<c:if test="${articlePage.pageNum!=index.index}">
					    		<li class="page-item"><a class="page-link" href="/index?page=${index.index}"> ${index.index}</a></li>
					  		</c:if>
					  
					    </c:forEach>
					    
					    <li class="page-item">
					      <a class="page-link" href="/index?page=${articlePage.pageNum+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
					    
					  </ul>
					</nav>
			</div>
			<!-- 分页结束 -->
			
		</div>
		
		<!-- 右侧 -->
		<div class="col-md-4">
				
				<div class="card">
					  <div class="card-header">
					    最新文章
					  </div>
					  <div class="card-body">
					     <ol>
					     	<c:forEach items="${lastArticles}" var="article" varStatus="index">
					     		<li class="ex"> ${index.index+1}. <a href="/article/detail?id=${article.id}" target="_blank" >${article.title}</a></li>
					     	</c:forEach>
					     	
					     </ol>
					  </div>
				</div>	
				
					
			  <div class="card" style="margin-top:50px">
					  <div class="card-header">
					    公告
					  </div>
					  <div class="card-body">
					     <ul>
					     	<li>1</li>
					     	<li>2</li>
					     	<li>3</li>
					     </ul>
					  </div>
				</div>			
		</div>
	</div>
</div>

<jsp:include page="common/footer.jsp"></jsp:include>


</body>
</html>