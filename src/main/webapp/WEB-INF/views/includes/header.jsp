<!-- Navbar -->
<header>
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark py-3">
        <div class="container">

            <a href="${pageContext.request.contextPath}/home" class="navbar-brand">
                Sample Healthcare
            </a>

            <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navmenu">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navmenu">
                <ul class="navbar-nav ms-auto">

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home#facilities" class="nav-link">
                            Facilities
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home#about" class="nav-link">
                            About
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home#gallery" class="nav-link">
                            Gallery
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home#feedback" class="nav-link">
                            Feedback
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/home#doctors" class="nav-link">
                            Our Doctors
                        </a>
                    </li>

                </ul>
            </div>
        </div>
    </nav>
</header>
