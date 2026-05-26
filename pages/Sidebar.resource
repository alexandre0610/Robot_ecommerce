*** Settings ***
Documentation    page pom for login page
#importer la library Selenium
Library    SeleniumLibrary

#Locators
*** Variables ***
${Dashboard}    xpath=//button[.//p[text()='Dashboard']]    
${profil}    xpath=//button[.//p[text()='Profil']] 
${Devis}    xpath=//button[.//p[text()='Devis']] 
${Factures}    xpath=//button[.//p[text()='Factures']] 
${Avoirs}    xpath=//button[.//p[text()='Avoirs']] 
${Relancer}    xpath=//button[.//p[text()='Relancer']] 
${Se déconnecter}    xpath=//button[.//p[text()='Se déconnecter']] 

#methode
*** Keywords ***

click sur btn Dashboard
    Click Element    ${Dashboard}
appeler sur btn profil
    Click Element    ${profil}
click sur btn Devis
    Click Element    ${Devis}
click sur btn Factures
    Click Element    ${Factures}
click sur btn Avoirs
    Click Element    ${Avoirs}
click sur btn Relancer
    Click Element    ${Relancer}
click sur btn se déconnecter
    Click Element    ${se déconnecter}
click sur btn profil
    Click Element    ${profil}

