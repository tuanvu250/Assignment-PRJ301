// Toggle between user info and order history
document.getElementById('showHistory').addEventListener('click', function (e) {
    e.preventDefault();
    const userInfo = document.querySelector('.user-info');
    const orderHistory = document.getElementById('orderHistory');

    if (orderHistory.style.display === 'none' || orderHistory.style.display === '') {
        userInfo.style.display = 'none';
        orderHistory.style.display = 'block';
        this.textContent = 'User Information';
    } else {
        userInfo.style.display = 'block';
        orderHistory.style.display = 'none';
        this.textContent = 'History orders';
    }
});

// Edit profile 
document.getElementById('editProfile').addEventListener('click', function () {
    const inputs = document.querySelectorAll('#fullname, #email, #phone');
    inputs.forEach(input => {
        input.readOnly = !input.readOnly;
        if (!input.readOnly) {
            input.focus();
        }
    });

    if (this.textContent === 'Edit Profile') {
        this.textContent = 'Save Profile';
    } else {
        this.textContent = 'Edit Profile';
        // Here you would typically save the data
        alert('Profile updated successfully!');
    }
});

document.addEventListener('DOMContentLoaded', function () {
    const showPopupBtn = document.querySelector('.show-popup-btn');
    const overlay = document.querySelector('.overlay');
    const closeButton = document.querySelector('.close-button');
    const cancelButton = document.querySelector('.cancel-button');

    // Hiển thị popup
    function showPopup() {
        overlay.classList.add('active');
        document.body.style.overflow = 'hidden'; // Ngăn cuộn trang
    }

    // Ẩn popup
    function hidePopup() {
        overlay.classList.remove('active');
        document.body.style.overflow = ''; // Khôi phục cuộn trang
    }

    // Thêm sự kiện click cho các nút
    showPopupBtn.addEventListener('click', showPopup);
    closeButton.addEventListener('click', hidePopup);
    cancelButton.addEventListener('click', hidePopup);

    // Đóng popup khi click ra ngoài
    overlay.addEventListener('click', function (event) {
        if (event.target === overlay) {
            hidePopup();
        }
    });
});