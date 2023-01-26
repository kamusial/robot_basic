*** Settings ***
Library  Collections

*** Test Cases ***
Collections - Dictionary
    ${person}  Create Dictionary  name=Kamil  Age=18  hobby=brak
    log dictionary  ${person}

    ${person_name}  get from dictionary  ${person}  name
    log  ${person_name}

    ${car}  set variable  Audi
    Set To Dictionary  ${person}  color=red  car=${car}
    log dictionary  ${person}

    ${popped_item}  Pop From Dictionary  ${person}  hobby
    log  Usunieto element o kluczu hobby, wartosc: ${popped_item} i tyle

    Remove From Dictionary  ${person}  color
    log dictionary  ${person}
