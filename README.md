## Automação de testes com Robot Framework
Projeto do curso Automação de Testes com Robot Framework, da Mayara "May" Fernandes, da Udemy.

-----------------------------------------
### O que este script faz?
Este script efetua alguns testes na [link](http://link).

-----------------------------------------
### Instalação e uso da arquitetura
- Instale as ferramentas:
  - [VSCode](https://code.visualstudio.com/ "VSCode")
  - [NodeJS 12.18.4](https://nodejs.org/en/download/ "NodeJS 12.18.4")
  - [NPM](https://www.npm.com/ "NPM")
  - [CodeceptJS](https://codecept.io/ "CodeceptJS") > Guides > Use Webdriver
  - [WebdriverIO](https://webdriver.io/ "WebdriverIO")
  - Chrome
  - Firefox

- Abra um terminal que aceite comandos git (exemplo: Powershell, git bash, cmder, etc.)
- Baixe este repositório ou faça um `git clone` (HTTPS/SSH)

- Para verificar se possui as versões instaladas, digite no terminal:
```
xxx
```

### Testes
- 

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
### Introdução
O Robot Framework é um framework open source para automação de testes, desenvolvido em Python. Possibilita automatizar testes web, desktop e mobile.

É estruturado para desenvolvimento dirigido a testes de aceitação (ATDD), que é uma abordagem para times ágeis de desenvolvimento, onde os requisitos são definidos e refinados pelo time (QA, Devs, PO), logo no início do projeto. Estes requisitos tornam-se executáveis posteriormente, com o ATDD. Mas o Robot pode ser utilizado mesmo que o time não seja ágil.

Baseia-se em *keyword-driven*, ou seja, os testes serão escritos a alto nível, sem se preocupar com a liguagem de programação.

É genérico, ou seja, possibilita testar qualquer sistema.

As possibilidades de testes podem ser estendidas através de *libraries* implementadas em Python ou Java. As *libraries* podem ser desenvolvidas ou customizadas de acordo com a necessidade.

Não necessita de IDE. Possui uma sintaxe de escrita tabular fácil de ser utilizada em qualquer editor.

Pode ser instalado e utilizado em qualquer sistema operacional.


## A abordagem keyword-driven
O Robot utiliza *keywords*(palavras-chave), que são uma representação da interação em alto nível (linguagem mais natural e humana) com o sistema. Elas espeitam espaços e tabulações para identificar o que é uma keyword e o que são argumentos.

As **keywords** contém espaço simples entre si, e são reservadas da *library* utilizada. Geralmente estão escritas em Inglês.

Os **argumentos** possuem tabulação mínima de 2 espaços entre si. As **variáveis** tabmvém possuem espaço duplo entre si.

Sequências de *keywords* formam um caso ou cenário de teste.

Os scripts que implementam essas palavras-chave são estritos em baixo nível (linguagem de programação). No caso do Robot, esses scripts já estão pré-programadados e disponibilizadps através de *libraries*. Sendo assim, o automatizador não precisa se preocupar em implementar esses scripts.

Uma *keyword* pode ser implementada com *sub-keywords*.

Apesar de já existirem diversas *libraries* disponíveis, nada impede o automatizador de criar suas próprias *keywords* com scripts programados em Python oy Java.


## Vantagens
- Fácil leitura e entendimento da ação que está ocorrendo
- Fácil manutenção
- Se bem escrita e estruturada, a sequência de *keywords* pode se tornar uma documentação
- Bom para testadores não técnicos


### Libraries Standard
As *Libraries* do tipo **standard** são nativas do Robot, então você não precisa instalá-las, apenas instanciá-las nos testes.

Ao clicar no link da library, temos a sessão **Shortcuts**, que contém todas as *keywords* disponíveis daquela *library*. Ao clicar em um *shortcut*, direcionará para a explicação da *keyword*, e também listará os argumentos possíveis que você pode utilizar com ela.

---

## Instalação

- Instale as ferramentas:

  - **Python 3**: Acesse o [site do Python](https://www.python.org/downloads/), faça o download, marque a opção "Add Python 3.7 to PATH", e confira nas suas Variáveis de Ambiente (de usuário) se os diretórios do Python 3 foram criados no PATH. Caso não sejam criados, acesse a pasta do usuário do Windows, pasta Python, copie e cole manualmente o caminho desta pasta na Variável de Ambiente.

  - Para verificar se o Python foi instalado com sucesso, digite no terminal:
    ```javascript
    python --version
    ```

  - **Robot Framework**: para instalar, digite no terminal:
    ```javascript
    pip install robotframework
    ```

  - Com o comando `pip freeze`, é possível listar todos os pacotes instalados. Caso seja necessário atualizar a versão dos pacotes do Robot, digite o comando `pip install --upgrade robotframework==3.2.2` (informe a versão desejada).

  - **Selenium**: vamos instalar a library externa *SeleniumLibrary* para os testes web, com o comando `pip install --upgrade robotframework-seleniumlibrary`.

  - **Requests**: vamos instalar a library externa *Requests* para testes de API, com o comando `pip install -U robotframework-requests`.

  - **Drivers**: Vamos baixar o driver do Firefox, o [Geckodriver](https://github.com/mozilla/geckodriver/releases), e também o driver do Chrome, o [Chromedriver](https://sites.google.com/chromium.org/driver/downloads). Salve os drivers dentro da pasta *scripts* no diretório do Python, pois esta pasta já está mapeada nas variáveis de ambiente.

---

### IDE
Abaixo temos o passo a passo da instalação de duas IDEs: o ATOM e o VSCode.

**ATOM**

- Faça o download no [site do ATOM](https://atom.io/) (siga a instalação normal).

- No site do Robot, em *Tools*, temos outras IDEs compatíveis, caso deseje usar uma diferente do ATOM (Pycharm, VS Code, etc.).

- No Atom, acesse o menu *Packages > Settings View > Install Packages/Themes*, pesquise por "robotframework", instale os pacotes:

  - language-robot-framework
  - autocomplete-robot-framework
  - hyperclick-robot-framework

**Habilitando o terminal por dentro do ATOM**

**IMPORTANTE**: Habilite o terminal por dentro do ATOM é opcional, pois fica tudo numa única tela, mas podem ser utilizados outros terminais externamente, como o CMD, Power Shell, Bash, etc.

- Instale o pacote **platformio-ide-terminal** em *ATOM > Packages > Settings View > Install Packages/Themes*

- Após instalar esse plugin, modifique o shell que ele irá usar, colocando o CMD do Windows: acesse *Settings* no plugin e cole no campo *Shell Override* o diretório do seu shell preferido, exemplo *C:\Windows\system32\cmd.exe*.

- Reinicie o ATOM

- Para acessar o terminal dentro do ATOM, basta clicar no + que fica no rodapé.

**Plug-in para Robot Framework no ATOM**

Houve uma atualização recente no plugin do Language-Robot Framework que deixou ele com a cor das sintaxes diferentes, fazendo com que os casos de teste e seus passos ficassem todos da mesma cor. É possível corrigir isso ajustando o plugin manualmente para ficar como antes e destacar as palavras do Gherkin também:

- Obtenha o arquivo *robottxt.cson* [neste repositório](https://github.com/mayribeirofernandes/testesrobotframework/tree/master/language-robot-framework/grammars).

- Feche o ATOM

- Substitua o arquivo *robottxt.cson* no diretório de instalação do ATOM, exemplo: *C:\Users\carol.ciola\.atom\packages\language-robot-framework\grammars*

- Abra o ATOM novamente.

---

**VS Code**

O VSCode é um excelente editor de código e atualmente conta com o **melhor plugin de Robot Framework**.

- Faça o [download do VSCode](https://code.visualstudio.com/download);

- Instale normalmente;

- Acesse na opção "Extensões" e procure pela extensão chamada *Robot Framework Language Server*, da Robocorp;

- Instale normalmente, não é necessário fazer nenhuma configuração adicional;

- Reinicie o VSCode para garantir a instalação.

**ATENÇÃO:** não é necessário instalar mais nenhum outro plugin para Robot, pois pode haver conflitos e algumas funções podem não funcionar corretamente.

---

### Atualizando Libraries e Webdrivers


---

## Erros conhecidos

-