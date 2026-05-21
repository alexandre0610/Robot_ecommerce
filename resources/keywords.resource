
** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    https://thrundrz.fr/gestion/

***Keywords***  

init browser
    # Open Browser        chrome   
    Open Browser    ${URL}    ${BROWSER}
# # implicite wait pour une succession d'actions. 
    Set Selenium Implicit Wait    5s

se connecter 
    Click Element    xpath=//a[contains(text(),'Se connecter')]  
    

