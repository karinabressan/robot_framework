*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${URL}           https://www.saucedemo.com/
${USER}          standard_user
${PASS}          secret_sauce

*** Test Cases ***
Adicionar T-shirt ao Carrinho
    Abrir Loja
    Fazer Login                   ${USER}    ${PASS}
    Clicar No Produto             id=add-to-cart-sauce-labs-bolt-t-shirt
    Validar Carrinho Com Itens    1
    [Teardown]    Close Browser

*** Keywords ***
Abrir Loja
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fazer Login
    [Arguments]    ${u}    ${p}
    Input Text        id=user-name    ${u}
    Input Password    id=password     ${p}
    Click Button      id=login-button

Clicar No Produto
    [Arguments]    ${locator}
    Click Button    ${locator}

Validar Carrinho Com Itens
    [Arguments]    ${quantidade}
    # Verifica se o número aparece no ícone do carrinho (badge)
    Element Should Contain    class=shopping_cart_badge    ${quantidade}