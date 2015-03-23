<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
    <jsp:include page="commons/inc_css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/signin.css"/>
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
                <form class="form-signin" action="/login_check" method="post">
                    <div class="row thumbnail">
                        <div class="col-md-6">
                            <section>
                                <h2 class="form-signin-heading">用户登录</h2>
                                <label for="username" class="sr-only">用户名</label>
                                <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名" required="true"
                                       autofocus="">
                                <label for="password" class="sr-only">密码</label>
                                <input type="password" id="password" name="password" class="form-control" placeholder="请输入密码" required="true">

                                <div class="row">
                                    <div class="checkbox col-md-8">
                                        <label>
                                            <input type="checkbox" value="remember-me"> 记住我
                                        </label>
                                    </div>
                                    <div class="col-md-4">
                                        <button class="btn btn-md btn-primary btn-block" type="submit">提交</button>
                                    </div>
                                </div>
                                <c:if test="${!empty error}">
                                    <div class="alert-danger center">${error}</div>
                                </c:if>
                            </section>
                        </div>
                        <div class="col-md-6 register">
                            <section>
                                <h2>没有帐户？</h2>
                                <section>
                                    <p>这是一个流动党员系统</p>

                                    <p>该系统主是要对重庆市流动党员的管理</p>

                                    <p>1、流入/流出地的管理</p>

                                    <p>2、党籍的管理</p>

                                    <p>
                                        <a class="btn btn-md" href="/signup"> 注册 </a>
                                    </p>
                                </section>
                            </section>
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
       $("input").click(function(){
           $(".alert-danger").remove();
       }) ;
    });
</script>
</html>
