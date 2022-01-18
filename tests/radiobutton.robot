*** Settings ***
Resource		base.robot

Test Setup          Nova sessão
Test Teardown       Encerra sessão

*** Test Cases ***
Selecionando por Id
	[tags]							    radio_id
	Go To							    ${url}/radios
	Select Radio Button					movies		     cap
	Radio Button Should Be Set To		movies		     cap

Selecionando por Value
	[tags]							    radio_value
	Go To							    ${url}/radios
	Select Radio Button					movies		     guardians
	Radio Button Should Be Set To		movies		     guardians