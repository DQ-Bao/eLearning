<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="script">
        <script>
            const inputs = [ 
                document.getElementById("num1"),
                document.getElementById("num2"),
                document.getElementById("num3"),
                document.getElementById("num4"),
                document.getElementById("num5"),
                document.getElementById("num6") 
            ];
            const btn = document.getElementById("verify_btn");
            window.addEventListener("load", () => inputs[0].focus());
            btn.setAttribute("disabled", "");

            inputs[0].addEventListener("paste", function (e) {
                e.preventDefault();

                const pastedValue = (event.clipboardData || window.clipboardData).getData("text");
                if (!/^\d+$/.test(pastedValue)) {
                    return;
                }
                const otpLength = inputs.length;

                for (let i = 0; i < otpLength; i++) {
                    if (i < pastedValue.length) {
                        inputs[i].value = pastedValue[i];
                        inputs[i].removeAttribute("disabled");
                        inputs[i].focus();
                    } else {
                        inputs[i].value = ""; // Clear any remaining inputs
                        inputs[i].focus();
                    }
                }
            });

            for (let i = 0; i < inputs.length; i++) {
                const input = inputs[i];
                const nextInput = i >= inputs.length - 1 ? null : inputs[i + 1];
                const prevInput = i <= 0 ? null : inputs[i - 1];
                input.addEventListener("keyup", (e) => {
                    if (input.value.length > 1) {
                        input.value = "";
                        return;
                    }
                    if (nextInput && nextInput.hasAttribute("disabled") && input.value !== "") {
                        nextInput.removeAttribute("disabled");
                        nextInput.focus();
                    }
                    if (e.key === "Backspace") {
                        for (let j = 0; j < inputs.length; j++) {
                            if ((i <= j) && prevInput) {
                                input.setAttribute("disabled", "");
                                input.value = "";
                                prevInput.focus();
                            }
                        }
                    }

                    btn.setAttribute("disabled", "");
                    if (!inputs[inputs.length - 1].disabled && inputs[inputs.length - 1].value !== "") {
                        btn.removeAttribute("disabled");
                    }
                });
            }
            
            function concatOTP() {
                const inputs = [ 
                    document.getElementById("num1"),
                    document.getElementById("num2"),
                    document.getElementById("num3"),
                    document.getElementById("num4"),
                    document.getElementById("num5"),
                    document.getElementById("num6") 
                ];
                let otp = "";
                for (let i = 0; i < inputs.length; i++) {
                    otp += inputs[i].value;
                }
                document.getElementById("verify_otp").value = otp;
            }
        </script>
    </jsp:attribute>
    <jsp:attribute name="head">
        <style>
            .otp-input {
                width: 45px;
                height: 45px;
                text-align: center;
                font-size: 1.125rem;
                border-radius: 0.25rem;
                border: 1px solid #ddd;
            }

            .otp-input:focus {
                box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
            }

            .otp-input::-webkit-inner-spin-button,
            .otp-input::-webkit-outer-spin-button {
                display: none;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="container-xxl d-block">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                    <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                        <div class="card-body p-5 text-center">
                            <h4>Verify</h4>
                            <p>Your code was sent to you via email</p>
                            
                            <form action="${pageContext.request.contextPath}/verify" method="post" onsubmit="concatOTP()">
                                <input type="hidden" name="verify_email" value="${requestScope.verify_email}">
                                <input type="hidden" name="verify_otp" id="verify_otp">
                                <div class="row g-2 justify-content-center mb-4">
                                    <div class="col-auto">
                                        <input type="number" id="num1" class="form-control otp-input" maxlength="1">
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="num2" class="form-control otp-input" maxlength="1" disabled>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="num3" class="form-control otp-input" maxlength="1" disabled>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="num4" class="form-control otp-input" maxlength="1" disabled>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="num5" class="form-control otp-input" maxlength="1" disabled>
                                    </div>
                                    <div class="col-auto">
                                        <input type="number" id="num6" class="form-control otp-input" maxlength="1" disabled>
                                    </div>
                                </div>
                                <button type="submit" name="action" value="verify" id="verify_btn" class="btn btn-primary w-100 mb-3">Verify</button>
                                <p>Didn't receive code? <button type="submit" name="action" value="send_again" class="btn btn-link">Send again</button></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>