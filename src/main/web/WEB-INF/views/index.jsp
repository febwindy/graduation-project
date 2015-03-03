<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easyui/themes/bootstrap/easyui.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easyui/icon.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/easyui/color.css"/>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.easyui.min.js" type="text/javascript"></script>
    <title>首页</title>
</head>
<body class="easyui-layout">
    <div data-options="region:'north'" style="height:50px"></div>
    <div data-options="region:'west',split:true" title="功能菜单" style="width:20%;">
        <div class="easyui-accordion" data-options="fit:true,border:false">
            <div title="流动党员管理" style="padding:10px;">
                content1
            </div>
            <div title="用户管理" data-options="selected:true" style="padding:10px;">
                content2
            </div>
            <div title="系统管理" style="padding:10px">
                content3
            </div>
        </div>
    </div>
    <div data-options="region:'center',title:' 1',iconCls:'icon-ok'" style="width: 80%">
        <div class="easyui-tabs" style="width:100%;height:250px;">
            <div title="主页" style="padding:10px">
                <p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
                <ul>
                    <li>easyui is a collection of user-interface plugin based on jQuery.</li>
                    <li>easyui provides essential functionality for building modem, interactive, javascript applications.</li>
                    <li>using easyui you don't need to write many javascript code, you usually defines user-interface by writing some HTML markup.</li>
                    <li>complete framework for HTML5 web page.</li>
                    <li>easyui save your time and scales while developing your products.</li>
                    <li>easyui is very easy but powerful.</li>
                </ul>
            </div>
            <div title="关于我们" style="padding:10px">
                <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
            </div>
            <div title="帮助" data-options="closable:true">
                <div class="easyui-panel" title="Footer Content." style="width:100%; height: 100%;" data-options="footer:'#ft'">
                </div>
                <div id="ft" style="padding:5px;">
                    Footer Content.
                </div>
            </div>
        </div>
    </div>
</body>
</html>
