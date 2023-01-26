*** Settings ***
Library  SeleniumLibrary
Test Setup  OPEN WIKIPEDIA
Test Teardown  Close Browser


*** Variables ***
${project_path}    C:\Users\vdi-student\Desktop\screens
${wikipedia_login}  RobotTests
${wikipedia_password}  RobotFramework
${error_message}  Podany login lub hasło są nieprawidłowe. Spróbuj jeszcze raz.


*** Keywords ***
OPEN WIKIPEDIA
    open browser    https://pl.wikipedia.org  Chrome  #executable_path=C:/chromedriver/chromedriver.exe

Log In Wikipedia
    [Arguments]  ${login}  ${password}
    click element    id:pt-login
    ${my_value}  Get Text  id:wpName1
    Should Be Empty  ${my_value}
    input text    id:wpName1    ${login}
    Checkbox Should Not Be Selected  id:wpRemember
    select checkbox    id:wpRemember
    input password    id:wpPassword1    ${password}
    click button    id:wpLoginAttempt

Incorrect Log In Wikipedia
    [Documentation]  Check the error message - incorrect password
    [Arguments]  ${login}
    click element    id:pt-login
    ${my_value}  Get Text  id:wpName1
    Should Be Empty  ${my_value}
    input text    id:wpName1    ${login}
    Checkbox Should Not Be Selected  id:wpRemember
    select checkbox    id:wpRemember
    input password    id:wpPassword1    123123
    click button    id:wpLoginAttempt
    Wait Until Element Is Visible  css:.mw-message-box-error  timeout=7
    ${my_error_message}  Get Text  css:.mw-message-box-error
    Log To Console  ${my_error_message}
    Should Be Equal As Strings  ${my_error_message}  ${error_message}

Seach WiKi
    [Arguments]  ${text}
    input text  id:searchInput  ${text}
    click button  id:searchButton

*** Test Cases ***
MyFirstTest
    [Documentation]  First test
    Log In Wikipedia    ${wikipedia_login}  ${wikipedia_password}
    input text    id:searchInput    Teoria Wielkiego Podrywu
    click button    id:searchButton
    capture page screenshot    ${project_path}/screen1.png

MySecondTest
    [Documentation]  Second test
    Incorrect Log In Wikipedia  ${wikipedia_login}
    Capture Page Screenshot    ${project_path}/screen2.png

My_3rd_test
    Seach WiKi  Batman
    Sleep  3
