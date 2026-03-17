<footer class="p-5 bg-primary text-light px-2 px-md-5">
    <div class="container">
        <div class="row align-items center justify-content-between gap-4 mx-auto" data-aos="fade-in">

            <div class="col-md">
                <div class="footer-col">
                    <h3 class="mb-2">Sample Healthcare Center</h3>
                    <p>
                        A modern healthcare facility focused on patient care,
                        wellness programs, and community health services.
                    </p>

                    <div class="social-icons mt-3">
                        <a href="#" target="_blank" aria-label="Facebook">
                            <i class="bi bi-facebook social-icon me-2 text-light"></i>
                        </a>
                        <a href="#" aria-label="Instagram">
                            <i class="bi bi-instagram social-icon me-2 text-light"></i>
                        </a>
                        <a href="#" aria-label="Twitter-X">
                            <i class="bi bi-twitter-x social-icon me-2 text-light"></i>
                        </a>
                    </div>

                    <div class="contact mt-4">
                        <a href="tel:+910000000000" class="text-light">
                            <p><i class="bi bi-telephone-fill text-light"></i> +91-0000000000</p>
                        </a>
                        <a href="mailto:contact@example.com" class="text-light">
                            <p><i class="bi bi-envelope-fill text-light"></i> contact@example.com</p>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-md">
                <div class="footer-col">
                    <h3 class="mb-2">Address</h3>
                    <address>
                        <p>123 Main Street, Central Area,
                           City Name, State 000000.</p>
                    </address>

                    <h3 class="mb-2">Branch</h3>
                    <address>
                        <p>456 Secondary Road, Business District,
                           City Name, State 000000.</p>
                    </address>
                </div>
            </div>

            <div class="col-md">
                <h3 class="mb-2">Visit Us</h3>
                <p>
                    <iframe class="border rounded img-fluid border-light"
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3151.835434509857!2d144.953735315904!3d-37.81627974202113!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6ad65d43f1f2fd81%3A0x5045675218ce7e33!2sCity%20Center!5e0!3m2!1sen!2sin!4v0000000000000">
                    </iframe>
                </p>
            </div>

        </div>
    </div>
</footer>

<div class="d-flex justify-content-between align-items-start bg-dark text-light">
    <p class="m-md-auto ms-2 ms-md-auto">
        &copy; <%= java.time.Year.now() %> Sample Healthcare Project &mdash; All Rights Reserved
    </p>

    <a href="${pageContext.request.contextPath}/admin/home">
        <i class="bi bi-person-fill-gear me-3 text-light" style="font-size: 1rem"></i>
    </a>
</div>
