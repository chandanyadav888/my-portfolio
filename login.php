<?php
// Include connection file 
require_once 'config.php';
// Get form data
$email = $_POST['email'];
$password = $_POST['password']; 

// Fetch user data
$sql = "SELECT * FROM users WHERE email='$email'";
$user = $conn->query($sql)->fetch_assoc();
if ($user['id']==0){
  if (password_verify($password, $user['password'])) {
    header('Location: adminpanel/comics.php'); 
    exit();
  
  } else {
    echo "Invalid credentials";
  }
}

// Verify password
if (password_verify($password, $user['password'])) {
  header('Location: comic.html'); 
  exit();

} else {
  echo "Invalid credentials";
}
?>