*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Keywords ***
Registration In Forum
    [Arguments]  ${email}  ${password}
    open browser    https://gotujmy.pl/forum/  Chrome  executable_path=C:/chromedriver/chromedriver.exe
    click element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    run keyword and ignore error  click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    input text    //*[@id="f_cmu_email"]    kamil
    input text    //*[@id="f_cmu_email2"]    kamil
    input text    //*[@id="f_cmu_password"]    kamil
    input text    //*[@id="f_cmu_password2"]    kamil
    Checkbox Should Not Be Selected  //*[@id="newsletter_agree"]
    select checkbox  //*[@id="newsletter_agree"]
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[2]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[2]/input
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[3]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[3]/input
    capture page screenshot    #${project_path}/screen1.png





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


