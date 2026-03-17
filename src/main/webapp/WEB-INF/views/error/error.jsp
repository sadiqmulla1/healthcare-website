<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Page Not Found | Sample Healthcare</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap" rel="stylesheet">

    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f8f9fa; }
        .error-container { min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .error-code { font-size: 8rem; font-weight: 900; color: #0d6efd; line-height: 1; }
        .illustration { max-width: 400px; width: 100%; margin-bottom: 2rem; }
    </style>
</head>
<body>

<div class="container error-container text-center">
    <div class="row">
        <div class="col-md-12">
            <div class="error-code mb-2">404</div>
            <h1 class="display-4 fw-bold">Oops! Page Not Found</h1>
            <p class="lead mb-5">
                The URL you are looking for doesn't exist or has been moved.
                <br class="d-none d-md-block"> Let's get you back to the right place.
            </p>

            <div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
                <a href="<%= request.getContextPath() %>/" class="btn btn-primary btn-lg px-4 gap-3">
                    <i class="bi bi-house-door"></i> Back to Home
                </a>
                <a href="#support" class="btn btn-outline-secondary btn-lg px-4" onclick="history.back()">
                    <i class="bi bi-arrow-left"></i> Go Back
                </a>
            </div>
        </div>
    </div>
</div>

</body>
</html>