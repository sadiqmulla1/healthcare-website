<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #0d6efd, #212529);
            min-height: 100vh;
        }
        .login-card {
            max-width: 420px;
            width: 100%;
        }
    </style>
</head>
<body class="d-flex align-items-center justify-content-center">

<div class="card shadow login-card">
    <div class="card-body p-4">

        <h3 class="text-center mb-4">
            <i class="bi bi-person-lock"></i> Admin Login
        </h3>

        <!-- Error Message -->
        <c:if test="${not empty error}">
            <div class="text-danger mb-4 text-center">
                ${error}
            </div>
        </c:if>

        <form method="post" action="${pageContext.request.contextPath}/admin/login">

            <!-- Username -->
            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text"
                       name="username"
                       class="form-control"
                       required
                       autofocus>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label class="form-label">Password</label>
                <input type="password"
                       name="password"
                       class="form-control"
                       required>
            </div>

            <!-- Submit -->
            <div class="d-grid">
                <button type="submit" class="btn btn-primary">
                    <i class="bi bi-box-arrow-in-right"></i> Login
                </button>
            </div>
        </form>

        <div class="text-center mt-3">
            <small class="text-muted">
                Authorized personnel only
            </small>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
