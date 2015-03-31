<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>角色权限</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">角色管理</h1>
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/role/list">角色管理</a></li>
                    <li class="active">角色权限</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal" action="/role/authorization/${role.id}" method="post">
                        <div class="form-group">
                            <label for="role" class="col-sm-3 control-label">角色名</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="role" name="role" readonly
                                       required="true" placeholder="请输入角色名" value="${role.role}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="permissions" class="col-sm-3 control-label">权限列表</label>
                            <div id="permissions" class="col-sm-6">
                                <c:forEach var="permission" items="${permissions}">
                                    <c:set var="checked" value=""/>
                                    <c:forEach var="rolePermission" items="${role.permissions}">
                                        <c:if test="${permission.id.equals(rolePermission.id)}">
                                            <c:set var="checked" value="checked"/>
                                        </c:if>
                                    </c:forEach>
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" value="${permission.id}" name="permissions" ${checked}/>
                                            ${permission.resource} - ${permission.description}
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
                                    <a href="/role/list" class="btn btn-md btn-danger btn-block" type="button">返回</a>
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
</html>
