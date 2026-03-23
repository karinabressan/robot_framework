*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${URL}              https://www.saucedemo.com/
${USER_VALIDO}    standard_user
${SENHA}            secret_sauce

*** Test Cases ***
Validar Login no SauceDemo
    Abrir Loja
    Fazer Login              ${USER_VALIDO}    ${SENHA}
    [Teardown]    Close Browser

*** Keywords ***
Abrir Loja
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fazer Login
    [Arguments]    ${user}    ${pass}
    Input Text        id=user-name    ${user}
    Input Password    id=password     ${pass}
    Click Button      id=login-button
