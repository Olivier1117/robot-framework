*** Settings ***
Library  ../calculatrice.py

*** Test Cases ***
Addition Test 2 positifs
    [Documentation]  test d'addition 
    ${result}    addition    5    3
    Should Be Equal As Numbers    ${result}    8

Addition Test 2 négatifs
    [Documentation]  test d'addition 
    ${result}    addition    -5    -3
    Should Be Equal As Numbers    ${result}    -8

Addition Test positif et négatif
    [Documentation]  test d'addition 
    ${result}    addition    5    -3
    Should Be Equal As Numbers    ${result}    2

Soustraction Test
    [Documentation]  test d'addition 
    ${result}    Soustraction    5    3
    Should Be Equal As Numbers    ${result}    2

Multiplication Test
    [Documentation]  test d'addition 
    ${result}    multiplication    5    3
    Should Be Equal As Numbers    ${result}    15

Multiplication Test par 0
    [Documentation]  test d'addition 
    ${result}    multiplication    5    0
    Should Be Equal As Numbers    ${result}    0

Division Test
    [Documentation]  test d'addition 
    ${result}    division    6    3
    Should Be Equal As Numbers    ${result}    2

Division Test par 0
    [Documentation]  test d'addition 
    ${result}    division    6    0
    Should Be Equal As Strings   ${result}    Division par 0 impossible
