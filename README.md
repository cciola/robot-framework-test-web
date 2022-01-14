## Automação de testes com Robot Framework
Projeto do curso Automação de Testes com Robot Framework, da Mayara "May" Fernandes, da Udemy.

-----------------------------------------
### O que este script faz?
Este script efetua alguns testes na [link](http://link).

-----------------------------------------
### Instalação e uso da arquitetura
Instale as ferramentas:
  
- [Python3](https://www.python.org/downloads/ "Python"): faça o download do instalador. Na instalação:
  - marque a opção "Add Python 3.7 to PATH"
  - clique na opção "Customize installation" para prosseguir
  - mantenha estas opções **marcadas**:
    - Documentation
    - pip
    - td/tk and IDLE
    - Python test suite
    - py launcher
    - for all users
  - marque a opção "Install for all users", alterando o campo do path para *C:\Python310*
  - as opções referentes a "Download debugging" **não** precisam ser marcadas
  - após a instalação, confira nas Variáveis de Ambiente (do sistema) se os diretórios do Python 3 foram criados no *Path*:
    - *C:\Program Files\Python310\Scripts\\*
    - *C:\Program Files\Python310\\*
  - Caso não tenham sido criados, acesse a pasta de *Arquivos de Programas* do Windows, pasta Python, copie e adicione manualmente os caminhos destas duas pastas no *Path* da Variável de Ambiente de sistema.
  - Para verificar se o Python e o pip foram instalados com sucesso, digite no terminal `python --version && pip --version`. O `pip` é o instalador e gerenciados de pacotes do Python, e já é instalado automaticamente com o Python.

- **Robot Framework**: para instalar, digite no terminal: `pip install robotframework`
  - Adicione manualmente nas Variáveis de Ambiente (de usuário) o caminho para a pasta do executável do Robot, exemplo: *C:\Users\carol\AppData\Roaming\Python\Python310\Scripts*.

- Com o comando `pip freeze`, é possível listar todos os pacotes instalados. Caso seja necessário atualizar a versão dos pacotes do Robot, digite o comando `pip install --upgrade robotframework==3.2.2` (informe a versão desejada).

- **Selenium**: vamos instalar a library externa *SeleniumLibrary* para os testes web, com o comando abaixo:
  ```
  pip install --upgrade robotframework-seleniumlibrary
  ```

- **Requests**: vamos instalar a library externa *Requests* para testes de API, com o comando abaixo:
  ```
  pip install -U robotframework-requests
  ```

- **Webdrivers**: Baixe os drivers [Chromediver](https://sites.google.com/chromium.org/driver/downloads) e [Geckodriver](https://github.com/mozilla/geckodriver/releases), descompacte e salve os executáveis dentro da pasta *C:\Program Files\Python310\Scripts\\*, pois esta pasta já está mapeada nas variáveis de ambiente.
  
- [VSCode](https://code.visualstudio.com/ "VSCode"): o VSCode é um excelente editor de código e atualmente conta com o **melhor plugin de Robot Framework**. Faça o download, prossiga com os passos padrão na instalação. Vamos instalar as extensões, e **reiniciar o VSCode** para garantir a instalação:
  - *Python*, da Microsoft
  - *Robot Framework Intellisense*, do Tomi Turtiainen

- [Cmder](https://cmder.net/ "Cmder"): instale a versão **full** da instalação.

- Abra um terminal que aceite comandos git (exemplo: Powershell, git bash, cmder, etc.)
- Baixe este repositório ou faça um `git clone` (HTTPS/SSH)

- Para verificar se possui as versões instaladas, digite no terminal:
```
python --version &&  pip --version && robot --version
```

- Para executar os testes em Python, digite no terminal:
```
python nomeArquivo.py
```

- Para executar os testes com o Robot, digite no terminal:
```
robot nomeArquivo.robot
```

-----------------------------------------
### Arquitetura do projeto

```
📂 automacao-codeceptjs-web/
  ├─ 📂 node_modules/ (módulos instalados após os comandos que informamos)
  ├─ 📂 output/ (pasta que armazena relatórios e screenshots dos testes que falharam)
  ├─ 📂 pages/ (pasta que contém os arquivos com elementos das páginas que iremos testar)
      └─ 📜 create_user_page.js
      └─ 📜 home_page.js
      └─ 📜 login_page.js
      └─ 📜 my_account_page.js
  ├─ 📂 steps/ (pasta que contém os arquivos com os passos dos testes - BDD)
        └─ 📜 create_user_test.js
        └─ 📜 login_test.js
  ├─ 📜 .gitignore
  ├─ 📜 codeceptjs.conf.js (arquivo de configurações)
  ├─ 📜 jsconfig.json (permite que o Javascript esteja ativo como linguagem padrão do projeto)
  ├─ 📜 package-lock.json (contém tudo sobre os pacotes que foram instalados)
  ├─ 📜 package.json
  ├─ 📜 README.md
  ├─ 📜 steps_file.js (aqui temos o ator)
  └─ 📜 steps.d.ts (é sobre o Typescript)
```
-----------------------------------------

## Introdução
O Robot Framework é um framework open source para automação de testes, desenvolvido em Python. Possibilita automatizar testes web, desktop e mobile.

É estruturado para desenvolvimento dirigido a testes de aceitação (ATDD), que é uma abordagem para times ágeis de desenvolvimento, onde os requisitos são definidos e refinados pelo time (QA, Devs, PO), logo no início do projeto. Estes requisitos tornam-se executáveis posteriormente, com o ATDD. Mas o Robot pode ser utilizado mesmo que o time não seja ágil.

Baseia-se em *keyword-driven*, ou seja, os testes serão escritos a alto nível, sem se preocupar com a liguagem de programação.

É genérico, ou seja, possibilita testar qualquer sistema.

As possibilidades de testes podem ser estendidas através de *libraries* implementadas em Python ou Java. As *libraries* podem ser desenvolvidas ou customizadas de acordo com a necessidade.

Não necessita de IDE. Possui uma sintaxe de escrita tabular fácil de ser utilizada em qualquer editor.

Pode ser instalado e utilizado em qualquer sistema operacional.


## A abordagem keyword-driven
O Robot utiliza ***keywords*** (palavras-chave), que são uma representação da interação em alto nível (linguagem mais natural e humana) com o sistema. Elas espeitam espaços e tabulações para identificar o que é uma keyword e o que são argumentos. 

As *keywords* contém espaço simples entre si, e são reservadas da *library* utilizada. Geralmente estão escritas em Inglês. As sequências de *keywords* formam um caso ou cenário de teste.

Os scripts que implementam essas palavras-chave são estritos em baixo nível (linguagem de programação). No caso do Robot, esses scripts já estão pré-programadados e disponibilizados através de *libraries*. Sendo assim, o automatizador não precisa se preocupar em implementar esses scripts.

Uma *keyword* pode ser implementada com ***sub-keywords***.

Algumas vantagens da abordagem *keyword-driven*:
- Fácil leitura e entendimento da ação que está ocorrendo
- Fácil manutenção
- Se bem escrita e estruturada, a sequência de *keywords* pode se tornar uma documentação
- Bom para testadores não técnicos

### Tabulação
Os **argumentos** devem ser declarados com uma tabulação de 2 espaços entre si. As **variáveis** também devem possuir um espaço duplo entre si.

### Libraries Standard
As *Libraries* do tipo ***standard*** são nativas do Robot, então você não precisa instalá-las, apenas instanciá-las nos testes.

Apesar de já existirem diversas *libraries* disponíveis, nada impede o automatizador de criar suas próprias *keywords* com scripts programados em Python oy Java.

---

## Dinâmica de funcionamento do Robot
Crie o arquivo *app.py*, contendo:
```python
def welcome(name):
    return "Olá " + name + ", bem vindo ao curso de Robot Framework!"

result = welcome("Carol")
print(result)
```

Para executar, digite no terminal *python app.py*

Para utilizar o Robot nesta aplicação, criar um novo arquivo `test.robot`:
```
*** Settings ***
Library     app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    Welcome     Carol
```

O Robot não utiliza a linguagem Python para testar o script; as *keywords* são utilizadas para que o Robot importe o código do Python do arquivo *app.py* como palavra-chave.

Para executar no Robot, digite `robot test.robot`. O teste será executado, e além do status no prompt, serão gerados três arquivos:

- *output.xml*
- *log.html*
- *report.html*

Ao abrir o arquivo de report, teremos uma página web com o relatório do teste.

Editando novamente o código para obter as informações do arquivo *app.py* por meio de *keywords*:

```
*** Settings ***
Library     app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=      Welcome     Carol
    Should Be Equal  ${result}  Olá Carol, bem vindo ao curso de Robot Framework!
```


## Erros conhecidos

-
