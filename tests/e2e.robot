** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.resource
Resource    ../pages/loginPage.resource
Resource    ../pages/sidebar.resource
Resource    ../pages/profilPage.resource
Test Setup    init browser

*** Variables ***

*** Test Cases ***
Creer un urlisateur
    #Cliquer sur le bouton "Se connecter"
    se connecter
    #Vérification de la page de connexion  https://thrundrz.fr/gestion/login
    ${url}=    Get Location
    Location Should Be   ${url}    https://thrundrz.fr/gestion/login
    #Saisir les identifiants suivants :
    #Email : testeur@gmail.com
    #Mot de passe : testeur2024@
    #Cliquer sur "Se connecter"
    saisir credentaials    testeur@gmail.com    testeur2024@   
#Un message doit apparaître :"Connexion réussie ✅"
    check if message       
#Cliquer sur le bouton "Profil" dans la sidebar
    appeler sur btn profil
#Vérifier que l’URL est :https://thrundrz.fr/gestion/EspaceClient/profil
    verifier l'url    https://thrundrz.fr/gestion/EspaceClient/profil    
#Mise à jour du profil entreprise
#Nom commercial ppp
    saisie nom du commercial    ppppp
#formr juridique 
    choisir la forme_juridique    SASU
#Adresse
#Code postal
    saisie le code postale    75019    
#Ville
    saisie la ville    neuilly    
#Capital
    saisie la capital    paris
#Sélectionner obligatoirement les taux de TVA :
   verifier la case TVA est coché
#5.5%
    cocher la case de 5.5%

#20%
    cocher la case de 20%
#Cliquer sur " Sauvegarder"
    cliquer sur le bouton sauvegarder
#verifier Un message doit s’afficher :"Profil mis à jour avec succès"
    mise a jour succes    Profil mis à jour avec succès




    

    
    

