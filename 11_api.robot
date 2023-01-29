*** Settings ***
Library               RequestsLibrary
*** Variables ***
${token}    023b49dd123bfd82d66e7fff0c1cd47ae8470f7343fa13b6de0cb72656184703
*** Test Cases ***
GET_STATUS
    ${get_response}    GET    https://simple-books-api.glitch.me/status
    Log to console    status ${get_response}

GET_BOOKS
    ${get_response}    GET    https://simple-books-api.glitch.me/books
    Log to console    status ${get_response}

POST_REGISTRATION
    ${register_json}    create dictionary    clientName=Kamil2    clientEmail=kamil2@example.com
    ${post_register_response}    POST    https://simple-books-api.glitch.me/api-clients/
    ...                                                            json=${register_json}

ORDER
    ${headers}    create dictionary    Content-Type=application/json    Authorization=Bearer ${token}
    ${order_body}    create dictionary   bookId=4    customerName=Kamil2
    ${post_order_response}    POST    https://simple-books-api.glitch.me/orders
        ...                                           headers=${headers}    json=${order_body}


