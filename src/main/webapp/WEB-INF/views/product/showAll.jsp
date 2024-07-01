<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <title>상품 리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<header class="header h-1">
    <div class="row ">
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li>
                            <img src="/images/user.png" style="width:30px;" onclick="javascript:location.href='/user/showMypage'">
                            <c:if test="${logIn.level eq 1}">
                                <img src="/images/trolley.png" style="width:30px;" onclick="javascript:location.href='/cart/selectAll'">
                            </c:if>
                        </li>
                    </ul>
                    <form class="d-flex" role="search">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="container-fluid">
    <div class="main h-80">
        <div class="row justify-content-center">
            <div class="col-8 text-center">
                <div class="row">
                    <c:forEach items="${list}" var="p">
                        <div class="col-lg-4 col-md-6 mb-4">
                            <div class="card" style="width: 18rem;">
                                <img src="..." class="card-img-top" alt="...">
                                <div class="card-body" onclick="javascript:location.href='/product/showOne/${p.id}'">
                                    <h5 class="card-title" colspan="3">${p.name}</h5>
                                    <p class="card-text">상품설명: ${p.details}</p>
                                    <p class="card-text">가격: ${p.price}원</p>
                                </div>
                                <div class="card-body">
                                    <a href="#" class="card-link">Card link</a>
                                    <a href="#" class="card-link">Another link</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <c:if test="${logIn.level eq 2}">
                        <a class="btn btn-outline-primary" href="/product/write">제품 등록하기</a>
                    </c:if>
                    <a class="btn btn-outline-danger" href="/">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>












