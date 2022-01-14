*** Settings ***
Library     app.py


*** Test Cases ***
Deve retornar mensagem de boas vindas
    ${result}=          Welcome     Carol
    Should Be Equal     ${result}   Olá Carol, bem vindo ao curso de Robot Framework!