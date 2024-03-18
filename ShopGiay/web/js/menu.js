
const menu = document.getElementById("navbarsExampleDefault");
const buttonMenu = document.querySelector(".navbar-toggler");
buttonMenu.addEventListener("click",(e) =>{
    menu.classList.toggle("show");
});