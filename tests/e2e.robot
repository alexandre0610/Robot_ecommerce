** Settings ***
Library    SeleniumLibrary
Resource    ../resources/keywords.resource
Resource    ../pages/loginPage.resource
Resource    ../pages/sidebar.resource
Resource    ../pages/profilPage.resource
Test Setup    init browser

*** Variables ***
${commercial}    

*** Test Cases ***
modifier le profil de l'utilisateur
    #Cliquer sur le bouton "Se connecter"
    se connecter
    verifier l'url    https://thrundrz.fr/gestion/login    
    saisir credentials    testeur@gmail.com    testeur2024@   
    check message de connexion

    appuyer sur btn profil
    verifier l'url    https://thrundrz.fr/gestion/EspaceClient/profil

    #espace profil , remplie les champs    
    saisie nom du commercial    ppppp
    choisir la forme_juridique    SASU
    ${code}=    saisir code postal aleatoire
    saisie le code postale   ${code}   
    saisie la ville    neuilly    
    saisie la capital    paris

#Sélectionner obligatoirement les taux de TVA :
   verifier la case TVA est coché
    cocher la case de 5.5%
    cocher la case de 20%

#Cliquer sur " Sauvegarder"
    cliquer sur le bouton sauvegarder
    mise a jour succes    Profil mis à jour avec succès




    

    
    

