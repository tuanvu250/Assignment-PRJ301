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