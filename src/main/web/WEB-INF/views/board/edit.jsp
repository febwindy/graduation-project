<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>留言编辑</title>
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
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/board/list">留言管理</a></li>
                    <li class="active">留言编辑</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal" action="/board/edit/${board.id}" method="post">
                        <div class="form-group">
                            <label for="title" class="col-sm-3 control-label">留言标题</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="title" name="title"
                                       required="true" placeholder="请输入留言标题" value="${board.title}">
                                <form:errors cssStyle="color: #FA4707;" path="board.title" role="alert"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="content" class="col-sm-3 control-label">留言内容</label>
                            <div class="col-sm-6">
                                <div class="form-control" id="content" name="content" required="true"
                                     placeholder="请输入留言内容">
                                    ${board.content}
                                </div>
                                <form:errors cssStyle="color: #FA4707;" path="board.content" role="alert"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-3 col-sm-6">
                                <div class="col-sm-offset-3 col-sm-2">
                                    <button class="btn btn-md btn-primary btn-block" type="submit">提交</button>
                                </div>
                                <div class="col-sm-2">
                                    <a href="/board/list" class="btn btn-md btn-danger btn-block" type="button">返回</a>
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
<script src="${pageContext.request.contextPath}/resources/js/clear-tips.js"></script>
<script type="text/javascript">
    $(function(){
        window.um = UM.getEditor('content', {
            /* 传入配置参数,可配参数列表看umeditor.config.js */
            toolbar: ['source undo redo | bold italic underline | justifyleft justifyright justifycenter justifyjustify' +
            ' forecolor backcolor | time date | link | fontfamily fontsize paragraph'],
            initialFrameWidth:'100%',
            initialFrameHeight:255,
            minFrameHeight :500,
            focus:true
        });
    });
</script>
</html>
