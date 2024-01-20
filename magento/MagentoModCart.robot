*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER}   chrome
${SELSPEED}  5.0s

*** Settings ***
Library  SeleniumLibrary

*** Settings ***
Library           SeleniumLibrary
Test Setup    Open Browser    https://www.google.com/    chrome
Test Teardown    Close Browser

*** Variables ***
${BASE_URL}       https://www.google.com/
${URL}    https://magento.softwaretestingboard.com/
${EMAIL}    bara_olivier@hotmail.com
${PASSWORD}    1867Paloma117&

*** Test Cases ***
Luma Test
    Maximize Browser Window
    Login    ${EMAIL}    ${PASSWORD}
    Navigate to Cart
    Modify Item From Cart
    # Count Articles With Quantity in Cart
    Logout
   
*** Keywords ***
Login
    [Documentation]    Test du formule de connexion
    [Arguments]    ${EMAIL}    ${PASSWORD}
    Go To    ${URL}
    Click Element    link=Sign In
    Input Text    id=email    ${EMAIL}
    Input Text    id=pass    ${PASSWORD}
    Click Element    xpath=//form[@id='login-form'][1]/fieldset/div[4]/div[1]/button/span

Navigate to Cart
    Go To    https://magento.softwaretestingboard.com/checkout/cart/

Modify Item From Cart
    [Documentation]    Test de suppression du panier
    #Click Element    xpath=//tbody[@class='cart item'][2]/tr[@class='item-actions'][1]/td[1]/div[@class='actions-toolbar'][1]/a[@class='action action-delete']


    ${nb_articles}    get element attribute    //body[1]/div[2]/main[1]/div[3]/div[1]/div[3]/form[1]/div[1]/table[1]/tbody[2]/tr[1]/td[3]/div[1]/div[1]/label[1]/input[1]    value
    Log to console    Nombre total d'elements: ${nb_articles}

    Input Text    //body[1]/div[2]/main[1]/div[3]/div[1]/div[3]/form[1]/div[1]/table[1]/tbody[2]/tr[1]/td[3]/div[1]/div[1]/label[1]/input[1]    10

    ${nb_articles}    get element attribute    //body[1]/div[2]/main[1]/div[3]/div[1]/div[3]/form[1]/div[1]/table[1]/tbody[2]/tr[1]/td[3]/div[1]/div[1]/label[1]/input[1]    value
    Log to console    Nombre total d'elements: ${nb_articles}

Count Articles With Quantity in Cart
    ${total_quantity}    Set Variable    0
    Log to console    Nombre total d'elements: ${total_quantity}

    ${article_elements}    Get WebElements    xpath=//tbody[@class='cart item']/@class

    ${total_quantity}    Get Length   ${article_elements} 

    Log To Console    Nombre total d'elements dans le panier: ${total_quantity}
    
    Should Be Equal As Numbers    ${total_quantity}    2

        

Logout
    [Documentation]    Test du deconnexion
    Wait Until Page Contains Element    xpath=//div[@class='panel header'][1]/ul[@class='header links']    timeout=10s 
    Click Button   xpath=//div[@class='panel header'][1]/ul[@class='header links'][1]/li[@class='customer-welcome']/span/button
    Click Element    xpath=//div[@class='customer-menu']/ul/li[@class='authorization-link']/a