*** Settings ***
Documentation    page pom for profil page
Library    SeleniumLibrary

*** Variables ***
${nom_commercial}    name=nom_commercial
${forme_juridique}    css=select[name='forme_juridique']           
${capital}    name=capital
${adresse_ligne1}    name:adresse_ligne1
${adresse_ligne2}    name:adresse_ligne2ville
${code_postale}    name:code_postal
${TVA_incluse}    xpath://label[contains(text(),"TVA incluse (obligatoire pour votre statut)")]//input[@type="checkbox"]   
${TVA_5,5%}    xpath://label[contains(text(),"5.5%")]//input[@type="checkbox"]   
${TVA_20%}    xpath://label[contains(text(),"20%")]//input[@type="checkbox"]        
${ville}    name=ville
${Sauvegarder}    xpath=//button[contains(., "Sauvegarder")] 
${mes_succes}    css:.Toastify__toast--success

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
   
verifier la case TVA est coché 
    Checkbox Should Be Selected    ${TVA_incluse}
cocher la case de 5.5%
    Select Checkbox   ${TVA_5,5%}
cocher la case de 20%
    Select Checkbox   ${TVA_20%}
saisie la ville 
    [Arguments]    ${v}
    Input Text    ${ville}    ${v}
cliquer sur le bouton sauvegarder
    Click Element    ${Sauvegarder}
    #Code postal 
saisie le code postale
    [Arguments]    ${code}
    Input Text    ${code_postale}    ${code}
mise a jour succes
    [Arguments]    ${mes}
    Wait Until Element Is Visible    ${mes_succes}    timeout=5s
    Element Should Contain    ${mes_succes}    ${mes}
             