<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>组织申请列表</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">组织申请管理</h1>

            <jsp:include page="../layout/alert.jsp"/>

            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/organization/verified/process_list">组织申请管理</a></li>
                    <li class="active">组织申请列表</li>
                </ol>
                <div class="thumbnail">
                    <a class="btn btn-info btn-create" href="/organization/verified/create">创建</a>
                    <table class="table table-striped thumbnail">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>当前的组织</th>
                                <th>申请的组织</th>
                                <th>原因</th>
                                <th>进度</th>
                                <th>创建日期</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="organization" items="${pagination.data}" varStatus="list">
                                <tr>
                                    <th scope="row">${list.index + 1}</th>
                                    <td>${organization.source}</td>
                                    <td>${organization.destination}</td>
                                    <td>${organization.reason}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${organization.status}">
                                                已审核
                                            </c:when>
                                            <c:otherwise>
                                                正在处理中
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>${organization.createdDate}</td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" href="/organization/verified/delete/${organization.id}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <jsp:include page="../layout/pagination.jsp">
                        <jsp:param name="url" value="/organization/verified/process_list"/>
                    </jsp:include>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
