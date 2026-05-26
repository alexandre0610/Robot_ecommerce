
** Settings ***
Library    SeleniumLibrary
Library    random.py

*** Variables ***
${BROWSER}    chrome
${URL}    https://thrundrz.fr/gestion/

*** Keywords *** 
init browser
    # Open Browser        chrome   
    Open Browser    ${URL}    ${BROWSER}
     # implicite wait pour une succession d'actions. 
    Set Selenium Implicit Wait    5s
    


se connecter 
    Click Element    xpath=//a[contains(text(),'Se connecter')] 

verifier l'url 
    [Arguments]    ${url}
    ${url}    Get Location
    Location Should Be    url=${url}

saisir code postal aleatoire
    ${code}    Evaluate    (random.randint(0,99999))    random
    RETURN    ${code}
Cocher Checkbox Aleatoire
    ${choix}=    Evaluate    random.choice([True, False])    random
    IF    ${choix}
        Select Checkbox    name:accepter_cgu
    ELSE
        Unselect Checkbox    name:accepter_cgu
    END



    

    

