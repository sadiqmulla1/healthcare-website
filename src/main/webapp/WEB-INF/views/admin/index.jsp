<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel - Appointments</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/includes/adminHeader.jsp"/>

<main class="container mt-5">

    <h2 class="text-center mb-4">Appointments</h2>

    <div class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>ID</th>
                <th>Patient Name</th>
                <th>Consultation Type</th>
                <th>Mobile</th>
                <th>Patient Type</th>
                <th>Created At</th>
                <th>Completed</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="appt" items="${appointments}">
                <tr>
                    <td>${appt.id}</td>
                    <td>${appt.patientName}</td>
                    <td>${appt.consultationType}</td>
                    <td>${appt.mobile}</td>
                    <td>${appt.patientType}</td>
                    <td>${appt.createdAt}</td>
                    <td>
                        <c:choose>
                            <c:when test="${appt.completed}">Yes</c:when>
                            <c:otherwise>
                                <form method="post" style="display:inline;">
                                    <input type="hidden" name="complete" value="${appt.id}">
                                    <button class="btn btn-success btn-sm" type="submit">Mark as Completed</button>
                                </form>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <form method="post" style="display:inline;">
                            <input type="hidden" name="delete" value="${appt.id}">
                            <button class="btn btn-danger btn-sm"
                                    onclick="return confirm('Are you sure you want to delete this appointment?');">
                                Delete
                            </button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <c:if test="${empty appointments}">
                <tr>
                    <td colspan="8" class="text-center">No appointments found.</td>
                </tr>
            </c:if>
            </tbody>
        </table>
    </div>
</main>

</body>
</html>
