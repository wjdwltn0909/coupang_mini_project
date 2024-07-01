<%@page language="java" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>회원 가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<div class="container-fluid h-100">
    <form action="/user/register" method="POST">
        <fieldset>
            <legend>회원가입 정보</legend>
            <div class="row justify-content-center">
                <div class="col-4">
                    <label for="username">아이디</label>
                    <input type="text" name="username" id="username" class="form-control" oninput="disableButton()" autofocus required>
                    <a class="btn btn-outline-primary" onclick="validateUsername()">중복확인</a>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4">
                    <label for="password">비밀번호</label>
                    <input type="password" name="password" id="password" class="form-control" required>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4">
                    <label for="nickname">닉네임</label>
                    <input type="text" name="nickname" id="nickname" class="form-control" required>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4">
                    <ul style="list-style-type: none">
                        <label class="reg" for="level">고객 유형</label>
                        <select name="level" id="level" required class="form-control">
                            <option value="1" >구매자</option>
                            <option value="2" >판매자</option>
                        </select>
                    </ul>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend>개인 정보</legend>
            <div class="row justify-content-center">
                <div class="col-4">
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" class="form-control" required>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4">
                    <label for="address">주소</label>
                    <input type="text" name="address" id="address" class="form-control" required>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4">
                    <label for="phoneNumber">연락처</label>
                    <input type="tel" name="phoneNumber" id="phoneNumber" class="form-control" required>
                </div>
            </div>
        </fieldset>
        <div class="row justify-content-center">
            <div class="col-4 text-center">
                <input id="btnSubmit" type="submit" class="btn btn-outline-primary" value="회원 가입" disabled>
                <a class="btn btn-outline-secondary" onclick="javascript:history.go(-1)">이전으로</a>
            </div>
        </div>
    </form>
    <script>
        function validateUsername() {
            let username = $('#username').val();
            $.ajax({
                url: '/user/validateUsername',
                type: 'get',
                data: {
                    'username': username
                },
                success: (result) => {
                    if (result.result === 'success') {
                        Swal.fire({
                            'title': '가입 가능한 아이디입니다.'
                        }).then(() => {
                                $('#btnSubmit').removeAttr('disabled');
                            }
                        )
                    } else {
                        Swal.fire({
                            'title': '중복된 아이디입니다.',
                            'icon': 'warning'
                        })
                    }
                }
            });
        }

        function disableButton() {
            $('#btnSubmit').attr('disabled', 'true');
        }
    </script>
</div>
</body>
















