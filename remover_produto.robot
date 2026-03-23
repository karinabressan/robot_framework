*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${URL}           https://www.saucedemo.com/
${USER}          standard_user
${PASS}          secret_sauce
${PRODUTO_ID}    id=add-to-cart-sauce-labs-backpack

*** Test Cases ***
CT01 - Adicionar Mochila ao Carrinho com Sucesso
    [Documentation]    Valida o fluxo de adicionar um item e verificar o ícone do carrinho
    Abrir Navegador no Site
    Fazer Login                     ${USER}    ${PASS}
    
    Selecionar Produto              ${PRODUTO_ID}
    Validar Quantidade no Carrinho  1
    
    [Teardown]    Fechar Sessao

*** Keywords ***
Abrir Navegador no Site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fazer Login
    [Arguments]    ${usuario}    ${senha}
    Input Text        id=user-name    ${usuario}
    Input Password    id=password     ${senha}
    Click Button      id=login-button

Selecionar Produto
    [Arguments]    ${locator}
    Click Button    ${locator}

Validar Quantidade no Carrinho
    [Arguments]    ${valor_esperado}
    # Espera o badge (bolinha vermelha) aparecer antes de ler o valor
    Wait Until Element Is Visible    class=shopping_cart_badge    timeout=5s
    Element Should Contain           class=shopping_cart_badge    ${valor_esperado}

Fechar Sessao
    Close Browser