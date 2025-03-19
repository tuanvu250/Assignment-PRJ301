
document.querySelectorAll(".product-gender a").forEach(link => {
    link.addEventListener("click", function (event) {
        event.preventDefault();
        let dataFilter = this.getAttribute("data-filter");
        let dataValue = this.getAttribute("data-value");
        updateFilter(dataFilter, dataValue);
    });
});

document.addEventListener("DOMContentLoaded", function () {
    let url = new URL(window.location.href);
    let params = new URLSearchParams(url.search);

    document.querySelectorAll(".product-gender a").forEach(link => {
        let dataFilter = link.getAttribute("data-filter");
        let dataValue = link.getAttribute("data-value");

        if (params.get(dataFilter) === dataValue) {
            link.classList.add("active");
        }
    });

    document.querySelectorAll(".choice-list a").forEach(link => {
        let dataFilter = link.getAttribute("data-filter");
        let dataValue = link.getAttribute("data-value");

        if (params.get(dataFilter) === dataValue) {
            link.classList.add("active");
        }
    });

    document.querySelectorAll(".choice-list-color a").forEach(link => {
        let dataFilter = link.getAttribute("data-filter");
        let dataValue = link.getAttribute("data-value");

        if (params.get(dataFilter) === dataValue) {
            link.parentElement.classList.add("active");
        }
    });
});

document.querySelectorAll(".toggle-btn").forEach(button => {
    button.addEventListener("click", function () {
        let parent = this.closest(".product-choice"); // Tìm div cha gần nhất
        let choiceList = parent.querySelector(".choice-list"); // Chọn đúng dropdown trong div cha
        let icon = parent.querySelector("i"); // `this` là icon đang bấm
        let title = parent.querySelector("h3");

        choiceList.classList.toggle("show");
        title.classList.toggle("active");

        // Đổi icon giữa chevron-down và chevron-up
        if (choiceList.classList.contains("show")) {
            icon.classList.replace("fa-chevron-down", "fa-chevron-up");
        } else {
            icon.classList.replace("fa-chevron-up", "fa-chevron-down");
        }
    });
});

document.querySelectorAll(".toggle-btn").forEach(button => {
    button.addEventListener("click", function () {
        let parent = this.closest(".product-choice"); // Tìm div cha gần nhất
        let choiceList = parent.querySelector(".choice-list-color"); // Chọn đúng dropdown trong div cha
        let icon = parent.querySelector("i"); // `this` là icon đang bấm
        let title = parent.querySelector("h3");

        choiceList.classList.toggle("show");
        title.classList.toggle("active");

        // Đổi icon giữa chevron-down và chevron-up
        if (choiceList.classList.contains("show")) {
            icon.classList.replace("fa-chevron-down", "fa-chevron-up");
        } else {
            icon.classList.replace("fa-chevron-up", "fa-chevron-down");
        }
    });
});

//document.querySelectorAll(".love-list").forEach(link => {
//    link.addEventListener("click", function () {
//        let icon = this.querySelector("i");
//        event.preventDefault();
//        this.classList.toggle("added");
//
//        if (this.classList.contains("added")) {
//            icon.classList.replace("fa-regular", "fa-solid");
//        } else {
//            icon.classList.replace("fa-solid", "fa-regular");
//        }
//    });
//});

document.querySelectorAll(".choice-list a").forEach(link => {
    link.addEventListener("click", function (event) {
        event.preventDefault();
        let dataFilter = this.getAttribute("data-filter");
        let dataValue = this.getAttribute("data-value");
        updateFilter(dataFilter, dataValue);
    });
});

document.querySelectorAll(".choice-list-color a").forEach(link => {
    link.addEventListener("click", function () {
        event.preventDefault();
        let dataFilter = this.getAttribute("data-filter");
        let dataValue = this.getAttribute("data-value");
        updateFilter(dataFilter, dataValue);
    });
});

function updatePage(event, pageNumber) {
    event.preventDefault(); // Ngăn chặn tải lại trang mặc định của thẻ <a>

    let url = new URL(window.location.href);
    let params = new URLSearchParams(url.search);

    params.set("page", pageNumber); // Chỉ cập nhật số trang

    window.location.href = url.origin + url.pathname + "?" + params.toString();
};
