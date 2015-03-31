<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--  分页 --%>
<div class="row">
    <div class="col-sm-6">
        <c:set var="modNumber" value="${(pagination.count % pagination.pageSize > 0 ? 1 : 0)}"/>
        <fmt:parseNumber value="${pagination.count / pagination.pageSize + modNumber}" var="totalPage" integerOnly="true"/>
        <div class="pagination-detail">总计 ${pagination.count} 条数据, 每页显示${pagination.pageSize}条,总计 ${totalPage}页</div>
    </div>
    <div class="col-sm-6">
        <ul class="pagination pagination-md pull-right">
            <c:choose>
                <c:when test="${fn:contains(param.url, '?')}">
                    <c:set value="${param.url}&pageSize=${pagination.pageSize}&page" var="paginationPath"/>
                </c:when>
                <c:otherwise>
                    <c:set value="${param.url}?pageSize=${pagination.pageSize}&page" var="paginationPath"/>
                </c:otherwise>
            </c:choose>

            <%-- 上一页 --%>
            <c:choose>
                <c:when test="${pagination.page - 1 <= 0}">
                    <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${paginationPath}=${pagination.page - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>

            <%-- 中间数字 --%>
            <c:forEach begin="1" end="${totalPage}" varStatus="status">
                <c:choose>
                    <c:when test="${totalPage < 10}">
                        <c:choose>
                            <c:when test="${pagination.page == status.index}">
                                <li class="active"><a href="#">${status.index}</a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="${paginationPath}=${status.index}">${status.index}</a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${status.index > (pagination.page - 5) && (status.index < (pagination.page + 4))}">
                                <c:choose>
                                    <c:when test="${pagination.page == status.index}">
                                        <li class="active"><a href="#">${status.index}</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li><a href="${paginationPath}=${status.index}">${status.index}</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </c:when>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <%-- 下一页 --%>
            <c:choose>
                <c:when test="${pagination.page == totalPage}">
                    <li class="disabled"><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${paginationPath}=${pagination.page + 1}" aria-label="Previous">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</div>
<%-- 分页结束 --%>