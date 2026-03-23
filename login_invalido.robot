*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${URL}              https://www.saucedemo.com/
${USER_INVALIDO}    usuario_inexistente
${SENHA}            12345
${MSG_ERRO}         Epic sadface: Username and password do not match any user in this service

*** Test Cases ***
Validar Erro de Login no SauceDemo
    Abrir Loja
    Fazer Login              ${USER_INVALIDO}    ${SENHA}
    Verificar Mensagem Erro  ${MSG_ERRO}
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

Verificar Mensagem Erro
    [Arguments]    ${mensagem_esperada}
    Wait Until Page Contains    ${mensagem_esperada}    timeout=5s