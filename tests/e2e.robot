** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.resource
Resource    ../pages/loginPage.resource
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
#Vérifier que l’URL est :https://thrundrz.fr/gestion/EspaceClient/profil
#Mise à jour du profil entreprise

#Nom commercial
#Adresse
#Code postal
#Ville
#Capital
#Sélectionner obligatoirement les taux de TVA :
#5.5%
#20%
#Cliquer sur " Sauvegarder"

#verifier Un message doit s’afficher :"Profil mis à jour avec succès"



    

    
    

