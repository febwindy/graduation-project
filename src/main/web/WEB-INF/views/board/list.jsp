<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>留言列表</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">留言管理</h1>

            <jsp:include page="../layout/alert.jsp"/>

            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/board/list">留言管理</a></li>
                    <li class="active">留言列表</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-inline">
                        <div class="form-group">
                            <label for="title">标题</label>
                            <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题"
                                   value="${board.title}">
                        </div>
                        <button type="submit" class="btn btn-success">
                            <span class="glyphicon glyphicon-search" aria-hidden="true"></span>查询
                        </button>
                        <a class="btn btn-info" href="/board/create">创建</a>
                    </form>
                    <table class="table table-striped thumbnail">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>标题名</th>
                                <th>内容</th>
                                <th>更新日期</th>
                                <th>创建日期</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="board" items="${pagination.data}" varStatus="list">
                                <tr>
                                    <th scope="row">${list.index + 1}</th>
                                    <td>${board.title}</td>
                                    <td>${board.content}</td>
                                    <td>${board.updatedDate}</td>
                                    <td>${board.createdDate}</td>
                                    <td>
                                        <c:if test="${!empty board.user}">
                                            ${board.user.username}
                                        </c:if>
                                    </td>
                                    <td>
                                        <a class="btn btn-primary btn-sm" href="/board/view/${board.id}">查看</a>
                                        <a class="btn btn-warning btn-sm" href="/board/edit/${board.id}">编辑</a>
                                        <a class="btn btn-danger btn-sm" href="/board/delete/${board.id}">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <jsp:include page="../layout/pagination.jsp">
                        <jsp:param name="url" value="/board/list?title=${board.title}"/>
                    </jsp:include>
                </div>
            </section>
        </div>
    </div>
</div>
</body>
</html>
