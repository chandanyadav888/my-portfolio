<?php
// if ($_SERVER["REQUEST_METHOD"] == "POST") {
    include_once("config.php");

    $username =  $_POST['username'];
    $email =  $_POST['email'];
    $password = $_POST['password'];
    $cpassword = $_POST['cpassword'];
    // You can also add user_type processing here

    $select = "SELECT * FROM users WHERE email = '$email' OR username = '$username'";
    $result = mysqli_query($conn, $select);

    if (mysqli_num_rows($result) > 0) {
        $error[] = 'User already exists!';
    } else {
        if ($password != $cpassword) {
            $error[] = 'Passwords do not match!';
        } else {
            // Hash the password
            $hashed_password = password_hash($password, PASSWORD_DEFAULT);

            // Assuming you have a 'user_form' table with appropriate column names
            $insert = "INSERT INTO users (username, email, password) VALUES('$username', '$email', '$hashed_password')";
            mysqli_query($conn, $insert);
            header('location:../login.html');
            exit();
        }
    }

    // Handle displaying errors, if any
    if (!empty($error)) {
        foreach ($error as $errorMsg) {
            echo '<div class="error">' . $errorMsg . '</div>';
        }
    }

    // Close the database connection
    mysqli_close($conn);
// }
?>
