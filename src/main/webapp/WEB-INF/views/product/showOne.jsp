<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>${productDTO.id}번 상품</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> <!-- jQuery 추가 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<header class="header h-1">
    <div class="row">
        <nav class="navbar navbar-expand-lg bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="#"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item"></li>
                        <li>
                            <div class="d-flex align-items-center">
                                <figure class="text-center m-2">
                                    <img src="/images/user.png" style="width:30px;" onclick="javascript:location.href='/user/showMypage'">
                                    <figcaption>마이페이지</figcaption>
                                </figure>
                                <c:if test="${logIn.level eq 1}">
                                    <figure class="text-center m-2">
                                        <img src="/images/trolley.png" style="width:30px;" onclick="javascript:location.href='/cart/selectAll/${logIn.id}'">
                                        <figcaption>장바구니</figcaption>
                                    </figure>
                                </c:if>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<div class="container-fluid">
    <div class="row justify-content-center">
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
                <c:if test="${productDTO.writerId eq logIn.id}">
                    <tr>
                        <td colspan="3" class="text-center">
                            <a class="btn btn-outline-primary" href="/product/update/${productDTO.id}">수정하기</a>
                            <a class="btn btn-outline-danger" href="/product/delete/${productDTO.id}">삭제하기</a>
                        </td>
                    </tr>
                </c:if>
                <c:if test="${logIn.level eq 1}">
                    <tr>
                        <label for="value"><th>수량</th></label>
                        <td colspan="3">
                            <input type="number" id="value">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-center">
                            <button type="button" class="btn btn-outline-success col-3" onclick="addToCart(${productDTO.id})">장바구니담기</button>
                            <button type="button" class="btn btn-outline-primary col-3" onclick="javascript:location.href='/order/showOrder'">구매하기</button>
                        </td>
                    </tr>
                </c:if>
                <tr>
                    <td colspan="3" class="text-center">
                        <a class="btn btn-outline-secondary" href="/product/showAll">목록으로</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script>
    function addToCart(id) {
        // 장바구니에 아이템 추가
        const productId = id;
        const quantity = parseInt($('#value').val(), 10); // 수량 값을 정수로 변환

        console.log(productId);
        console.log(quantity);

        Swal.fire({
            title: '정말로 장바구니에 담으시겠습니까?',
            showCancelButton: true,
            confirmButtonText: '장바구니 담기',
            cancelButtonText: '취소',
            icon: 'warning'
        }).then((result) => {
            if (result.isConfirmed) {
                if (quantity <= 0 || isNaN(quantity)) { // 수량이 0 이하이거나 숫자가 아닌 경우 확인
                    Swal.fire({
                        title: '상품 수량을 선택해주세요!!!',
                        icon: 'error' // 경고 아이콘 추가
                    });
                } else {
                    Swal.fire({
                        title: '해당 상품을 장바구니에 담았습니다.'
                    }).then((result) => {
                        location.href = '/cart/insert/' + productId + '/' + quantity;
                    });
                }
            }
        });
    }
</script>
</body>
</html>