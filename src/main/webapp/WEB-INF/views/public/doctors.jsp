<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="p-5 px-1 px-md-5 doctors-section" id="doctors">
  <div class="container">
    <div class="row align-items-center justify-content-between gap-2">

      <!-- Heading -->
      <div class="col-md-auto">
        <i class="bi bi-quote display-2"></i>
        <h1 class="text-center fw-semibold display-5" data-aos="fade-in">Meet Our Doctors</h1>
      </div>

      <!-- Carousel -->
      <div class="col-md">
        <div class="doctors-carousel-container w-100 mx-auto overflow-hidden">
          <div class="position-relative">
            <div class="d-flex transition" id="doctorCarouselInner">

              <!-- Loop through doctors list -->
              <c:forEach var="doctor" items="${doctors}">
                <div class="doctor-card px-2 mx-2"> <div class="custom-card position-relative overflow-hidden shadow rounded-4">

                    <img src="${pageContext.request.contextPath}/images/doctors/${doctor.photoPath}"
                         class="card-img"
                         alt="${doctor.name}">

                    <div class="card-overlay d-flex flex-column align-items-center justify-content-center text-center px-4">
                      <h2 class="text-white fw-bold h4">${doctor.name}</h2>

                      <div class="card-text text-white">
                        <p class="mb-1"><strong>Speciality:</strong> ${doctor.speciality}</p>
                        <p class="mb-1"><strong>Experience:</strong> ${doctor.experience} Years</p>
                        <p class="mb-3"><strong>Education:</strong> ${doctor.education}</p>
                      </div>
                    </div>

                  </div>
                </div>
              </c:forEach>

              <!-- If no doctors -->
              <c:if test="${empty doctors}">
                <div class="col">
                  <p class="text-center">No doctors found.</p>
                </div>
              </c:if>

            </div>

            <!-- Carousel Buttons -->
            <button id="prevBtn" class="carousel-control-prev position-absolute top-50 start-0 translate-middle-y z-3 btn btn-primary rounded-circle">
              <i class="bi bi-caret-left-fill text-dark"></i>
            </button>
            <button id="nextBtn" class="carousel-control-next position-absolute top-50 end-0 translate-middle-y z-3 btn btn-primary rounded-circle">
              <i class="bi bi-caret-right-fill text-dark"></i>
            </button>
          </div>
        </div>
      </div>

    </div>
  </div>
</section>
