*** Settings ***
Library  SeleniumLibrary
Test Setup  Open Page and click cookies   ${carefour_adres}

*** Variables ***
${carefour_adres}    https://www.carrefour.pl/
${zdrowa_zywnosc}    //*[@id="__next"]/div/div[2]/div/div[1]/div[1]/div/div/div[1]/a[5]
${zdrowa_zywnosc_BIO}    //*[@id="__next"]/div/div[2]/div/div[1]/div[1]/div[1]/div[2]/a[3]/span[1]/p
${napoj_sojowy}    //*[@id="__next"]/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div[2]/div/button[2]/span[1]
${next_napoj_sojowy}    //*[@id="__next"]/div/div[2]/div/div[1]/div[2]/div[2]/div/div/div[2]/div/div[7]/button[2]/span[1]

${dostawa_kurier}    //*[@id="__next"]/div/div/div/div[4]/div/div/div/div/div[2]/label/div/div/div[1]/div
${rozpocznij_zakupy}    //*[@id="__next"]/div/div/div/div[6]/button[1]
*** Keywords ***
Open Page and click cookies
    [Arguments]    ${address}
    Open browser    ${address}    Chrome    #executable_path=C:/chromedriver/chromedriver.exe
    Maximize Browser Window
    Wait Until Element Is Visible    //*[@id="onetrust-accept-btn-handler"]    timeout=3
    click button    //*[@id="onetrust-accept-btn-handler"]
    sleep    3

Enter deparment
    [Arguments]    ${department}
    click element    ${department}

Add to basket
    [Arguments]    ${product}
    click element    ${product}


*** Test Cases ***
Test 1
    Enter deparment    ${zdrowa_zywnosc}
    Wait Until Element Is Visible    ${zdrowa_zywnosc_BIO}    timeout=5
    Enter deparment    ${zdrowa_zywnosc_BIO}
    Wait Until Element Is Visible    ${napoj_sojowy}    timeout=5
    Add to basket    ${napoj_sojowy}
    Wait Until Element Is Visible    ${rozpocznij_zakupy}    timeout=5
    Click element   ${dostawa_kurier}
    Click button    ${rozpocznij_zakupy}
    Wait Until Element Is Visible    ${napoj_sojowy}    timeout=5
    Add to basket    ${napoj_sojowy}
    Wait Until Element Is Visible    ${next_napoj_sojowy}
    Add to basket    ${next_napoj_sojowy}
    sleep    3
    capture page screenshot
