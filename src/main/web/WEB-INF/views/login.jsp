<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <jsp:include page="commons/inc_css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>
    <jsp:include page="commons/inc_js.jsp"/>
</head>
<body class="easyui-layout">
    <div data-options="region:'north'" class="layout-north">
        <h2>流动管理系统</h2>
    </div>
    <div data-options="region:'center'" class="layout-center">
        <div class="panel-box">
            <div class="easyui-panel panel-box-title" title="登录">
                <form class="easyui-form" id="loginForm" method="post" data-options="novalidate:true">
                    <table cellpadding="5px">
                        <tr>
                            <td>用户名:</td>
                            <td><input id="username" class="easyui-textbox" data-options="prompt:'请输入用户名', required:true, missingMessage:'用户名不能为空'" id="username" name="username" type="text"/></td>
                        </tr>
                        <tr>
                            <td>密码:</td>
                            <td><input class="easyui-textbox" data-options="prompt:'请输入密码', required:true, missingMessage:'密码不能为空'" id="password" name="password" type="password"/></td>
                        </tr>
                    </table>
                    <div class="btn-group">
                        <button class="easyui-linkbutton" style="width: 50px;" type="submit">登录</button>
                        <button id="clearForm" class="easyui-linkbutton" style="width: 50px;" type="clearForm">重置</button>
                    </div>
                </form>
            </div>
            <div class="panel-footer-bottom">
                <a href="">忘记密码?</a> |
                <a href="">注册账号</a>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#loginForm").form({
            url : "${pageContext.request.contextPath}/j_spring_security_check",
            onSubmit:function(){
                return $(this).form('enableValidation').form('validate');
            },
            success : function(result) {
                var data = $.parseJSON(result);
                if (0 == data.status) {
                    alert(data.message);
                }
            }
        });

        $("#clearForm").click(function(){
           $("#loginForm").form("clear");
        });

    </script>
</body>
</html>
