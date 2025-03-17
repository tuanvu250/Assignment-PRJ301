let slider = document.querySelector('.img-list');
let items = document.querySelectorAll('.img-list img');
let next = document.getElementById('next');
let prev = document.getElementById('prev');
let thumbnails = document.querySelectorAll('.thumnails img');

let lengthItems = items.length - 1;
let active = 0;
next.onclick = function () {
    active = active + 1 <= lengthItems ? active + 1 : 0;
    reloadSlider();
};
prev.onclick = function () {
    active = active - 1 >= 0 ? active - 1 : lengthItems;
    reloadSlider();
};
function updateThumbnail() {
    document.querySelector('.thumnails img.active')?.classList.remove('active');
    thumbnails[active].classList.add('active');
}

function reloadSlider() {
    let newTransformValue = -active * 100 + "%";
    slider.style.transform = "translateX(" + newTransformValue + ")";
    updateThumbnail();
}

thumbnails.forEach((img, index) => {
    img.addEventListener('click', () => {
        active = index;
        reloadSlider();
    });
});

updateThumbnail();

// Add this at the end of your script section
document.querySelector(".info-detail h3").addEventListener("click", function () {
    let infoDiv = this.parentElement.querySelector("div");
    let icon = this.querySelector("i");

    infoDiv.classList.toggle("show");
    this.classList.toggle("active");

    if (infoDiv.classList.contains("show")) {
        icon.classList.replace("fa-chevron-down", "fa-chevron-up");
    } else {
        icon.classList.replace("fa-chevron-up", "fa-chevron-down");
    }
});