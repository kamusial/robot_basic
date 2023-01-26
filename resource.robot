*** Keywords ***
SEARCH WIKIPEDIA
    [Arguments]  ${text1}  ${text2}
    input text  id:searchInput  ${text1}
    click button  id:searchButton
    input text  id:searchInput  ${text2}
    click button  id:searchButton

*** Variables ***
${wikipedia_login}  RobotTests
${wikipedia_password}  RobotFramework