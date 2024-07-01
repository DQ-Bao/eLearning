<%@tag description="Course Card" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@attribute name="id" required="true"%>
<%@attribute name="title" required="true"%>
<%@attribute name="image_path" required="true"%>
<%@attribute name="price" type="java.lang.Double" required="true"%>
<%@attribute name="manager_name" required="true"%>
<%@attribute name="category_name" required="true"%>
<%@attribute name="index" type="java.lang.Integer"%>
<div class="single-course wow fadeInUp" data-wow-delay="${0.2 + (index * 0.2)}s">
    <div class="course-image">
        <a href="${pageContext.request.contextPath}/courses/${id}">
            <img src="${pageContext.request.contextPath}/img/${image_path}" alt="${title}">
        </a>
        <p class="price">
            <c:choose>
                <c:when test="${price == 0}">
                    FREE
                </c:when>
                <c:otherwise>
                    <fmt:formatNumber type="currency" currencyCode="VND" value="${price}"/>
                </c:otherwise>
            </c:choose>
        </p>
    </div>
    <div class="content">
        <h3><a href="${pageContext.request.contextPath}/courses/${id}">${title}</a></h3>
    </div>
    <div class="bottom-content">
        <div class="row">
            <div class="col-7">
                <i class="lni lni-graduation"></i>
                <p>${manager_name}</p>
            </div>
            <div class="col-5 tag">
                <i class="lni lni-tag"></i>
                <a href="${pageContext.request.contextPath}/courses?category=${category_name}">${category_name}</a>
            </div>
        </div>
    </div>
</div>