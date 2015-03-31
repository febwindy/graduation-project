<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 消息提示 --%>
<c:if test="${!empty alertMessage}">
    <div class="alert alert-info alert-dismissible fade in list-alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <c:if test="${!empty alertMessage.type}">
            <strong>${alertMessage.type.name}!</strong>
        </c:if>
        ${alertMessage.message}.

        <script>
            $(function(){
                setTimeout(function(){
                    $(".list-alert").alert('close');
                }, 5000)
            });
        </script>
    </div>
</c:if>
