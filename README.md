# Teste Técnico Cabeleleila Leila

**Desenvolvido por Lucas Satoshi Cipriano Oikawa**

Bem-vindos ao meu ambiente de testes! Nesta documentação irei apresentar todos os requisitos e o funcionamento do sistema.

## Introdução
Para adiantar, veja o vídeo onde explico detalhadamente sobre o projeto:  
[Assista ao vídeo](https://drive.google.com/file/d/1G72A8VP59XxQmN2Wm_IKbAS0umBn32-k/view?usp=sharing)

Caso queiram conferir um test drive do sistema para os clientes do Cabeleleila Leila, acesse o aplicativo pelo link abaixo:  
[Teste o sistema](https://teste-2u9c.onrender.com/cabeleleila_leila/index)  
**Nota:** Por ser uma hospedagem gratuita, aguarde aproximadamente um minuto e recarregue a página, se necessário.

---

## Tecnologias Utilizadas

- **Sistema operacional**: Windows 10 ou superior.
- **Arquitetura do projeto**: Modelo MVC.
- **Aplicação Web (clientes do Cabeleleila Leila)**:
  - Desenvolvida em **Python** com o framework **Flask**.
  - Banco de dados: **SQLite** (configuração automática de scripts para criação do banco e tabelas).
  - **Responsividade** para mobile utilizando **HTML**, **CSS** e **JavaScript**.
- **Aplicação Desktop (para a Leila e administradores)**:
  - Desenvolvida em **Delphi 12** para executável Windows.
  - **Requisito**: Antes de executar o sistema do administrador, execute a aplicação web e crie pelo menos um usuário.

---

## Instruções de Funcionamento

### Aplicação Web
1. Instale o Python no Windows e uma extensão oficial do Python no **VS Code**.
2. Crie um ambiente virtual Python e instale as dependências utilizando o comando:
   ```bash
   >Python: Criar ambiente
   ```

3. Ative o ambiente virtual no terminal PowerShell com o comando:   
   ```bash
    .venv\Scripts\Activate.ps1
   ```

4. Execute a aplicação com o comando:
   ```bash
    flask run
   ```

Nota: O banco de dados está configurado para ser lido no caminho C:/Projetos/teste. Caso o repositório seja clonado para outro diretório, edite o arquivo de configuração do banco em:
/teste/cabeleleila-leila-admin/bin/cabeleleila_admin.cfg.

### Aplicação Desktop

1. Após criar um usuário na aplicação web, navegue até a pasta /teste/cabeleleila-leila-admin/bin/.
2. Execute o arquivo:
   ```bash
    cabeleleila_admin.exe
   ```

Obrigado por explorar o sistema!