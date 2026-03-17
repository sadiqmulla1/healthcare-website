<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sample Healthcare</title>

    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
    <script defer src="<%= request.getContextPath() %>/js/doctors.js"></script>
    <script defer src="<%= request.getContextPath() %>/js/scrollToTop.js"></script>
</head>
<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<!-- Showcase -->
<section class="bg-dark text-light p-5 p-lg-0 text-center text-sm-start" >
    <div class="container">
        <div class="d-sm-flex align-items-center justify-content-between">
            <div data-aos="fade-in" data-aos-duration="1000">
                <h1>Welcome to <span class="text-primary">Sample Healthcare</span></h1>
                <p class="lead my-4">
                    Trusted medical care with a focus on patient well-being, modern treatment,
                    and personalized healthcare services.
                </p>
                <a href="#appointment">
                    <button class="btn btn-primary btn-lg">Book An Appointment</button>
                </a>
            </div>
            <img class="img-fluid w-50 d-none d-sm-block"
                 src="<%= request.getContextPath() %>/images/svg/undraw_doctors.svg"
                 alt="medical illustration">
        </div>
    </div>
</section>

<!-- Logo and Lead Doctor -->
<section class="p-5 bg-dark-subtle text-dark mt-5">
    <div class="container">
        <div class="d-md-flex align-items-center justify-content-between">
            <div class="text-center">
                <h3 class="mb-3 mb-md-0">Dr. John Doe</h3>
                <p class="lead">MBBS, MD <span class="text-nowrap">(Medical University)</span></p>
            </div>
            <div class="text-center text-md-end">
                <img class="img-fluid w-25 p-0 p-md-4 rounded-circle"
                 src="images/logo/healthcare_logo.jpg"
                 alt="organization logo">
            </div>
        </div>
    </div>
</section>

<!-- Facilities -->
<section class="p-5 px-3 px-md-5" id="facilities">
    <div class="container">
        <div class="row gap-3">
            <div class="col-md">
                <div class="card bg-dark text-light" data-aos="flip-right">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-hospital"></i>
                        </div>
                        <h3 class="card-title">Emergency Care</h3>
                        <p>
                            Equipped facilities providing timely medical support and critical care services.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md">
                <div class="card bg-secondary text-light" data-aos="flip-left">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-heart-pulse"></i>
                        </div>
                        <h3 class="card-title">Diagnostics</h3>
                        <p>
                            Comprehensive diagnostic services with modern medical equipment and labs.
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md">
                <div class="card bg-dark text-light" data-aos="flip-right">
                    <div class="card-body text-center">
                        <div class="h1 mb-3">
                            <i class="bi bi-prescription2"></i>
                        </div>
                        <h3 class="card-title">Patient Services</h3>
                        <p>
                            Comfortable wards, pharmacy support, and patient-friendly medical services.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- About -->
<section class="p-5" id="about">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-md">
                <img class="img-fluid"
                     src="images/svg/undraw_medical-research.svg"
                     alt="research illustration"
                     data-aos="fade-up">
            </div>
            <div class="col-md px-0 px-md-5 p-5" data-aos="fade-up">
                <h1>About Us</h1>
                <p class="lead">
                    Sample Healthcare is a demonstration project showcasing a modern medical
                    website built using Java, JSP, Servlets, and JDBC.
                </p>
                <p>
                    This application demonstrates appointment booking, admin management,
                    database integration, and responsive UI design for educational purposes.
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Photo Gallery -->
<section class="p-5 bg-dark text-light pb-0 pb-md-5" id="gallery">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-md px-0 px-md-5 p-5" data-aos="fade-in">
                <h1>Photo Gallery</h1>
                <p class="lead">
                    Explore sample images representing healthcare environments and facilities.
                </p>
                <a href="<%= request.getContextPath() %>/public/gallery" class="btn btn-light mt-3">
                    <i class="bi bi-chevron-right"></i> View Gallery
                </a>
            </div>
            <div class="col-md">
                <img class="img-fluid"
                     src="images/svg/undraw_scientist.svg"
                     alt="illustration"
                     data-aos="fade-in">
            </div>
        </div>
    </div>
</section>

<!-- Feedback -->
<section class="p-5" id="feedback">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-md px-0 px-md-5 p-5">
                <h1 data-aos="fade-in">Feedback</h1>
                <p class="lead" data-aos="fade-in">
                    Sample testimonials and reviews demonstrating third-party widget integration.
                </p>
            </div>
            <div class="col-md px-0 px-md-5 p-5">
                <iframe class="border rounded"
                        src="about:blank"
                        frameborder="0"
                        width="100%"
                        height="400">
                </iframe>
            </div>
        </div>
    </div>
</section>

<!-- Appointment Message -->
<c:if test="${not empty requestScope.success_message}">
    <div class="alert alert-success mt-4 text-center">
        ${requestScope.success_message}
    </div>
</c:if>

<!-- Appointment Section -->
<section class="p-5 bg-dark text-light pb-0 pb-md-5" id="appointment">
    <div class="container">
        <div class="row align-items-center justify-content-between">

            <div class="col-md p-1 p-md-5 order-last order-md-first">
                <img class="img-fluid"
                     src="${pageContext.request.contextPath}/images/svg/undraw_booking.svg"
                     alt="appointment illustration">
            </div>

            <div class="col-md px-0 px-md-5 p-5">
                <h1 data-aos="fade-in">
                    Book An <span class="text-primary">Appointment</span>
                </h1>

                <form method="POST"
                      action="${pageContext.request.contextPath}/appointments/book"
                      class="container mt-4"
                      data-aos="fade-in">

                    <!-- Consultation Type -->
                    <div class="mb-3">
                        <label class="form-label h5">Consultation Type</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                   name="consultation_type"
                                   value="Clinic Visit" checked>
                            <label class="form-check-label">Clinic Visit</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                   name="consultation_type"
                                   value="Online Consultation">
                            <label class="form-check-label">Online Consultation</label>
                        </div>
                    </div>

                    <!-- Patient Name -->
                    <div class="mb-3">
                        <label class="form-label h5">Patient Name *</label>
                        <input type="text" name="patient_name" class="form-control" required>
                    </div>

                    <!-- Mobile -->
                    <div class="mb-3">
                        <label class="form-label h5">Mobile No *</label>
                        <input type="tel" name="mobile"
                               class="form-control"
                               pattern="[6-9]{1}[0-9]{9}"
                               maxlength="10"
                               required>
                    </div>

                    <!-- Patient Type -->
                    <div class="mb-3">
                        <label class="form-label h5">Patient Type</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                   name="patient_type"
                                   value="New" checked>
                            <label class="form-check-label">New</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio"
                                   name="patient_type"
                                   value="Review">
                            <label class="form-check-label">Review</label>
                        </div>
                    </div>

                    <div class="mb-3 text-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>

                </form>
            </div>

        </div>
    </div>
</section>

<!-- Doctors -->
<jsp:include page="doctors.jsp"/>

<!-- Footer -->
<jsp:include page="../includes/footer.jsp"/>

<!-- Scroll to top -->
<button id="scrollToTopBtn" class="btn btn-secondary rounded-circle"
        style="display:none; position:fixed; bottom:30px; right:30px; z-index:1000;">
    <i class="bi bi-arrow-up"></i>
</button>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>AOS.init();</script>

</body>
</html>
