<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>留言创建</title>
    <jsp:include page="../commons/inc_css.jsp"/>
    <jsp:include page="../commons/inc_js.jsp"/>
</head>
<body>
<jsp:include page="../layout/nav.jsp"/>
<div class="container-fluid">
    <div class="row">
        <jsp:include page="../layout/menu.jsp"/>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">申请组织管理</h1>
            <section class="thumbnail">
                <ol class="breadcrumb">
                    <li><a href="/organization/verified/process_list">申请组织管理</a></li>
                    <li class="active">申请组织</li>
                </ol>
                <div class="thumbnail">
                    <form class="form-horizontal" action="/organization/verified/create" method="post">
                        <div class="form-group">
                            <label for="source" class="col-sm-3 control-label">当前的组织</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="source" name="source"
                                       required="true" placeholder="请输入当前的组织" value="${organization.source}">
                                <form:errors cssStyle="color: #FA4707;" path="organization.source" role="alert"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="destination" class="col-sm-3 control-label">申请的组织</label>
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="destination" name="destination"
                                       required="true" placeholder="请输入申请的组织" value="${organization.destination}">
                                <form:errors cssStyle="color: #FA4707;" path="organization.destination" role="alert"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reason" class="col-sm-3 control-label">申请原因</label>
                            <div class="col-sm-6">
                                <div class="form-control" id="reason" name="reason" required="true"
                                     placeholder="请输入原因">
                                    ${organization.reason}
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
                                    <button id="reset" class="btn btn-md btn-danger btn-block" type="button">重置</button>
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
        window.um = UM.getEditor('reason', {
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
