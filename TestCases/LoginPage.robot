*** Settings ***
Library    Selenium2Library

*** Variables ***
${URL_LOGIN}    http://ninjainvoices.herokuapp.com/login
${URL}    http://ninjainvoices.herokuapp.com
${URL_LOGOUT}    http://ninjainvoices.herokuapp.com/logout
${BROWSER}    chrome
${USERNAME}    teste
${EMAIL}    testeteste@teste.com
${SENHA}    teste123
${BOTAO_LOGIN}    login
${CAMPO_EMAIL}    email
${CAMPO_SENHA}    password
${FORM_LOGIN_SENHA}    login_form
${CAMPO_BEM_VINDO_USUARIO}    page_title
${EM_BRANCO}    


*** Keywords ***
Abrir Página Principal
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Enabled    ${BOTAO_LOGIN}
    
Deslogar e Fechar Navegador
    Close All Browsers
    
Clicar no botão Login
    Wait Until Element Is Enabled    ${BOTAO_LOGIN}
    Click Element    ${BOTAO_LOGIN}
    
Inserir Email
    Wait Until Element Is Enabled    ${CAMPO_EMAIL}
    Input Text    ${CAMPO_EMAIL}    ${EMAIL}
    
Inserir Senha
    Wait Until Element Is Enabled    ${CAMPO_SENHA}
    Input Password    ${CAMPO_SENHA}    ${SENHA}
    
Inserir Login Inválido
    [Arguments]   ${argumento_email}   ${argumento_password}
    Abrir Página Principal
    Clicar no botão Login
    Wait Until Element Is Enabled    ${CAMPO_EMAIL}
    Input Text    ${CAMPO_EMAIL}    ${argumento_email}
    Wait Until Element Is Enabled    ${CAMPO_SENHA}
    Input Password    ${CAMPO_SENHA}    ${argumento_password}
    Submeter Formulário
    Page Should Not Contain    Bem Vindo
    Close Browser

Inserir Senha Inválida
    Wait Until Element Is Enabled    ${CAMPO_SENHA}
    Input Password    ${CAMPO_SENHA}    1233432
    
Submeter Formulário
    Wait Until Page Contains Element    ${FORM_LOGIN_SENHA}
    Submit Form    ${FORM_LOGIN_SENHA}    
    
Validar Mensagem de Boas Vindas
    Wait Until Page Contains    Bem Vindo ${USERNAME}! 
    
usuário insere um email válido, uma senha errada e submete o formulário
    Wait Until Page Contains    Faça seu login    
    Inserir Email
    Inserir Senha Inválida
    Submeter Formulário
    
mensagem de Erro deve ser exibida
    Wait Until Page Contains    Incorrect password [403]
    
um usuário na página de login
    Abrir Página Principal
    Go To    ${URL_LOGIN}    
    
Deslogar
    Go To    ${URL_LOGOUT} 