** Settings ***
Documa
Library    SeleniumLibrary
*** Variables ***
${BROWSER}    chrome
${URL}    https://thrundrz.fr/gestion/
***Keywords***  
init browser
    # Open Browser    https://www.saucedemo.com/     chrome   
    Open Browser    ${URL}    ${BROWSER}
# # implicite wait pour une succession d'actions. 
    Set Selenium Implicit Wait    5s
    # se connecter qui va me 
se connecter 
    init browser
    

    
    

