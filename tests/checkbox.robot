*** Settings ***
Resource		base.robot

Test Setup		Nova sessão
Test Teardown	Encerra sessão

*** Variables ***
${check_thor}		id:thor
${check-iron}		css:input[value='iron-man']
${check-panther}	xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Marcando opção com Id
	[tags]				            check_id
	Go To				            ${url}/checkboxes
	Select Checkbox			        ${check_thor}
	Checkbox Should Be Selected	    ${check_thor}

Marcando opção com CSS Selector
	[tags]				            check_css
	Go To				            ${url}/checkboxes
	Select Checkbox			        ${check-iron}
	Checkbox Should Be Selected	    ${check-iron}
	Sleep				            5

Marcando opção com XPath
	[tags]				            check_xpath
	Go To				            ${url}/checkboxes
	Select Checkbox			        ${check-panther}
	Checkbox Should Be Selected	    ${check-panther}
	Sleep				            5