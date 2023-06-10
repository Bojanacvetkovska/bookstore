$(document).ready(function() {
    // Handle login form submission
    $('#loginForm').submit(function(event) {
        event.preventDefault(); // Prevent form submission

        var email = $('#email').val();
        var password = $('#password').val();

        // Make AJAX request for login
        $.ajax({
            type: 'POST',
            url: 'login.php', // Replace with the correct login PHP file
            data: {
                email: email,
                password: password
            },
            success: function(response) {
                // Handle the login response
                if (response.success) {
                    // Login successful, redirect to the desired page
                    window.location.href = 'index.php'; // Replace with the desired page after login
                    console.log(JSON.stringify(response))

                } else {
                    // Login failed, display error message
                    console.log("error24")
                    console.log(JSON.stringify(response))

                   // alert(response.message);
                }
            },
            error: function() {
                // An error occurred during the AJAX request
                alert('An error occurred. Please try again.');
                document.addEventListener("DOMContentLoaded", function() {
                    // Set the "Remember Me" checkbox status based on the cookie value
                    var rememberCheckbox = document.getElementById("remember");
                    var rememberCookie = getCookie("remember");
                    if (rememberCookie === "1") {
                        rememberCheckbox.checked = true;
                    }
        
                    // Function to retrieve cookie value by name
                    function getCookie(name) {
                        var cookies = document.cookie.split("; ");
                        for (var i = 0; i < cookies.length; i++) {
                            var cookie = cookies[i].split("=");
                            if (cookie[0] === name) {
                                return cookie[1];
                            }
                        }
                        return "";
                    }
                });
            }
        });
    });
});
