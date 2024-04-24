<?php 

include 'config.php';

// si le formulaire viens de la page index.html

if (isset($_POST['email']) && isset($_POST['password'])) {
    $email = $_POST['email'];
    $mot_de_passe = $_POST['password'];

    $conn = new mysqli(config::SERVEUR, config::UTILISATEUR, config::MOTDEPASSE, config::BASEDEDONNEES);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // chiffrement du mot de passe sans password_hash
    $mot_de_passe = md5($mot_de_passe);

    // enregister l'utilisateur
    $sql = "USE sncf_connect_db";
    $sql = "INSERT INTO utilisateurs (email, mot_de_passe) VALUES ('$email', '$mot_de_passe')";
    $result = $conn->query($sql);

    if ($result === TRUE) {
        header("Location: index.html");
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
    $conn->close();
}

