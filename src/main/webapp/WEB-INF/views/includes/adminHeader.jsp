<header>
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3">
        <div class="container">
            <a href="${pageContext.request.contextPath}/admin/home" class="navbar-brand">Sample Healthcare</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navmenu" >
                <i class="navbar-toggler-icon"></i>
            </button>
            <div class="collapse navbar-collapse" id="navmenu" >
                <ul class="navbar-nav ms-auto gap-3">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/home" class="nav-link">Appointments</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/managePhotos" class="nav-link">Photo Gallery</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/manageDoctors" class="nav-link">Doctors</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin/logout" class="nav-link btn btn-danger
                        ">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>