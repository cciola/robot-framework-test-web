*** Settings ***
Resource	    base.robot

Test Setup	    Nova sessão
Test Teardown	Encerra sessão

*** Test Cases ***
Login com sucesso
	Go To				    ${url}/login
	Login With			    stark                   jarvis!

	Shouls See Logged User                          Tony Stark

Senha inválida
	[tags]				    login_error
	Go To				    ${url}/login
	Login With			    stark				    abc123

	Should Contain Login Alert	                    Senha é invalida!

Login com usuário inexistente
	[tags]				    login_user404
	Go To				    ${url}/login
	Login With			    carol				    123

	Should Contain Login Alert	                    O usuário informado não está cadastrado!

*** Keywords ***
Login With
	[Arguments]			    ${usr_name}			  	           ${pass}
	Input Text			    css:input[name=username]		   ${usr_name}
	Input Text			    css:input[name=password]		   ${pass}
	Click Element			class:btn-login

Should Contain Login Alert
	[Arguments]			    ${expected_message}
	${message}=			    Get Web Element			           id:flash
	Should Contain			${message.text}			           ${expected_message}

Shouls See Logged User
	[Arguments]			    ${full_name}
	Page Should Contain		Olá, ${full_name}. Você acessou a área logada!