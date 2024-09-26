const toggleButton = document.getElementById("theme-toggle");
const currentTheme = localStorage.getItem("theme");

if (currentTheme === "dark") {
  document.body.classList.add("dark-theme");
  toggleButton.textContent = "☀️";
} else {
  toggleButton.textContent = "🌙";
}

toggleButton.addEventListener("click", function () {
  document.body.classList.toggle("dark-theme");

  const isDarkMode = document.body.classList.contains("dark-theme");
  toggleButton.textContent = isDarkMode ? "☀️" : "🌙";

  localStorage.setItem("theme", isDarkMode ? "dark" : "light");
});
