<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>장바구니</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid">
    <div class="main h-100">
        <div class="row justify-content-center">
            <div class="col-8 text-center">
                <table class="table table-striped">
                    <tr>
                        <th>장바구니 번호</th>
                        <th colspan="3">장바구니 아이템 번호</th>
                        <th>장바구니 아이템 개수</th>
                        <th>장바구니 주인 번호</th>
                    </tr>
                    <c:forEach items="${list}" var="item">
                        <tr onclick="javascript:location.href='/cart/selectOne/${item.id}'">
                            <td>${item.id}</td>
                            <td colspan="3">${item.itemId}</td>
                            <td>${item.itemValue}</td>
                            <td>${item.ownerId}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row justify-content-end">
            <div class="col-3">
                <a class="btn btn-outline-secondary" onclick="javascript:history.go(-1)">이전 페이지로</a>
                <a class="btn btn-outline-success" href="/">선택상품 구매하기</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>