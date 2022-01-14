## Automação de testes com Robot Framework
Projeto do curso Automação de Testes com Robot Framework, da Mayara "May" Fernandes, da Udemy.

-----------------------------------------
### O que este script faz?
Este script efetua alguns testes na [link](http://link).

-----------------------------------------
### Instalação e uso da arquitetura
- Instale as ferramentas:
  - [VSCode](https://code.visualstudio.com/ "VSCode")
  - [Python](https://www.python.org/downloads/ "Python")
  - [Chromediver](https://sites.google.com/chromium.org/driver/downloads "Chromedriver")
  - [Geckodriver](https://github.com/mozilla/geckodriver/releases "Geckodriver")
  - [Cmder](https://cmder.net/ "Cmder") (opcional), optar pela instalação full
  - Maiores detalhes sobre a instalação de cada ferramenta na seção **Instalação** mais abaixo

- Abra um terminal que aceite comandos git (exemplo: Powershell, git bash, cmder, etc.)
- Baixe este repositório ou faça um `git clone` (HTTPS/SSH)

- Para verificar se possui as versões instaladas, digite no terminal:
```
python --version &&  pip --version
```

- Para executar todos os testes, digite no terminal:
```
xxx
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
## Instalação
Instale as ferramentas:

- **Python 3**: Acesse o [site do Python](https://www.python.org/downloads/), faça o download do instalador. Na instalação:
  - marque a opção "Add Python 3.7 to PATH"
  - clique na opção **Customize installation** para prosseguir
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

- Com o comando `pip freeze`, é possível listar todos os pacotes instalados. Caso seja necessário atualizar a versão dos pacotes do Robot, digite o comando `pip install --upgrade robotframework==3.2.2` (informe a versão desejada).

- **Selenium**: vamos instalar a library externa *SeleniumLibrary* para os testes web, com o comando `pip install --upgrade robotframework-seleniumlibrary`.

- **Requests**: vamos instalar a library externa *Requests* para testes de API, com o comando `pip install -U robotframework-requests`.

- **Drivers**: Vamos baixar o driver do Firefox, o [Geckodriver](https://github.com/mozilla/geckodriver/releases), e também o driver do Chrome, o [Chromedriver](https://sites.google.com/chromium.org/driver/downloads). Salve os drivers dentro da pasta *scripts* no diretório do Python, pois esta pasta já está mapeada nas variáveis de ambiente.

- **VSCode**: o VSCode é um excelente editor de código e atualmente conta com o **melhor plugin de Robot Framework**.

- Faça o [download do VSCode](https://code.visualstudio.com/download), prossiga com os passos padrão na instalação

- Vamos instalar as extensões:
  - *Python*, da Microsoft
  - *Robot Framework Intellisense*, do Tomi Turtiainen

- Reinicie o VSCode para garantir a instalação.


## Introdução
O Robot Framework é um framework open source para automação de testes, desenvolvido em Python. Possibilita automatizar testes web, desktop e mobile.

É estruturado para desenvolvimento dirigido a testes de aceitação (ATDD), que é uma abordagem para times ágeis de desenvolvimento, onde os requisitos são definidos e refinados pelo time (QA, Devs, PO), logo no início do projeto. Estes requisitos tornam-se executáveis posteriormente, com o ATDD. Mas o Robot pode ser utilizado mesmo que o time não seja ágil.

Baseia-se em *keyword-driven*, ou seja, os testes serão escritos a alto nível, sem se preocupar com a liguagem de programação.

É genérico, ou seja, possibilita testar qualquer sistema.

As possibilidades de testes podem ser estendidas através de *libraries* implementadas em Python ou Java. As *libraries* podem ser desenvolvidas ou customizadas de acordo com a necessidade.

Não necessita de IDE. Possui uma sintaxe de escrita tabular fácil de ser utilizada em qualquer editor.

Pode ser instalado e utilizado em qualquer sistema operacional.


## A abordagem keyword-driven
O Robot utiliza *keywords* (palavras-chave), que são uma representação da interação em alto nível (linguagem mais natural e humana) com o sistema. Elas espeitam espaços e tabulações para identificar o que é uma keyword e o que são argumentos.

As **keywords** contém espaço simples entre si, e são reservadas da *library* utilizada. Geralmente estão escritas em Inglês.

Os **argumentos** possuem tabulação mínima de 2 espaços entre si. As **variáveis** também possuem espaço duplo entre si.

Sequências de *keywords* formam um caso ou cenário de teste.

Os scripts que implementam essas palavras-chave são estritos em baixo nível (linguagem de programação). No caso do Robot, esses scripts já estão pré-programadados e disponibilizadps através de *libraries*. Sendo assim, o automatizador não precisa se preocupar em implementar esses scripts.

Uma *keyword* pode ser implementada com *sub-keywords*.

Apesar de já existirem diversas *libraries* disponíveis, nada impede o automatizador de criar suas próprias *keywords* com scripts programados em Python oy Java.


### Vantagens
- Fácil leitura e entendimento da ação que está ocorrendo
- Fácil manutenção
- Se bem escrita e estruturada, a sequência de *keywords* pode se tornar uma documentação
- Bom para testadores não técnicos


### Libraries Standard
As *Libraries* do tipo **standard** são nativas do Robot, então você não precisa instalá-las, apenas instanciá-las nos testes.

Ao clicar no link da library, temos a sessão **Shortcuts**, que contém todas as *keywords* disponíveis daquela *library*. Ao clicar em um *shortcut*, direcionará para a explicação da *keyword*, e também listará os argumentos possíveis que você pode utilizar com ela.

---

## Criando o primeiro arquivo Python
Vamos criar o arquivo *app.py*, contendo:

```python
def welcome(name):
    return "Olá " + name + ", bem vindo ao curso de Robot Framework!"

result = welcome("Carol")
print(result)
```

Para executar, digite no terminal `python app.py`

O Robot não utiliza a linguagem Python para testar o script. Vamos utilizar as *keywords*, para que o Robot importe nosso código do Python do arquivo *app.py* como palavra-chave:

```
*** Settings ***
Library     app.py


*** Test cases ***
Deve retornar mensagem de boas vindas
    Welcome     Carol
```

Para executar no Robot, digite `robot test.robot`

Para utilizar o Robot nesta aplicação, vamos criar um novo arquivo *test.robot*
## Erros conhecidos

-