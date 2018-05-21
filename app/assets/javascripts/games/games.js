document.addEventListener("DOMContentLoaded", function () {
  const items = document.querySelectorAll("a#letters");
  items.forEach(link => {
    link.addEventListener("click", function () {
      event.preventDefault()
      const field = document.getElementById("text-field");
      field.value = field.value + link.innerText;
    });
  });
});
