# Desafio de Automação com Robot Framework 🤖
Este repositório contém scripts de teste automatizados para o site [Sauce Demo](https://www.saucedemo.com/), utilizando o Robot Framework e a SeleniumLibrary.

## Casos de teste implementados
* Login: Validação de acesso com usuário padrão.
* Carrinho: Adição de produtos e fluxo de checkout completo.
* Logout: Encerramento de sessão e retorno à tela inicial.

## Como executar os testes
1. Instale o Robot Framework: `pip install robotframework`
2. Instale a SeleniumLibrary: `pip install robotframework-seleniumlibrary`
3. Execute os testes: `robot *.robot`