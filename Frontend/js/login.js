const loginForm = document.querySelector('#login-form');
const usernameInput = document.querySelector('#username');
const passwordInput = document.querySelector('#password');
const errorMsg = document.querySelector('#error-msg');

loginForm.addEventListener('submit', (e) => {
  e.preventDefault();
  const username = usernameInput.value;
  const password = passwordInput.value;
  
  // Make an AJAX request to the server
  const xhr = new XMLHttpRequest();
  xhr.open('POST', '/login', true);
  xhr.setRequestHeader('Content-Type', 'application/json');
  xhr.onload = () => {
    if (xhr.status === 200) {
      // If login is successful, redirect to home page
      window.location.href = '/';
    } else {
      // If login fails, display error message
      const response = JSON.parse(xhr.responseText);
      errorMsg.textContent = response.message;
    }
  };
  xhr.onerror = () => {
    // If there is a network error, display error message
    errorMsg.textContent = 'Network error. Please try again later.';
  };
  xhr.send(JSON.stringify({ username, password }));
});

