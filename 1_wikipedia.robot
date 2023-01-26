*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${project_path}    C:\Users\vdi-student\Desktop\screens
${wikipedia_login}  RobotTests
${wikipedia_password}  RobotFramework

*** Keywords ***
Log In Wikipedia
    [Arguments]  ${login}  ${password}
    open browser    https://pl.wikipedia.org  Chrome  #executable_path=C:/chromedriver/chromedriver.exe
    click element    id:pt-login
    input text    id:wpName1    ${login}
    select checkbox    id:wpRemember
    input password    id:wpPassword1    ${password}
    click button    id:wpLoginAttempt

*** Test Cases ***
MyFirstTest
    [Documentation]  First test

    Log In Wikipedia    ${wikipedia_login}  ${wikipedia_password}
    input text    id:searchInput    Teoria Wielkiego Podrywu
    click button    id:searchButton
    capture page screenshot    ${project_path}/screen1.png
    close browser

MySecondTest
    [Documentation]  Second test

    Log In Wikipedia  ${wikipedia_login}  ${wikipedia_password}
    input text    id:searchInput    Teoria Wielkiego Podrywu
    click button    id:searchButton
    capture page screenshot    ${project_path}/screen2.png
    close browser


