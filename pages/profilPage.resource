*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${nom_commercial}    name=nom_commercial
${forme_juridique}    css=select[name='forme_juridique']           
${capital}    name=capital
${adresse_ligne1}    name=adresse_ligne1
${adresse_ligne2}    name=adresse_ligne2ville
${code_postale}
${TVA_incluse}    xpath=//input[@type='TVA incluse (obligatoire pour votre statut)']   
${TVA %}    xpath=//input[@type='5.5%']        
${ville}    name=ville
${Sauvegarder}    xpath=//button[.//p[text()='Sauvegarder']] 

#Code postal
#Ville
#Capital
#Sélectionner obligatoirement les taux de TVA :
#5.5%
#20%
#Cliquer sur " Sauvegarder"

*** Keywords ***

saisie nom du commercial
    [Arguments]    ${n}
    Input Text    ${nom_commercial}    ${n}        

choisir la forme_juridique
    [Arguments]    ${choix}
    Select From List By Value    ${forme_juridique}    ${choix}
saisie la capital
    [Arguments]    ${c}
    Input Text    ${capital}    ${c} 
#Code postal    
cocher la case TVA
    Checkbox Should Be Selected    ${TVA_incluse}
cocher la case de 5.5%
    Checkbox Should Be Selected    ${TVA %}
saisie la ville 
    [Arguments]    ${v}
    Input Text    ${ville}    ${v}
cliquer sur le bouton sauvegarder
    Click Element    ${Sauvegarder}         
             