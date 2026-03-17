<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Doctors</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/includes/adminHeader.jsp" />

<main class="p-5 px-1 px-md-5">

    <!-- Upload Doctor Form -->
    <section>
        <div class="container mt-5 mx-auto">
            <c:if test="${not empty param.success}">
                <div class="alert alert-success">Doctor successfully added!</div>
            </c:if>
            <c:if test="${not empty param.error}">
                <div class="alert alert-danger text-center">Failed to connect to the database</div>
            </c:if>
            <h1 class="text-center mb-4">Add New Doctor</h1>
            <div class="form-container bg-secondary text-light fw-semibold border border-rounded rounded-3 p-5">
                <form action="${pageContext.request.contextPath}/admin/doctors/upload" method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="name" class="form-label">Doctor Name</label>
                        <input type="text" class="form-control" id="name" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label for="speciality" class="form-label">Speciality</label>
                        <input type="text" class="form-control" id="speciality" name="speciality" required>
                    </div>
                    <div class="mb-3">
                        <label for="experience" class="form-label">Experience (years)</label>
                        <input type="number" class="form-control" id="experience" name="experience" required min="0">
                    </div>
                    <div class="mb-3">
                        <label for="education" class="form-label">Education</label>
                        <input type="text" class="form-control" id="education" name="education" required>
                    </div>
                    <div class="mb-3">
                        <label for="photo" class="form-label">Photo</label>
                        <input type="file" class="form-control" id="photo" name="photo" accept="image/*" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Upload Doctor</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Uploaded Doctors -->
    <section class="mt-5">
        <div class="container-lg">
            <h1 class="text-center mb-4 display-5 fw-semibold">Uploaded Doctors</h1>
            <div class="row gy-4 row-cols-1 row-cols-sm-2 row-cols-md-3">
                <c:forEach var="doctor" items="${doctors}">
                    <div class="col">
                        <div class="card h-100">
                            <img src="${pageContext.request.contextPath}/images/doctors/${doctor.photoPath}" class="card-img-top" alt="${doctor.name}">
                            <div class="card-body">
                                <h5 class="card-title">${doctor.name}</h5>
                                <p class="card-text">
                                    <strong>Speciality:</strong> ${doctor.speciality}<br>
                                    <strong>Experience:</strong> ${doctor.experience} years<br>
                                    <strong>Education:</strong> ${doctor.education}
                                </p>
                                <form action="${pageContext.request.contextPath}/admin/doctors/delete" method="POST">
                                    <input type="hidden" name="id" value="${doctor.id}">
                                    <button type="submit" class="btn btn-danger"
                                    onclick="return confirm('Are you sure you want to delete this doctor?');">Delete</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>

                <c:if test="${empty doctors}">
                    <div class="col">
                        <p class="text-center">No doctors found.</p>
                    </div>
                </c:if>

            </div>
        </div>
    </section>

</main>

</body>
</html>
