## Automação de testes com Robot Framework
Projeto do curso de Robot Beginner, da QA Ninja.

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
Test Teardown		Encerra sessão
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
	Radio Button Should Be Set To		movies		cap

Selecionando por Value
	[tags]							radio_value
	Go To							${url}/radios
	Select Radio Button					movies		     guardians
	Radio Button Should Be Set To		movies		guardians
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

Ao utilizarmos alguma *keyword* que contenha `Get`, indica que podemos ter um retorno. É necessário utilizar uma variável para informar o nome do elemento `${nomeElemento}=`, e em seguida indicar o *locator* do elemento, para indicar de onde queremos obter algo para ser verificado.

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
	Table Row Should Contain	   id:actors	        1	    $ 10.000.000

Descobre a linha pelo texto chave e valida os demais valores
	Go To				   ${url}/tables
	${target}=			   Get Web Element		    xpath:.//tr[contains(., '@chadwickboseman')]
	Should Contain			   ${target.text}		    $ 700.000
	Should Contain			   ${target.text}		    Pantera Negra
```

É possível imprimir os valores encontrados no relatório, utilizando a *keyword* `Log`, e também exibir os valores no console, utilizando `Log To Console`:
```
Descobre a linha pelo texto chave e valida os demais valores
	Go To				   ${url}/tables
	${target}=			   Get Web Element		    xpath:.//tr[contains(., '@chadwickboseman')]
	Log				   ${target.text}
	Log To Console			   ${target.text}
	Should Contain			   ${target.text}		    $ 700.000
	Should Contain			   ${target.text}		    Pantera Negra
```

## Preenchendo formulários
Crie o arquivo *login_form.robot*, com o seguinte conteúdo:
```
*** Settings ***
Resource	base.robot

Test Setup	Nova sessão
Test Teardown	Encerra sessão

*** Test Cases ***
Login com sucesso
	Go To				    ${url}/login
	Input Text			    css:input[name=username]		stark
	Input Text			    css:input[name=password]		jarvis!
	Click Element			    class:btn-login

	Page Should Contain		    Olá, Tony Stark. Você acessou a área logada!
```

## Validando notificações
Incrementando o cenário anterior, vamos validar a mensagem quando a senha informada é inválida:
```
Senha inválida
	[tags]				    login_error
	Go To				    ${url}/login
	Input Text			    css:input[name=username]		  stark
	Input Text			    css:input[name=password]		  abc123
	Click Element			    class:btn-login

	${message}=			    Get Web Element			  id:flash
	Should Contain			    ${message.text}			  Senha é invalida!
```

Aumentando o nível da validação, vamos verificar além da mensagem exibida, se está sendo exibida no elemento correto (`id:flash`):
```
Login com usuário inexistente
	[tags]				    login_user404
	Go To				    ${url}/login
	Input Text			    css:input[name=username]		  carol
	Input Text			    css:input[name=password]		  123
	Click Element			    class:btn-login

	${message}=			    Get Web Element			  id:flash
	Should Contain			    ${message.text}		          O usuário informado não está cadastrado!
```

## Page Objects com novas keywords
Continuando no script anterior, vamos utilizar o recurso *custom keyword* para criar nossas próprias palavras-chave. A declaração é feita da seguinte forma:
```
*** Keywords ***
Login With
	[Arguments]			    ${usrname}				  ${pass}
	Input Text			    css:input[name=username]		  ${usrname}
	Input Text			    css:input[name=password]		  ${pass}
	Click Element			    class:btn-login

```

Altere o trecho onde as *keywords* `Input Text` e `Click Element` estavam declaradas, informando nossa nova *keyword* `Login With`, seguida dos valores:
```
*** Test Cases ***
Login com sucesso
	Go To				    ${url}/login
	Login With			    stark				  jarvis!
```

Criaremos outra palavra-chave customizada para validar a mensagem de alerta:
```
Should Contain Login Alert
	[Arguments]			    ${expected_message}
	${message}=			    Get Web Element			  id:flash
	Should Contain			    ${message.text}			  ${expected_message}

Shouls See Logged User
	[Arguments]			    ${full_name}
	Page Should Contain		    Olá, ${full_name}. Você acessou a área logada!
```

Nosso script ficará da seguinte forma:
```
*** Settings ***
Resource	base.robot

Test Setup	Nova sessão
Test Teardown	Encerra sessão

*** Test Cases ***
Login com sucesso
	Go To				    ${url}/login
	Login With			    stark				   jarvis!

	Shouls See Logged User		    Tony Stark

Senha inválida
	[tags]				    login_error
	Go To				    ${url}/login
	Login With			    stark				   abc123

	Should Contain Login Alert	    Senha é invalida!

Login com usuário inexistente
	[tags]				    login_user404
	Go To				    ${url}/login
	Login With			    carol				   123

	Should Contain Login Alert	    O usuário informado não está cadastrado!

*** Keywords ***
Login With
	[Arguments]			    ${usr_name}			  	   ${pass}
	Input Text			    css:input[name=username]		   ${usr_name}
	Input Text			    css:input[name=password]		   ${pass}
	Click Element			    class:btn-login

Should Contain Login Alert
	[Arguments]			    ${expected_message}
	${message}=			    Get Web Element			   id:flash
	Should Contain			    ${message.text}			   ${expected_message}

Shouls See Logged User
	[Arguments]			    ${full_name}
	Page Should Contain		    Olá, ${full_name}. Você acessou a área logada!
```
