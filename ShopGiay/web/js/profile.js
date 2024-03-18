const name = document.getElementById("name");
const userName = document.getElementById("user-name");
const phone = document.getElementById("phone");



name.addEventListener("input", (e) => {
    console.log(e.target);
    userName.innerHTML = e.target.value;
});

// Upload
const uploadImage = document.querySelector("[upload-image]");
if (uploadImage) {
  const uploadImageInput = document.querySelector("[upload-image-input]");
  const uploadImagePreview = document.querySelector("[upload-image-preview]");
  const closeImagePreview = document.querySelector("[close-image-preview]");
  uploadImageInput.addEventListener("change", (e) => {
    const file = e.target.files[0];
    if (file) {
      uploadImagePreview.src = URL.createObjectURL(file);
      closeImagePreview.innerHTML = "X";
      closeImagePreview.classList.add("close-preview");
      
      closeImagePreview.addEventListener("click", () => {
        closeImagePreview.classList.remove("close-preview");
        closeImagePreview.innerHTML = "";
        uploadImagePreview.src = "https://img.icons8.com/bubbles/100/000000/user.png";
        uploadImageInput.value = "";
      });
    }
  });
}
// end upload
