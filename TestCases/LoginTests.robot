*** Settings ***
Resource    LoginPage.robot

Test Teardown    Close Browser

*** Test Cases ***
Validar Login com Sucesso
    Abrir Página Principal
    Clicar no botão Login
    Inserir Email
    Inserir Senha
    Submeter Formulário
    Validar Mensagem de Boas Vindas
    Deslogar
    
Validar Login sem Sucesso
    Given um usuário na página de login
    When usuário insere um email válido, uma senha errada e submete o formulário
    Then mensagem de Erro deve ser exibida
    
Validar Login sem Sucesso com Diversas entradas
    [Template]    Inserir Login Inválido
    email@email.com       ${SENHA}
    ${EMAIL}              123566
    ${EMAIL}              ${EM_BRANCO}
    ${EM_BRANCO}          ${EM_BRANCO}