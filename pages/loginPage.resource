*** Settings ***
Documentation    page pom for login page
#importer la library Selenium
Library    SeleniumLibrary

#Locators
*** Variables ***

${email}      id:email
${password}    id:password   
${btn_connecter}    xpath=//button[contains(., "Se connecter")]   
${mess_conn}    xpath=//div[contains(.,"Connexion réussie")]           


#methode
*** Keywords ***

saisir credentaials
    [Arguments]    ${e}    ${p}  
    Input Text    ${email}    ${e}   
    Input Text    ${password}    ${p} 
    Click Element    ${btn_connecter}  
check if message 
    Element Should Be Visible    ${mess_conn}    
        













    