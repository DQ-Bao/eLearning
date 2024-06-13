<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t" %>
<t:main>
    <jsp:attribute name="script">
        <script>
            const inputs = document.querySelectorAll(".otp-field > input");
            const button = document.querySelector(".btn");

            window.addEventListener("load", () => inputs[0].focus());
            button.setAttribute("disabled", "disabled");

            inputs[0].addEventListener("paste", function (event) {
                event.preventDefault();

                const pastedValue = (event.clipboardData || window.clipboardData).getData(
                "text"
                );
                const otpLength = inputs.length;

                for (let i = 0; i < otpLength; i++) {
                if (i < pastedValue.length) {
                    inputs[i].value = pastedValue[i];
                    inputs[i].removeAttribute("disabled");
                    inputs[i].focus;
                } else {
                    inputs[i].value = ""; // Clear any remaining inputs
                    inputs[i].focus;
                }
                }
            });

            inputs.forEach((input, index1) => {
                input.addEventListener("keyup", (e) => {
                const currentInput = input;
                const nextInput = input.nextElementSibling;
                const prevInput = input.previousElementSibling;

                if (currentInput.value.length > 1) {
                    currentInput.value = "";
                    return;
                }

                if (
                    nextInput &&
                    nextInput.hasAttribute("disabled") &&
                    currentInput.value !== ""
                ) {
                    nextInput.removeAttribute("disabled");
                    nextInput.focus();
                }

                if (e.key === "Backspace") {
                    inputs.forEach((input, index2) => {
                    if (index1 <= index2 && prevInput) {
                        input.setAttribute("disabled", true);
                        input.value = "";
                        prevInput.focus();
                    }
                    });
                }

                button.classList.remove("active");
                button.setAttribute("disabled", "disabled");

                const inputsNo = inputs.length;
                if (!inputs[inputsNo - 1].disabled && inputs[inputsNo - 1].value !== "") {
                    button.classList.add("active");
                    button.removeAttribute("disabled");

                    return;
                }
                });
            });
        </script>
    </jsp:attribute>
    <jsp:attribute name="head">
        <style>
            .otp-field {
                flex-direction: row;
                column-gap: 10px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .otp-field input {
                height: 45px;
                width: 42px;
                border-radius: 6px;
                outline: none;
                font-size: 1.125rem;
                text-align: center;
                border: 1px solid #ddd;
            }

            .otp-field input:focus {
                box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
            }

            .otp-field input::-webkit-inner-spin-button,
            .otp-field input::-webkit-outer-spin-button {
                display: none;
            }

            .resend {
                font-size: 12px;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <div class="container-xxl bg-body-tertiary d-block">
            <div class="row justify-content-center">
                <div class="col-12 col-md-6 col-lg-4" style="min-width: 500px;">
                    <div class="card bg-white mb-5 mt-5 border-0" style="box-shadow: 0 12px 15px rgba(0, 0, 0, 0.02);">
                        <div class="card-body p-5 text-center">
                            <h4>Verify</h4>
                            <p>Your code was sent to you via email</p>
                            
                            <form action="${pageContext.request.contextPath}/register" method="post">
                                <input type="hidden" name="action" value="verify-otp">
                                <input type="hidden" name="email" value="${requestScope.email}">
                                <div class="otp-field mb-4">
                                    <input type="number" name="num1">
                                    <input type="number" name="num2" disabled>
                                    <input type="number" name="num3" disabled>
                                    <input type="number" name="num4" disabled>
                                    <input type="number" name="num5" disabled>
                                    <input type="number" name="num6" disabled>
                                </div>
                                <button type="submit" class="btn btn-primary mb-3">Verify</button>
                            </form>
                            <form action="${pageContext.request.contextPath}/register" method="post">
                                <input type="hidden" name="action" value="resend-otp">
                                <input type="hidden" name="email" value="${requestScope.email}">
                                <p class="resend mb-0">
                                    Didn't receive code? <button type="submit" class="btn btn-link">Send again</button>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>