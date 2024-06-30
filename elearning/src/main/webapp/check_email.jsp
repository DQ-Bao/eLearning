<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <section class="login section">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 offset-lg-3 col-md-8 offset-md-2 col-12">
                    <div class="form-head">
                        <h4 class="title">Enter your email</h4>
                        <form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" name="email" placeholder="Enter Email" id="email" class="margin-5px-bottom" required>
                            </div>
                            <div class="button">
                                <button type="submit" name="action" value="fpw_check_email" id="submit" class="btn">Next</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</t:main>