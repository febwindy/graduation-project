<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户授权</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">用户管理</h1>
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/user/list">用户管理</a></li>
                    <li class="active">用户列表</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal" action="/user/authorization/${user.id}" method="post">
                        <div class="form-group">
                            <label for="username" class="col-sm-3 control-label">用户名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="username" name="username" readonly
                                       required="true" placeholder="请输入用户名" value="${user.username}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="roles" class="col-sm-3 control-label">角色列表</label>
                            <div id="roles" class="col-sm-6">
                                <c:forEach var="role" items="${roles}">
                                    <c:set var="checked" value=""/>
                                    <c:forEach var="userRole" items="${user.roles}">
                                        <c:if test="${role.id.equals(userRole.id)}">
                                            <c:set var="checked" value="checked"/>
                                        </c:if>
                                    </c:forEach>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="${role.id}" name="roles" ${checked}/> ${role.description}
                                        </label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <div class="col-sm-offset-3 col-sm-2">
                                    <button type="submit" class="btn btn-md btn-success btn-block">授权</button>
                                </div>
                                <div class="col-sm-2">
                                    <a href="/user/list" class="btn btn-md btn-danger btn-block" type="button">返回</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
<script>
    $(function(){

    });
</script>
</html>
