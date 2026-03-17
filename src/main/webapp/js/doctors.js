document.addEventListener("DOMContentLoaded", function () {
  const carouselInner = document.getElementById("doctorCarouselInner");
  const cards = document.querySelectorAll(".doctor-card");
  const prevBtn = document.getElementById("prevBtn");
  const nextBtn = document.getElementById("nextBtn");

  let currentIndex = 0;

  function getVisibleCards() {
    if (window.innerWidth < 768) return 1;
    if (window.innerWidth < 992) return 2;
    return 3;
  }

  function updateCarousel() {
    const visibleCards = getVisibleCards();
    const cardWidth = cards[0].offsetWidth;
    const maxIndex = cards.length - visibleCards;

    if (currentIndex < 0) currentIndex = 0;
    if (currentIndex > maxIndex) currentIndex = maxIndex;

    const offset = currentIndex * cardWidth;
    carouselInner.style.transform = `translateX(-${offset}px)`;
  }

  nextBtn.addEventListener("click", () => {
    currentIndex++;
    updateCarousel();
  });

  prevBtn.addEventListener("click", () => {
    currentIndex--;
    updateCarousel();
  });

  window.addEventListener("resize", () => {
    updateCarousel();
  });

  updateCarousel();
});
