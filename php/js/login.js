const form = document.querySelector("form");
const emailField = form.querySelector(".email-field");
const emailInput = emailField.querySelector(".email");
const passField = form.querySelector(".create-password");
const passInput = passField.querySelector(".password");

// Email Validation
function checkEmail() {
  const emailPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
  if (!emailInput.value.match(emailPattern)) {
    emailField.classList.add("invalid");
  } else {
    emailField.classList.remove("invalid");
  }
}

// Hide and show password
const passwordToggle = passField.querySelector(".show-hide");
passwordToggle.addEventListener("click", () => {
  if (passInput.type === "password") {
    passInput.type = "text";
    passwordToggle.classList.replace("bx-hide", "bx-show");
  } else {
    passInput.type = "password";
    passwordToggle.classList.replace("bx-show", "bx-hide");
  }
});

// Password Validation
function createPass() {
  const passPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
  if (!passInput.value.match(passPattern)) {
    passField.classList.add("invalid");
  } else {
    passField.classList.remove("invalid");
  }
}

// Calling Functions on Form Submit
form.addEventListener("submit", (e) => {
  e.preventDefault(); // Prevent form submission
  checkEmail();
  createPass();

  if (!emailField.classList.contains("invalid") && !passField.classList.contains("invalid")) {
    form.submit(); // Submit the form if both email and password are valid
  }
});

// Calling Functions on Keyup
emailInput.addEventListener("keyup", checkEmail);
passInput.addEventListener("keyup", createPass);
