*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${URL}              https://www.saucedemo.com/
${USER_VALIDO}    standard_user
${SENHA}            secret_sauce

*** Test Cases ***
Realizar Logout com Sucesso
    Abrir Loja
    Fazer Login                   ${USER_VALIDO}    ${SENHA}

    # Clica no menu lateral (hambúrguer)
    Click Button                  id=react-burger-menu-btn
    
    # Espera o link de logout ficar visível e clica
    Wait Until Element Is Visible    id=logout_sidebar_link    timeout=5s
    Click Link                       id=logout_sidebar_link
    
    # Valida se voltou para a tela de login (procurando o botão de login)
    Page Should Contain Element      id=login-button
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