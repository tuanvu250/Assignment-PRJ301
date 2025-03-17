document.querySelectorAll(".favourite-cart").forEach(link => {
    link.addEventListener("click", function () {
        this.classList.toggle("added");
    });
});
document.querySelectorAll(".favourite-color div").forEach(link => {
    link.addEventListener("click", function () {
        this.classList.toggle("added");
    });
});