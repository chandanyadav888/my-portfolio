<?php

// Include connection file 
require_once 'config.php';

// Connect to database
// $conn = mysqli_connect("localhost", "root", "", "comuical");

// Check connection
// if(!$conn){
//   // die("Connection failed: " . mysqli_connect_error());
// }

// Get form data
$username = $_POST['username'];
$email = $_POST['email'];
$password = $_POST['password'];

// Hash password
$hashed_pass = password_hash($password, PASSWORD_DEFAULT); 

// Insert query
$sql = "INSERT INTO users (username, email, password)  
       VALUES ('$username', '$email', '$hashed_pass')";

// Execute query
if(mysqli_query($conn, $sql)){
    // Redirect to login page
    header('Location: login.html');
    exit;
} else {
  echo "ERROR: Could not able to execute $sql. " . mysqli_error($conn);
}

// Close connection
mysqli_close($conn);

?>
