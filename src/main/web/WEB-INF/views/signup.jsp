<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>注册</title>
    <jsp:include page="commons/inc_css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signup.css"/>
    <jsp:include page="commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="layout/nav.jsp"/>
<div class="jumbotron">
    <div class="container">
        <div class="row form-box">
            <div class="col-md-3 col-lg-3"></div>
            <div class="col-md-3 col-lg-3"></div>
            <div class="col-md-6 col-lg-6">
                <form class="form-signup thumbnail" action="/signup" method="post">
                    <h2 class="form-signup-heading" style="text-align: center;">注册用户</h2>
                    <div class="form-signup-margin">
                        <label for="username" class="sr-only">用户名</label>
                        <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名"
                               required="true" autofocus="true" value="${user.username}">
                        <form:errors cssStyle="color: #FA4707;" path="user.username" role="alert"/>
                    </div>
                    <div class="form-signup-margin">
                        <label for="password" class="sr-only">密码</label>
                        <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码"
                                required="true" value="${user.password}">
                        <form:errors cssStyle="color: #FA4707;" path="user.password" role="alert"/>
                    </div>
                    <div class="form-signup-margin">
                        <label for="confirmPassword" class="sr-only">确认密码</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" class="form-control"
                               placeholder="请输入确认密码" required="true" value="${user.confirmPassword}">
                        <form:errors cssStyle="color: #FA4707;" path="user.confirmPassword" role="alert"/>
                    </div>
                    <div class="form-signup-margin">
                        <label for="email" class="sr-only">邮件</label>
                        <input type="email" id="email" name="email" class="form-control" placeholder="请输入邮件"
                               required="true" value="${user.email}">
                        <form:errors cssStyle="color: #FA4707;" path="user.email" role="alert"/>
                    </div>
                    <div class="form-signup-margin">
                        <label for="telephone" class="sr-only">手机号码</label>
                        <input type="tel" id="telephone" name="telephone" class="form-control" placeholder="请输入手机号码"
                                required="true" value="${user.telephone}">
                        <form:errors cssStyle="color: #FA4707;" path="user.telephone" role="alert"/>
                    </div>
                    <div class="form-signup-margin">
                        <label for="sex" class="sr-only">性别</label>
                        <select id="sex" name="sex" class="form-control" placeholder="请选择性别" required="true">
                            <option value="">请选择</option>
                            <option value="0" <c:if test="${user.sex == '0'}">selected</c:if>>女</option>
                            <option value="1" <c:if test="${user.sex == '1'}">selected</c:if>>男</option>
                        </select>
                        <form:errors cssStyle="color: #FA4707;" path="user.sex" role="alert"/>
                    </div>
                    <div class="form-signup-margin">
                        <label for="remark" class="sr-only">备注</label>
                        <input type="text" id="remark" name="remark" class="form-control" placeholder="请输入备注" value="${user.remark}">
                    </div>
                    <div class="row btn-group-register">
                        <div class="col-md-6">
                            <button class="btn btn-md btn-primary btn-block" type="submit">提交</button>
                        </div>
                        <div class="col-md-6">
                            <button id="reset" class="btn btn-md btn-danger btn-block" type="button">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $("input, select").bind("click", function () {
            $(this).next("span").remove();
        });
        $("#reset").bind("click", function () {
            var formInputs = $("input, select");
            formInputs.each(function (a, b) {
                $(b).val("").next("span").remove();
            });
        });
    });
</script>
</html>
