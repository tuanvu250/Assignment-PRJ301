document.getElementById('mobileMenuToggle').addEventListener('click', function () {
    document.getElementById('navMenu').classList.toggle('active');
});

document.getElementById('userDropdownToggle').addEventListener('click', function (e) {
    document.getElementById('userDropdownMenu').classList.toggle('show');
    e.stopPropagation();
});

window.addEventListener('click', function (e) {
    if (!e.target.matches('.user-dropdown *')) {
        var dropdown = document.getElementById('userDropdownMenu');
        if (dropdown.classList.contains('show')) {
            dropdown.classList.remove('show');
        }
    }
});
