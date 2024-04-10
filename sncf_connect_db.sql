-- Création de la base de données
CREATE DATABASE IF NOT EXISTS sncf_connect_db;

-- Utilisation de la base de données
USE sncf_connect_db;

-- Table pour stocker les utilisateurs
CREATE TABLE IF NOT EXISTS utilisateurs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    telephone VARCHAR(15),
    handicaps VARCHAR(255),
    age INT,
    UNIQUE(email)
);

-- Table pour stocker les billets de train
CREATE TABLE IF NOT EXISTS billets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    code_verification VARCHAR(10) NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (code_verification) REFERENCES utilisateurs(code_verification)
);

-- Table pour stocker les informations de paiement
CREATE TABLE IF NOT EXISTS paiements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    numero_carte VARCHAR(20) NOT NULL,
    date_expiration DATE NOT NULL,
    cvv INT NOT NULL,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- Table pour stocker les données de localisation
CREATE TABLE IF NOT EXISTS localisation (
    id INT AUTO_INCREMENT PRIMARY KEY,
    utilisateur_id INT,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    date_heure DATETIME,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(id)
);

-- Table pour stocker les messages
CREATE TABLE IF NOT EXISTS messages (
    id INT AUTO_INCREMENT PRIMARY KEY,
    expediteur_id INT,
    destinataire_id INT,
    message TEXT,
    date_heure DATETIME,
    FOREIGN KEY (expediteur_id) REFERENCES utilisateurs(id),
    FOREIGN KEY (destinataire_id) REFERENCES utilisateurs(id)
);