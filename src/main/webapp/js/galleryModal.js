document.addEventListener("DOMContentLoaded", function () {
  const galleryImages = document.querySelectorAll(".gallery-item");
  const modalImage = document.getElementById("modal-image");
  galleryImages.forEach((image) => {
    image.addEventListener("click", function () {
      modalImage.src = this.src;
      const modal = new bootstrap.Modal(
        document.getElementById("gallery-modal")
      );
      modal.show();
    });
  });
});
