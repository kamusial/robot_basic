*** Settings ***
Library  SeleniumLibrary
Test Setup  Open My Browser

*** Variables ***
@{emails}  email1@wwp.pl  email2@wwp.pl   email3@wwp.pl   email4@wwp.pl   email5@wwp.pl
@{passwords}  pass1  pass2  pass3  pass4  pass5
${message}    Dziękujemy za założenie nowego konta.
*** Keywords ***
Open My Browser
    Open Browser    https://gotujmy.pl/forum/    Chrome
    Maximize Browser Window
    sleep    3
    Scroll Element Into View    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    Run Keyword And Ignore Error    click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]

Registration In Forum
    [Arguments]  ${name}   ${password}
    Click Element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    Run Keyword And Ignore Error    click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    input text    //*[@id="f_cmu_email"]    ${name}
    input text    //*[@id="f_cmu_email2"]    ${name}
    input text    //*[@id="f_cmu_password"]     ${password}
    input text    //*[@id="f_cmu_password2"]    ${password}
    Checkbox Should Not Be Selected  //*[@id="newsletter_agree"]
    select checkbox  //*[@id="newsletter_agree"]
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[2]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[2]/input
    Checkbox Should Not Be Selected  //*[@id="user_register_form"]/fieldset/label[3]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[3]/input
    Click Button    //*[@id="user_register_form"]/fieldset/footer/button
    Wait Until Element Is Visible  //*[@id="main_content"]/div/div/h1  timeout=7
    ${my_message}  Get Text  //*[@id="main_content"]/div/div/h1
    Log To Console  ${my_message}
    Should Be Equal As Strings  ${my_message}  ${message}
    Capture Page Screenshot

*** Test Cases ***
Registraion Of Multiple User
    FOR   ${i}   IN RANGE    5
        Registration In Forum   ${emails}[${i}]    ${passwords}[${i}]
        Log    User ${emails}[${i}]
    END

Unsuccessful Regiustratoin Different Names
    sleep    1