*** Settings ***
Library          SeleniumLibrary

*** Variables ***
${URL}           https://www.saucedemo.com/
${USER}          standard_user
${PASS}          secret_sauce
${PRODUTO_ID}    id=add-to-cart-sauce-labs-backpack
${FIRST_NAME}    Usuario
${LAST_NAME}     Padrao
${POSTAL_CODE}   89200000

*** Test Cases ***
Finalizar Compra com Sucesso
    Abrir Loja
    Fazer Login                      ${USER}    ${PASS}
    
    # Passo 1: Adicionar produto e ir para o carrinho
    Wait Until Element Is Visible    ${PRODUTO_ID}    timeout=10s
    Click Button                     ${PRODUTO_ID}
    Click Link                       class=shopping_cart_link
    
    # Passo 2: Iniciar Checkout
    Wait Until Element Is Visible    id=checkout    timeout=5s
    Click Button                     id=checkout
    
    # Passo 3: Preencher Informações de Envio
    Wait Until Element Is Visible    id=first-name    timeout=5s
    Input Text                       id=first-name    ${FIRST_NAME}
    Input Text                       id=last-name     ${LAST_NAME}
    Input Text                       id=postal-code   ${POSTAL_CODE}
    Click Button                     id=continue
    
    # Passo 4: Revisão e Finalização
    Wait Until Element Is Visible    id=finish    timeout=5s
    Click Button                     id=finish
    
    # Passo 5: Validação da Mensagem de Sucesso
    Wait Until Page Contains         Thank you for your order!    timeout=5s
    Element Should Contain           class=complete-header        Thank you for your order!
    
    [Teardown]    Fechar Navegador

*** Keywords ***
Abrir Loja
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Fazer Login
    [Arguments]    ${u}    ${p}
    Input Text        id=user-name    ${u}
    Input Password    id=password     ${p}
    Click Button      id=login-button

Fechar Navegador
    # Pequeno sleep apenas para você ver a tela final antes de fechar
    Sleep           3s
    Close Browser