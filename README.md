## Automação de testes com Robot Framework
Projeto do curso Automação de Testes com Robot Framework, da Mayara "May" Fernandes, da Udemy.

-----------------------------------------
### O que este script faz?
Este script efetua alguns testes na [loja virtual Automation Practice](http://automationpractice.com/index.php).

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
- Abra o diretório do projeto via terminal e execute o comando abaixo para instalar as dependências:
```
npm install --save-dev
```
- Para verificar se possui as versões instaladas, digite no terminal:
```
npm -v && node -v
```

### Testes
- O script executa 4 cenários de teste: são três testes positivos, e um teste que força um erro (fail).

- Três testes referentes a *Login* esecutam com BDD, e estão no arquivo *features > basic.feature*.

- O teste "Account" está sendo executado diretamente do Scenario do arquivo *create_user_test.js*.

- No arquivo *features > basic.feature*, comente o cenário "Test with proposital error" com `#` caso queira que todos os testes passem (este cenário força para ocorrer um erro).

- Para executar todos os testes, digite no terminal:
```
npx codeceptjs run
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
O Robot Framework é um framework open source para automação de testes, desenvolvido em Python.

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

Segquências de *keywords* formam um caso ou cenário de teste.

Os scripts que implementam essas palavras-chave são estritos em baixo nível (linguagem de programação). No caso do Robot, esses scripts já estão pré-programadados e disponibilizadps através de *libraries*. Sendo assim, o automatizador não precisa se preocupar em implementar esses scripts.

Uma *keyword* pode ser implementada com *sub-keywords*.

Apesar de já existirem diversas *libraries* disponíveis, nada impede o automatizador de criar suas próprias *keywords* com scripts programados em Python oy Java.


## Instalação
- Criar uma pasta para o projeto, chamada **automacao-codeceptjs-web**
- Acessar a pasta, informar o comando `npm init`
- Vai questionar algumas coisas
- Vai criar um `package.json`
- Abrir o projeto no VSCode
- No prompt: `npm install codeceptjs webdriverio --save-dev`
- Depois da instalação: `npx codeceptjs init`

`npm` - *node package manager*, gerenciador de pacotes do Node. Diferentemente do `npm`, o `npx` executa alguma coisa já instalada. O `I` é o nosso ator, é ele quem representa as ações do usuário dentro do script.

Vai questionar algumas coisas, selecionar:
- pasta de testes (manter)
- helper:  Webdriver
- logs: (manter)
- localization: English (no localization)
- base url: http://automationpractice.com/index.php
- browser: (manter)
- feature: login
- filename: (manter)

## 

## Erros conhecidos

- 