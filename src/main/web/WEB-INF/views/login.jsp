<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easyui/icon.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easyui/color.css"/>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css"/>

    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easyui.min.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
    <div data-options="region:'north'" class="layout-north">
        <h2>流动管理系统</h2>
    </div>
    <div data-options="region:'center'" class="layout-center">
        <div class="panel-box">
            <div class="easyui-panel panel-box-title" title="登录">
                <form action="" method="post">
                    <table cellpadding="5px">
                        <tr>
                            <td>用户名:</td>
                            <td><input class="easyui-textbox" data-options="prompt:'请输入用户名'" id="username" name="username" type="text"/></td>
                        </tr>
                        <tr>
                            <td>密码:</td>
                            <td><input class="easyui-textbox" data-options="prompt:'请输入密码'" id="password" name="password" type="password"/></td>
                        </tr>
                    </table>
                    <div class="btn-group">
                        <input class="easyui-linkbutton" style="width: 50px;" type="submit" value="登录">
                        <input class="easyui-linkbutton" style="width: 50px;" type="reset" value="重置">
                    </div>
                </form>
            </div>
            <div class="panel-footer-bottom">
                <a href="">忘记密码?</a> |
                <a href="">注册账号</a>
            </div>
        </div>
    </div>
</body>
</html>
