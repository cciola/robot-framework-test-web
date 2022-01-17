*** Settings ***
Library		SeleniumLibrary

*** Variables ***
${url}				https://training-wheels-protocol.herokuapp.com
${check_thor}		id:thor
${check-iron}		css:input[value='iron-man']
${check-panther}	xpath://*[@id='checkboxes']/input[7]

*** Test Cases ***
Should see page title
	[tags]				test_title
	Open Browser		https://training-wheels-protocol.herokuapp.com		chrome
	Title Should Be		Training Wheels Protocol
	Close Browser

Marcando opção com Id
	[tags]							test_id
	Open Browser					${url}				chrome
	Go To							${url}/checkboxes
	Select Checkbox					${check_thor}
	Checkbox Should Be Selected		${check_thor}
	Close Browser

Marcando opção com CSS Selector
	[tags]							test_css
	Open Browser					${url}				chrome
	Go To							${url}/checkboxes
	Select Checkbox					${check-iron}
	Checkbox Should Be Selected		${check-iron}
	Sleep							5
	Close Browser

Marcando opção com XPath
	[tags]							test_xpath
	Open Browser					${url}				chrome
	Go To							${url}/checkboxes
	Select Checkbox					${check-panther}
	Checkbox Should Be Selected		${check-panther}
	Sleep							5
	Close Browser