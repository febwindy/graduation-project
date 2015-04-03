<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-sm-3 col-md-2 sidebar">
    <ul class="nav nav-sidebar">
        <li class="active">
            <a href="/index">
                <span class="glyphicon glyphicon-comment" aria-hidden="true"></span> 公告
                <span class="sr-only">(current)</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="glyphicon glyphicon-th" aria-hidden="true"></span> 流动党员管理
            </a>
        </li>

        <li>
            <a href="/user/list">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span> 用户管理
            </a>
        </li>
        <security:authorize access="hasAnyRole('administrator')">
            <li>
                <a href="/role/list">
                    <span class="glyphicon glyphicon-pawn" aria-hidden="true"></span> 角色管理
                </a>
            </li>
            <li>
                <a href="/permission/list">
                    <span class="glyphicon glyphicon-lock" aria-hidden="true"></span> 资源管理
                </a>
            </li>
        </security:authorize>
        <%--<li class="dropdown">--%>
            <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown">其它设置<span class="caret"></span></a>--%>
            <%--<div class="dropdown-menu" style="width: 100%; border: none; padding: 0px; margin: 0px;">--%>
                <%--<ul class="list-group" style="margin: 0px;">--%>
                    <%--<li class="list-group-item" style="background-color: #881A1A; border: none; border-radius: 0px;">--%>
                        <%--<a href="#" style="color: #fff;">功能三</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</li>--%>
        <%--<li>--%>
            <%--<a href="#">--%>
                <%--<span class="glyphicon glyphicon-cog" aria-hidden="true"></span> 系统设置--%>
            <%--</a>--%>
        <%--</li>--%>
    </ul>
</div>