<%@page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<html>
<head>
    <title>싱품 등록하기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-fluid">
    <form method="post" action="/product/write" enctype="multipart/form-data">
        <div class="table">
            <div class="row justify-content-center mb-3">
                <div class="col-6">
                    <div>
                        <label for="name">상품명</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="상품명" required>
                    </div>
                    <div>
                        <label for="details">상품설명</label>
                        <br>
                        <textarea type="text" name="details" id="details" placeholder="상품 설명" required></textarea>
                    </div>
                    <div>
                        <label for="price">가격</label>
                        <input type="number" id="price" name="price" min="0" step="10"  class="form-control" placeholder="가격(원)" required>
                    </div>
                    <div>
                        <label for="stock">재고</label>
                        <input type="number" class="form-control" id="stock" name="stock" min="0" placeholder="재고(개수)" required>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-6">
                    <label for="input_file">첨부 파일</label>
                    <input type="file" class="form-control" id="input_file" name="file" multiple>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-6">
                    <input type="submit" class="btn btn-outline-primary w-100" value="작성하기">
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-6">
                    <a href="/" class="btn btn-outline-danger w-100" value="이전으로"/>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    ClassicEditor
        .create(document.querySelector('#input_content'), {
            ckfinder: {
                uploadUrl: '/product/uploads'
            }
        })
        .catch(error => {
            console.log(error)
        })

</script>
</body>
</html>