*** Settings ***
Library  Collections

*** Variables ***
@{my_list}  1  2  3  4
${zmienna}  4

*** Test Cases ***
Collections - List
    FOR  ${index}  IN  @{my_list}
        log  ${index}
    END

    append to list  ${my_list}  4
    append to list  ${my_list}  wyraz
    log list  ${my_list}