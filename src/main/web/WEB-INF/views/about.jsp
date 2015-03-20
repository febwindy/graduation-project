<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>关于我们</title>
    <jsp:include page="commons/inc_css.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugin/onepage-scroll/onepage-scroll.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/about.css"/>
    <jsp:include page="commons/inc_js.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/plugin/onepage-scroll/jquery.onepage-scroll.js"></script>
</head>
<body>
<jsp:include page="layout/nav.jsp"/>
<div class="main onepage-wrapper">
    <section>
        <div class="box-position">
            <img src="/resources/images/about.png"/>
            <h2>离乡不离党，流动不流失</h2>
        </div>
    </section>
    <section>
        <div class="box-position">
            <h2>流动党员管理制度</h2>
            <div class="content">
                <h3>1、党员外出务工经商或从事其他正当职业，应事先向原所在党支部报告。</h3>
                <h3>2、党员外出时间在6个月以上，且有固定地点的，将其组织关系转至所在地区或单位党组织。</h3>
                <h3>3、党员临时或季节性外出且无固定地点的，组织关系仍由原党组织管理，并需申请核发《流动党员活动证》。</h3>
                <h3>4、正式党员3人以上集体外出，且地点相对集中的，建立临时党小组。党组织可通过网络、电话等形式对流动党员进行管理，如谈心、学习教育、信息交流、意见反馈等。</h3>
            </div>
        </div>
    </section>
    <section>
        <div class="box-position">
            <h2>流动党员管理制度</h2>
            <div class="content">
                <h3>5、外出党员和临时党小组负责人应主动经常与原党支部保持联系，定期向党员联系人汇报本人近期的思想、工作、生活与学习情况，外出党员接到原党支部有重要活动通知后，应按时返回。</h3>
                <h3>6、党员持《流动党员活动证》在外出所在地或单位党组织参加党的组织生活，但不享有表决权、选举权和被选举权。</h3>
                <h3>7、对外来务工经商的党员，积极接受他们的党组织关系和党员身份证明件，安排他们参加党的活动和过组织生活。</h3>
            </div>
        </div>
    </section>
</div>
</body>
<script type="text/javascript">
    $(function(){
        $('.main').onepage_scroll({
            animationTime:1000,
            loop:true,
            direction:"horizontal"
        });
    });
</script>
</html>
