<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>

    <!-- Contact Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h6 class="section-title bg-white text-center text-primary px-3">Payment</h6>
                <h1 class="mb-5">Payment</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-8 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                    <form>
                        <div class="row g-3 justify-content-center">
                            <div class="col-6">
                                <div class="row g-3">
                                    <div class="col-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="name" placeholder="Name on card">
                                            <label for="name">Name on card</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="ccn" placeholder="Credit card number">
                                            <label for="ccn">Credit card number</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="ed" placeholder="EXP Date">
                                            <label for="ed">EXP Date</label>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="form-floating">
                                            <input type="text" class="form-control" id="cvv" placeholder="CVV">
                                            <label for="cvv">CVV</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button class="btn btn-primary w-100 py-3" type="submit">Pay</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6">
                                <img src="img/about.jpg" class="img-fluid">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact End -->
</t:main>

