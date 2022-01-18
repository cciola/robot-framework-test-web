## Automação de testes com Robot Framework
Projeto do curso Automação de Testes com Robot Framework, da Mayara "May" Fernandes, da Udemy.

-----------------------------------------
### O que este script faz?
Este script efetua alguns testes na página [Training Wheels](https://training-wheels-protocol.herokuapp.com/).

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
  - marque a opção "Install for all users", certifique-se de que o campo do path está desta forma: *C:\Python310*
  - as opções referentes a "Download debugging" **não** precisam ser marcadas
  - após a instalação, confira nas Variáveis de Ambiente (do sistema) se os diretórios do Python 3 foram criados no *Path*:
    - *C:\Program Files\Python310\Scripts\\*
    - *C:\Program Files\Python310\\*
  - Caso não tenham sido criados, acesse a pasta de *Arquivos de Programas* do Windows, pasta Python, copie e adicione manualmente os caminhos destas duas pastas no *Path* da Variável de Ambiente de sistema.
  - Para verificar se o Python e o pip foram instalados com sucesso, digite no terminal `python --version && pip --version`.

- **Robot Framework**: para instalar, digite no terminal: `pip install robotframework`
  - Adicione manualmente no *Path* das Variáveis de Ambiente o caminho para a pasta do executável do Robot, exemplo: *C:\Users\carol\AppData\Roaming\Python\Python310\Scripts*.

- **Selenium**: vamos instalar a library externa *SeleniumLibrary* para os [testes web com Python](https://selenium-python.readthedocs.io/getting-started.html):
  ```
  pip install --upgrade robotframework-seleniumlibrary
  ```

- **Requests**: vamos instalar a library externa *Requests* para testes de API:
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
robot -d ./log nomeArquivo.robot
```

- Para executar os testes de um arquivo específico com o Robot, digite no terminal:
```
robot -d ./log tests\nomeDoArquivo.robot
```

- Para executar todos os testes com o Robot, digite no terminal:
```
robot -d ./log tests\nomeDoArquivo.robot
```

-----------------------------------------
### Arquitetura do projeto

```
📂 robot-framework-test-web/
  ├─ 📂 log/ (pasta que armazena relatórios e screenshots dos testes)
      └─ 📜 log.html
      └─ 📜 output.xml
      └─ 📜 report.html
  ├─ 📂 tests/ (pasta que contém os scripts dos testes)
      └─ 📜 base.robot
      └─ 📜 checkbox.robot
      └─ 📜 radiobutton.robot
      └─ 📜 select.robot
      └─ 📜 title.robot
  ├─ 📜 app.py
  ├─ 📜 test.robot
  ├─ 📜 .gitignore
  └─ 📜 README.md
```
-----------------------------------------

## Introdução
O Robot Framework é um framework open source para automação de testes, desenvolvido em Python. Possibilita automatizar testes web, desktop e mobile.

É estruturado para desenvolvimento dirigido a testes de aceitação (ATDD), que é uma abordagem para times ágeis de desenvolvimento, onde os requisitos são definidos e refinados pelo time (QA, Devs, PO), logo no início do projeto. Estes requisitos tornam-se executáveis posteriormente, com o ATDD. Mas o Robot pode ser utilizado mesmo que o time não seja ágil.

Baseia-se em *keyword-driven*, ou seja, os testes serão escritos a alto nível, sem se preocupar com a linguagem de programação.

É genérico, ou seja, possibilita testar qualquer sistema.

As possibilidades de testes podem ser estendidas através de *libraries* implementadas em Python ou Java. As *libraries* podem ser desenvolvidas ou customizadas de acordo com a necessidade.

Não necessita de IDE. Possui uma sintaxe de escrita tabular fácil de ser utilizada em qualquer editor.

Pode ser instalado e utilizado em qualquer sistema operacional.


## A abordagem keyword-driven
O Robot utiliza ***keywords*** (palavras-chave), que são uma representação da interação em alto nível (linguagem mais natural e humana) com o sistema. Elas espeitam espaços e tabulações para identificar o que é uma keyword e o que são argumentos.

As *keywords* contém espaço simples entre si, e são reservadas da *library* utilizada. Geralmente estão escritas em Inglês. As sequências de *keywords* formam um caso ou cenário de teste.

Os scripts que implementam essas palavras-chave são estritos em baixo nível (linguagem de programação). No caso do Robot, esses scripts já estão pré-programados e disponibilizados através de *libraries*. Sendo assim, o automatizador não precisa se preocupar em implementar esses scripts.

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

## Dinâmica de funcionamento do Robot
Vamos criar um arquivo de testes em Python, *app.py*, contendo:
```python
def welcome(name):
    return "Olá " + name + ", bem vindo ao curso de Robot Framework!"

result = welcome("Carol")
print(result)
```

Para executar, digite no terminal `python app.py`.

Para utilizar o Robot nesta aplicação, crie um novo arquivo `test.robot`:
```
*** Settings ***
Library     app.py

*** Test Cases ***
Deve retornar mensagem de boas vindas
    Welcome       Carol
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
    ${result}=          	Welcome        	   Carol
    Should Be Equal     	${result}      	   Olá Carol, bem vindo ao curso de Robot Framework!
```

Crie o arquivo `title.robot`, contendo:
```
*** Settings ***
Library		SeleniumLibrary

*** Test Cases ***
Should see page title
	[tags]			title
	Open Browser		https://training-wheels-protocol.herokuapp.com	      chrome
	Title Should Be		Training Wheels Protocol
	Close Browser
```
Para gerar os logs dentro de uma pasta, deixando o projeto mais organizado, delete os três arquivos gerados após a execução, e execute o comando `robot -d ./log title.robot`.

## Tags, variáveis e checkboxes
Crie o arquivo *checkbox.robot* contendo o exemplo abaixo, que ilustra a utilização de tags:
```
*** Settings ***
Library		SeleniumLibrary

*** Variables ***
${url}		https://training-wheels-protocol.herokuapp.com

*** Test Cases ***
Marcando opção com Id
	[tags]				check_id
	Open Browser			${url}					chrome
	Go To				${url}/checkboxes
	Select Checkbox			id:thor
	Checkbox Should Be Selected	id:thor
	Sleep				5
	Close Browser

Marcando opção com CSS Selector
	[tags]				check_css
	Open Browser			${url}					chrome
	Go To				${url}/checkboxes
	Select Checkbox			css:input[value:'iron-man']
	Checkbox Should Be Selected	css:input[value:'iron-man']
	Sleep				5
	Close Browser

Marcando opção com XPath
	[tags]				check_xpath
	Open Browser			${url}					chrome
	Go To				${url}/checkboxes
	Select Checkbox			xpath://*[@id='checkboxes']/input[7]
	Checkbox Should Be Selected	xpath://*[@id='checkboxes']/input[7]
	Sleep				5
	Close Browser
```

Vamos melhorar utilizando variáveis para armazenar o *locator* dos elementos:

```
*** Settings ***
Library		SeleniumLibrary

*** Variables ***
${url}			https://training-wheels-protocol.herokuapp.com
${check_thor}		id:thor
${check-iron}		css:input[value='iron-man']
${check-panther}	xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com Id
	[tags]				check_id
	Open Browser			${url}			chrome
	Go To				${url}/checkboxes
	Select Checkbox			${check_thor}
	Checkbox Should Be Selected	${check_thor}
	Sleep				5
	Close Browser

Marcando opção com CSS Selector
	[tags]				check_css
	Open Browser			${url}			chrome
	Go To				${url}/checkboxes
	Select Checkbox			${check-iron}
	Checkbox Should Be Selected	${check-iron}
	Sleep				5
	Close Browser

Marcando opção com XPath
	[tags]				check_xpath
	Open Browser			${url}			chrome
	Go To				${url}/checkboxes
	Select Checkbox			${check-panther}
	Checkbox Should Be Selected	${check-panther}
	Sleep				5
	Close Browser
```

Para executar todos os testes, digite `robot -d ./log title.robot`.

Para executar apenas o teste de uma tag específica, digite `-i nomeDaTag`:
```
robot -d ./log -i ironman title.robot
```

## Hooks (ganchos): Test Setup e Test Teardown
São comportamentos implementados antes e após cada caso de teste, respectivamente.

Vamos implementar novas *keywords* para abrir o navegador antes dos testes e acessar a página, e fechar o navegador depois dos testes. Declare ao final do script:
```
*** Keywords ***
Nova sessão
	Open Browser	   ${url}	 chrome

Encerra sessão
	Close Browser
```

E depois, no início:
```
Test Setup		Nova sessão
Test Teardown	Encerra sessão
```

Depois, basta eliminar dos testes as linhas correspondentes a abrir e fechar o navegador.

## Resource
Crie o arquivo *base.robot* na raiz do projeto, e acrescente nele tudo o que é genérico dentre os scripts de teste:
```
*** Settings ***
Library		SeleniumLibrary

*** Variables ***
${url}		https://training-wheels-protocol.herokuapp.com

*** Keywords ***
Nova sessão
	Open Browser	${url}      chrome

Encerra sessão
	Close Browser
```

No *Settings* dos scripts, troque a `Library SeleniumLibrary` por `Resource    base.robot`. Desta forma, estamos reaproveitando as *keywords*, as *libraries* e as variáveis.

## Pasta de testes
Crie a pasta *tests* na nossa estrutura, e mover o arquivo *base.robot* junto com os scripts de teste para dentro dela. Ao executar os testes, vamos declarar `robot -d ./ log tests\` para executar todos os testes.

## Capturando screenshots
Vamos complementar nosso *Teardown* com a *keyword* `Capture Page Screenshot`, antes do fechamento do navegador. Assim garantiremos um screenshot ao final do teste, evidenciando que passou.
```
Encerra sessão
	Capture Page Screenshot
	Close Browser
```

## Radio buttons
Crie o arquivo *radiobutton.robot*, com o seguinte conteúdo:
```
*** Settings ***
Resource		base.robot

Test Setup		Nova sessão
Test Teardown		Encerra sessão

*** Test Cases ***
Selecionando por Id
	[tags]							radio_id
	Go To							${url}/radios
	Select Radio Button					movies		     cap
	Radio BUtton Should Be Set To		movies		cap

Selecionando por Value
	[tags]							radio_value
	Go To							${url}/radios
	Select Radio Button					movies		     guardians
	Radio BUtton Should Be Set To		movies		guardians
```

## Menu de opções (combobox/select)
Crie o arquivo *select.robot*, com o seguinte conteúdo:
```
*** Settings ***
Resource	    base.robot

Test Setup	    Nova sessão
Test Teardown       Encerra sessão

*** Test Cases ***
Selecionar opção por texto e validar pelo valor
	[tags]				    select_texto
	Go To				    ${url}/dropdown
	Select From List By Label	    class:avenger-list      	    Scott Lang
	${selected}=			    Get Selected List Value	    class:avenger-list
	Should Be Equal			    ${selected}			    7

Selecionar opção por valor e validar pelo texto
	[tags]				    select_value
	Go To				    ${url}/dropdown
	Select From List By Value	    id:dropdown		            6
	${selected}=			    Get Selected List Label	    id:dropdown
	Should Be Equal			    ${selected}			    Loki
```

## Validando registros em tabelas
Crie o arquivo *tables.robot*. No Robot, para validar um valor de uma tabela, é necessário saber qual é o número da linha na qual o registro consta.

É necessário primeiramente informar qual é a tabela, depois o número da linha, e finalmente o valor que será verificado:
```
Table Row Should Contain		    id:actors		1	$ 10.000,00
```

Se o valor for único na linha, podemos informar o valor independentemente da coluna em que ele se encontra:
```
Table Row Should Contain		    id:actors		1	@robertdowneyjr
```

Caso ocorra alguma mudança na tabela e a massa mude de linha, por exemplo, podemos efetuar um teste para descobrir a linha pelo texto chave, e validar os demais valores:
```
*** Settings ***
Resource	base.robot

Test Setup	Nova sessão
Test Teardown	Encerra sessão

*** Test Cases ***
Verifica o valor ao informar o número da linha
	Go To				   ${url}/tables
	Table Row Should Contain	   id:actors	      1	       $ 10.000.000

Descobre a linha pelo texto chave e valida os demais valores
	Go To			${url}/tables
	${target}=		Get Web Element		xpath:.//tr[contains(., '@chadwickboseman')]
	Should Contain		${target.text}		$ 700.000
	Should Contain		${target.text}		Pantera Negra
```

É possível imprimir os valores encontrados no relatório, utilizando a *keyword* `Log`, e também exibir os valores no console, utilizando `Log To Console`:
```
Descobre a linha pelo texto chave e valida os demais valores
	Go To						${url}/tables
	${target}=					Get Web Element		xpath:.//tr[contains(., '@chadwickboseman')]
	Log						${target.text}
	Log To Console		${target.text}
	Should Contain		${target.text}		$ 700.000
	Should Contain		${target.text}		Pantera Negra
```

## Preenchendo formulários

## Validando notificações

## Page Objects com novas keywords

## Robot Framework ou Cypress? Por que não ambos?
[Vídeo](https://www.youtube.com/watch?v=SUsSWP-g7o0) do QA Ninja week - 26/10/2021
## Dicas
- O `pip` é o instalador e gerenciados de pacotes do Python, e já é instalado automaticamente com o Python.

- Com o comando `pip freeze`, é possível listar todos os pacotes instalados. Caso seja necessário atualizar a versão dos pacotes do Robot, digite o comando `pip install --upgrade robotframework==3.2.2` (informe a versão desejada).

- Ao executar testes cuja *Library* utilizada seja um arquivo Python, a pasta *__pycache__* é criada automaticamente.
