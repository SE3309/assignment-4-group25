
// Get form and response message elements
const form = document.getElementById('login-form');
const responseMessage = document.getElementById('response-message');

form.addEventListener('submit', async function (e) {
    e.preventDefault();

    // Get email and password from form inputs
    const email = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value.trim();

    try {
        // Send POST request to the server to verify login credentials
        const response = await fetch('/api/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ email, password }),
        });

        const data = await response.json();

        // Display response message based on the server's response
        if (response.ok) {
            responseMessage.textContent = 'Login successful!';
            responseMessage.style.color = 'green';
            window.location.href = '/index.html';
        } else {
            responseMessage.textContent = data.error || 'Login failed!';
            responseMessage.style.color = 'red';
        }
    } catch (error) {
        responseMessage.textContent = 'An error occurred!';
        responseMessage.style.color = 'red';
    }
});

