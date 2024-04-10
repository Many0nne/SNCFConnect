<?php 



if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username == 'admin' && $password == 'admin') {
        echo '<h1>Congratulations!</h1>';
        echo '<p>You have successfully logged in.</p>';
    } else {
        echo '<h1>Oops!</h1>';
        echo '<p>Username or Password is incorrect.</p>';
    }
}

?>