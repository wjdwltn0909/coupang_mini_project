<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>${logIn.getNickname()} 회원님의 정보</title>
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
        <div class="col-6">
            <table class="table table-striped">
                <tr>
                    <th>고객 번호</th>
                    <td>${userDTO.id}</td>
                </tr>
                <tr>
                    <th>고객 아이디</th>
                    <td>${userDTO.username}</td>
                </tr>
                <tr>
                    <th>고객 비밀번호</th>
                    <td>${userDTO.password}</td>
                </tr>
                <tr>
                    <th>고객 별명</th>
                    <td>${userDTO.nickname}</td>
                </tr>
                <tr>
                    <th>고객 성함</th>
                    <td>${userDTO.name}</td>
                </tr>
                <tr>
                    <th>고객 주소</th>
                    <td>${userDTO.address}</td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <a class="btn btn-outline-primary" href="/user/update/${userDTO.id}">수정하기</a>
                        <a class="btn btn-outline-danger" href="/user/delete/${userDTO.id}">탈퇴하기</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <label for="count">수량 <input type="number" id="count"></label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <c:if test="${logIn.level eq 1}">
                            <button type="button" class="btn btn-outline-success col-3">장바구니담기</button>
                            <button type="button" class="btn btn-outline-primary col-3">구매하기</button>
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" class="text-center">
                        <a class="btn btn-outline-secondary" href="/product/showAll">상품 목록으로</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
</body>
</html>