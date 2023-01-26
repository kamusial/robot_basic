*** Variables ***
@{my_list}  Mama  Tata  Pies  Kot  Ptak  I jeszcze cos

*** Test Cases ***
FOR LOOP
    FOR  ${name}  IN  @{my_list}
        IF  $name == 'Pies'  log  ${name}
    END

FOR LOOP
    @{my_list}  create list  Mama  Tata  Pies  Kot  Ptak  I jeszcze cos
    FOR  ${name}  IN  @{my_list}
        IF  $name == 'Pies'  BREAK
        log  ${name}
    END

WHILE LOOP
    ${index}  set variable  10

    WHILE  ${index} > 0
        log  ${index}
        ${index}  evaluate  ${index} - 1
    END


