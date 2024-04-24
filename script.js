//Pour la localisation des utilisateurs
document.getElementById('getLocationBtn').addEventListener('click', function() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
            document.getElementById('latitude').value = position.coords.latitude;
            document.getElementById('longitude').value = position.coords.longitude;
            alert("Localisation obtenue avec succès !");
        }, function(error) {
            alert("Erreur lors de l'obtention de la localisation : " + error.message);
        });
    } else {
        alert("La géolocalisation n'est pas prise en charge par votre navigateur.");
    }
});