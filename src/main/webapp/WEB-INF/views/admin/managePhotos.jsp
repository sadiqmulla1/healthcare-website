<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Photos</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/includes/adminHeader.jsp" />

<main class="p-5 px-1 px-md-5">

    <!-- Upload Photos -->
    <section>
        <div class="container mt-5 mx-auto">
            <h1 class="text-center mb-4">Upload Photo</h1>

            <div class="form-container bg-secondary text-light fw-semibold border rounded-3 p-5">

                <!-- This will later submit to PhotoUploadServlet -->
                <form action="${pageContext.request.contextPath}/admin/photos/upload"
                      method="POST"
                      enctype="multipart/form-data">

                    <div class="mb-3">
                        <label for="title" class="form-label">Title</label>
                        <input type="text" class="form-control" id="title" name="title" required>
                    </div>

                    <div class="mb-3">
                        <label for="image" class="form-label">Select Image</label>
                        <input type="file" class="form-control" id="image" name="image" accept="image/*" required>
                    </div>

                    <button type="submit" class="btn btn-primary">Upload</button>
                </form>

            </div>
        </div>
    </section>

    <!-- Uploaded Photos -->
    <section class="gallery min-vh-100 mt-5">
        <div class="container-lg">
            <h1 class="text-center mb-4 display-5 fw-semibold">Uploaded Photos</h1>

            <div class="row gy-4 row-cols-1 row-cols-sm-2 row-cols-md-3">

                <!-- Loop photos -->
                <c:if test="${not empty photos}">
                    <c:forEach var="photo" items="${photos}">
                        <div class="col">

                            <img src="${pageContext.request.contextPath}/images/photo_gallery/${photo.imageUrl}"
                                 class="gallery-item rounded-2"
                                 alt="${photo.title}" />

                            <!-- Delete form -->
                            <form action="${pageContext.request.contextPath}/admin/photos/delete"
                                  method="POST"
                                  class="mt-2">

                                <input type="hidden" name="id" value="${photo.id}">
                                <button type="submit" class="btn btn-danger">
                                    Delete
                                </button>

                            </form>

                        </div>
                    </c:forEach>
                </c:if>

                <!-- No photos -->
                <c:if test="${empty photos}">
                    <div class="col">
                        <p class="text-center">No images found.</p>
                    </div>
                </c:if>

            </div>
        </div>
    </section>

</main>

</body>
</html>
