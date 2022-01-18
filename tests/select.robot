*** Settings ***
Resource		base.robot

Test Setup		    Nova sessão
Test Teardown       Encerra sessão

*** Test Cases ***
Selecionar opção por texto
	[tags]				            select_texto
	Go To				            ${url}/dropdown
	Select From List By Label	    class:avenger-list      Scott Lang

Selecionar opção por valor
	[tags]				            select_value
	Go To				            ${url}/dropdown
	Select From List By Value	    id:dropdown		        6