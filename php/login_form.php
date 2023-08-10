<?php
@include 'config.php';

session_start();

if (isset($_POST['submit'])) {
    $email =  $_POST['email'];
    $password = md5($_POST['password']);

    $select = "SELECT * FROM users WHERE email = '$email' AND password = '$password'";
    $result = mysqli_query($conn, $select);

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_array($result);

        if ($row['user_type'] == 'admin') {
            $_SESSION['admin_name'] = $row['name'];
            header('location:admin_page.php');
            exit();
        } elseif ($row['user_type'] == 'user') {
            $_SESSION['user_name'] = $row['name'];
            header('location:user_page.php');
            exit();
        }
    } else {
        $error = 'Incorrect email or password!';
    }
}
?>
