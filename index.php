<?php 

include 'config.php';

// si le formulaire viens de la page index.html

if (isset($_POST['email']) && isset($_POST['password'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $conn = new mysqli(config::SERVEUR, config::UTILISATEUR, config::MOTDEPASSE, config::BASEDEDONNEES);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // déchiffrement du mot de passe
    $password = md5($password);

    $sql = "USE sncf_connect_db";
    $sql = "SELECT * FROM utilisateurs WHERE email='$email' AND mot_de_passe='$password'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        header("Location: securite.html");
    } else {
        echo "Invalid username or password.";
    }

    $conn->close();
}

