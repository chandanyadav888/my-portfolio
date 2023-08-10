<!-- <?php
@include 'config.php';

session_start();

if (!isset($_SESSION['admin_name'])) {
    header('location:login_form.php');
    exit;
}

// Placeholder data for demonstration
$users = array(
    array('id' => 1, 'name' => 'Shiva Shrestha', 'email' => 'shiva@example.com', 'blocked' => false),
    array('id' => 2, 'name' => 'Aryan Gupta', 'email' => 'arya@example.com', 'blocked' => true),
    array('id' => 3, 'name' => 'Suvani Basnet', 'email' => 'suvani@example.com', 'blocked' => false)
);

// Handle user blocking
if (isset($_GET['block']) && isset($_GET['id'])) {
    $userId = $_GET['id'];
    foreach ($users as &$user) {
        if ($user['id'] == $userId) {
            $user['blocked'] = true;
            break;
        }
    }
    unset($user);
}

// Handle user deletion
if (isset($_GET['delete']) && isset($_GET['id'])) {
    $userId = $_GET['id'];
    foreach ($users as $key => $user) {
        if ($user['id'] == $userId) {
            unset($users[$key]);
            break;
        }
    }
}
?> -->

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Users</title>

    <!-- Custom CSS file link -->
    <link rel="stylesheet" href="css/manager_user.css">
</head>

<body>
    <div class="container">
        <div class="content">
            <h3>Manage Users</h3>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($users as $user) : ?>
                        <tr>
                            <td><?php echo $user['id']; ?></td>
                            <td><?php echo $user['name']; ?></td>
                            <td><?php echo $user['email']; ?></td>
                            <td><?php echo $user['blocked'] ? 'Blocked' : 'Active'; ?></td>
                            <td>
                                <?php if (!$user['blocked']) : ?>
                                    <a href="?id=<?php echo $user['id']; ?>&block=true">Block</a>
                                <?php else : ?>
                                    <a href="?id=<?php echo $user['id']; ?>&block=false">Unblock</a>
                                <?php endif; ?>
                                <a href="?id=<?php echo $user['id']; ?>&delete=true">Delete</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <a href="admin_panel.php" class="btn">Back to Admin Panel</a>
            <a href="logout.php" class="btn">Logout</a>
        </div>
    </div>
</body>

</html>
