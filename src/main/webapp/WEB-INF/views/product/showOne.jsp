<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>${productDTO.id}번 상품</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row justify-content-center">
        <div row justify-content-end>
            <div class="col-1 text-end">
                <div class="row">
                    <img src="/images/trolley.png" onclick="javascript:location.href='/cart/selectAll'">
                </div>
            </div>
        </div>
        <div class="col-6">
            <table class="table table-striped">
                <tr>
                    <th>상품 번호</th>
                    <td>${productDTO.id}</td>
                </tr>
                <tr>
                    <th>상품명</th>
                    <td>${productDTO.name}</td>
                </tr>
                <tr>
                    <th>상품 설명</th>
                    <td>${productDTO.details}</td>
                </tr>
                <tr>
                    <th>가격</th>
                    <td>${productDTO.price}</td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <c:if test="${productDTO.writerId eq logIn.id}">
                            <a class="btn btn-outline-primary" href="/product/update/${productDTO.id}">수정하기</a>
                            <a class="btn btn-outline-danger" href="/product/delete/${productDTO.id}">삭제하기</a>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <c:if test="${logIn.level eq 1}">
                            <label for="count">수량 <input type="number" id="count"></label>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <c:if test="${logIn.level eq 1}">
                            <button type="button" class="btn btn-outline-success col-3" onclick="javascript:location.href='/cart/addToCart'">장바구니담기</button>
                            <button type="button" class="btn btn-outline-primary col-3" onclick="javascript:location.href='/cart/selectAll'">구매하기</button>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <a class="btn btn-outline-secondary" href="/product/showAll">목록으로</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>