*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${project_path}    C:\Users\vdi-student\Desktop\screens
${wikipedia_login}  RobotTests
${wikipedia_password}  RobotFramework

*** Keywords ***
Registration In Forum
    [Arguments]  ${login}  ${password}
    open browser    https://gotujmy.pl/forum/  Chrome  executable_path=C:/chromedriver/chromedriver.exe
    click element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    run keyword and ignore error  click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    input text    //*[@id="f_cmu_email"]    kamil
    capture page screenshot    #${project_path}/screen1.png

Log In Wikipedia
    [Arguments]  ${login}  ${password}
    open browser    https://pl.wikipedia.org  Chrome  #executable_path=C:/chromedriver/chromedriver.exe
    click element    id:pt-login
    input text    id:wpName1    ${login}
    select checkbox    id:wpRemember
    input password    id:wpPassword1    ${password}
    click button    id:wpLoginAttempt



*** Test Cases ***
Registration
    Registration In Forum  5  5

#MyFirstTest
#    [Documentation]  First test
#
#    Log In Wikipedia    ${wikipedia_login}  ${wikipedia_password}
#    input text    id:searchInput    Teoria Wielkiego Podrywu
#    click button    id:searchButton
#    capture page screenshot    ${project_path}/screen1.png
#    close browser
#
#MySecondTest
#    [Documentation]  Second test
#
#    Log In Wikipedia  ${wikipedia_login}  ${wikipedia_password}
#    input text    id:searchInput    Teoria Wielkiego Podrywu
#    click button    id:searchButton
#    capture page screenshot    ${project_path}/screen2.png
#    close browser


