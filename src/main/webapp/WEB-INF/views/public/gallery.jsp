<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Photo Gallery</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;600;800&family=Lobster&display=swap" rel="stylesheet">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>

    <script defer src="${pageContext.request.contextPath}/js/doctors.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/scrollToTop.js"></script>
    <script defer src="${pageContext.request.contextPath}/js/galleryModal.js"></script>
</head>

<body>

<!-- Header -->
<jsp:include page="/WEB-INF/views/includes/header.jsp"/>

<section class="gallery min-vh-100">
    <div class="container-lg">
        <h1 class="text-center mb-4 display-5 fw-semibold">Photo Gallery</h1>

        <div class="row gy-4 row-cols-1 row-cols-sm-2 row-cols-md-3">

            <!-- If photos exist -->
            <c:if test="${not empty photos}">
                <c:forEach var="photo" items="${photos}">
                    <div class="col">
                        <img
                            src="${pageContext.request.contextPath}/images/photo_gallery/${photo.imageUrl}"
                            class="gallery-item rounded-2"
                            alt="${photo.title}" />
                    </div>
                </c:forEach>
            </c:if>

            <!-- If no photos -->
            <c:if test="${empty photos}">
                <div class="col">
                    <p class="text-center">No images found.</p>
                </div>
            </c:if>

        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="gallery-modal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>
            </div>
            <div class="modal-body text-center">
                <img src="" class="modal-img" alt="modal img" id="modal-image">
            </div>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>

</body>
</html>
