<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:body>
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container justify-content-center">
                <div class="row justify-content-center">
                    <div class="col-6 text-center">
                        <h1>Payment Result</h1>
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-6 table-responsive">
                        <table class="table table-striped table-hover">
                            <tbody>
                                <tr>
                                    <th>Transaction ID</th>
                                    <td>${param.vnp_TxnRef}</td>
                                </tr>
                                <tr>
                                    <th>Amount</th>
                                    <td><fmt:formatNumber type="currency" currencyCode="VND" value="${param.vnp_Amount / 100}"/></td>
                                </tr>
                                <tr>
                                    <th>Order Info</th>
                                    <td>${param.vnp_OrderInfo}</td>
                                </tr>
                                <tr>
                                    <th>Payment Response Code</th>
                                    <td>${param.vnp_ResponseCode}</td>
                                </tr>
                                <tr>
                                    <th>Transaction Number</th>
                                    <td>${param.vnp_TransactionNo}</td>
                                </tr>
                                <tr>
                                    <th>Bank Code</th>
                                    <td>${param.vnp_BankCode}</td>
                                </tr>
                                <tr>
                                    <th>Payment Date</th>
                                    <td><fmt:parseDate type="both" value="${param.vnp_PayDate}" pattern="yyyyMMddHHmmss"/></td>
                                </tr>
                                <tr>
                                    <th>Transaction Status</th>
                                    <td>
                                        <c:choose>
                                            <c:when test="${signValue eq vnp_SecureHash}">
                                                <c:choose>
                                                    <c:when test="${'00' eq param.vnp_TransactionStatus}">
                                                        <p class="text-success">Success</p>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <p class="text-danger">Failed</p>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:when>
                                            <c:otherwise>
                                                <p class="text-danger">Invalid signature</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <footer class="row justify-content-center footer">
                    <p class="col-6">&copy; VNPAY 2020</p>
                </footer>
                <div class="row justify-content-center">
                    <a class="col-6 btn btn-primary rounded-pill py-3 px-5" href="${pageContext.request.contextPath}">Go Back To Home</a>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>