<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <title>${boardDTO.id}번 게시글 수정하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/41.4.2/classic/ckeditor.js"></script>

</head>
<body>
<div>
    <form method="post" action="/product/update/${productDTO.id}">
        <div>
            <label for="name">상품명</label>
            <input type="text" name="name" id="name" value="${productDTO.name}">
        </div>
        <div>
            <label for="details">상품설명</label>
            <input type="text" name="details" id="details" value="${productDTO.details}">
        </div>
        <div>
            <label for="price">상품가격</label>
            <input type="text" name="price" id="price" value="${productDTO.price}">
        </div>
        <input type="submit" value="수정하기">
    </form>
</div>
</body>
</html>