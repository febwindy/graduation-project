<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <jsp:include page="commons/inc_css.jsp"/>
    <jsp:include page="commons/inc_js.jsp"/>
    <title>首页</title>
</head>
<body class="easyui-layout">
<div data-options="region:'north'" style="height:50px; background-color: #EEE;">
    <%--<div style="float: left; line-height: 45px; padding-left: 50px;">流动党员管理系统</div>--%>
    <%--<div style="float: right; line-height: 45px; padding-right: 50px;">--%>
    <%--<span>欢迎</span>李文禾--%>
    <%--</div>--%>
    <div class="easyui-panel" style="padding:9px; text-align: right; background-color: #f9f9f9;">
        <div style="float: left; padding: 5px;">
            <span>流动党员管理系统</span>
        </div>
        <div style="float:right; background-color: #f9f9f9;">
            <a href="#" class="easyui-linkbutton" data-options="plain:true">Home</a>
            <a href="#" class="easyui-menubutton" data-options="menu:'#mm1'">Edit</a>
            <a href="#" class="easyui-menubutton" data-options="menu:'#mm2'">Help</a>
            <a href="#" class="easyui-menubutton" data-options="menu:'#mm3'">About</a>
        </div>
    </div>
    <div id="mm1" style="width:150px;">
        <div data-options="iconCls:'icon-undo'">Undo</div>
        <div data-options="iconCls:'icon-redo'">Redo</div>
        <div class="menu-sep"></div>
        <div>Cut</div>
        <div>Copy</div>
        <div>Paste</div>
        <div class="menu-sep"></div>
        <div>
            <span>Toolbar</span>

            <div>
                <div>Address</div>
                <div>Link</div>
                <div>Navigation Toolbar</div>
                <div>Bookmark Toolbar</div>
                <div class="menu-sep"></div>
                <div>New Toolbar...</div>
            </div>
        </div>
        <div data-options="iconCls:'icon-remove'">Delete</div>
        <div>Select All</div>
    </div>
    <div id="mm2" style="width:100px;">
        <div>Help</div>
        <div>Update</div>
        <div>About</div>
    </div>
    <div id="mm3" class="menu-content" style="background:#f0f0f0;padding:10px;text-align:left">
        <img src="http://www.jeasyui.com/images/logo1.png" style="width:150px;height:50px">

        <p style="font-size:14px;color:#444;">Try jQuery EasyUI to build your modern, interactive, javascript
            applications.</p>
    </div>
</div>
<div data-options="region:'west',split:true" title="功能菜单" style="width:20%;">
    <div class="easyui-accordion" data-options="fit:true,border:false">
        <div title="流动党员管理" style="padding:10px;">
            content1
        </div>
        <%--<div title="用户管理" data-options="selected:true" style="padding:10px;">--%>
        <div title="用户管理" style="padding:10px;">
            content2
        </div>
        <div title="系统管理" style="padding:10px">
            content3
        </div>
    </div>
</div>
<div data-options="region:'center',title:'内容'" style="width: 80%">
    <div class="easyui-tabs" style="width:100%;height:250px;">
        <div title="主页" style="padding:10px">
            <p style="font-size:14px">jQuery EasyUI framework helps you build your web pages easily.</p>
            <ul>
                <li>easyui is a collection of user-interface plugin based on jQuery.</li>
                <li>easyui provides essential functionality for building modem, interactive, javascript applications.
                </li>
                <li>using easyui you don't need to write many javascript code, you usually defines user-interface by
                    writing some HTML markup.
                </li>
                <li>complete framework for HTML5 web page.</li>
                <li>easyui save your time and scales while developing your products.</li>
                <li>easyui is very easy but powerful.</li>
            </ul>
        </div>
        <div title="关于我们" style="padding:10px">
            <ul class="easyui-tree" data-options="url:'tree_data1.json',method:'get',animate:true"></ul>
        </div>
        <div title="帮助" data-options="closable:true">
            <div class="easyui-panel" title="Footer Content." style="width:100%; height: 100%;"
                 data-options="footer:'#ft'">
            </div>
            <div id="ft" style="padding:5px;">
                Footer Content.
            </div>
        </div>
    </div>
</div>
</body>
</html>
