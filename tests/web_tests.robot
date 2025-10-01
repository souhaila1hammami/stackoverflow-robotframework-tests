*** Settings ***
Resource    ../resources/config.robot
Resource    ../pages/base_page.robot
Resource    ../pages/questions_page.robot
Resource    ../api/stackoverflow_api.robot
Library          RequestsLibrary
Library          String
Library         Browser
Library          Collections
Suite Setup      Suite Setup
Suite Teardown   Suite Teardown
Test Setup    Setup Web Test
Test Teardown    Teardown Web Test

*** Test Cases ***
Test Web Page Loads Correctly
    [Documentation]    Vérifie que la page StackOverflow se charge correctement
    [Tags]    web    smoke
    Open StackOverflow Questions    Newest
    ${question_count}     Verify Page Loaded
    Should Be True    ${question_count} >= 15
    Log    ✅ Nombre de questions: ${question_count}

Test Cookie Banner Handling
    [Documentation]    Test la gestion de la bannière de cookies
    [Tags]    web    cookies
    Open StackOverflow Questions    Newest
    
    Handle Cookie Banner

Test First Question Comparison With Cookies
    [Documentation]    Compare la première question entre l'API et le Web avec gestion des cookies
    [Tags]    web    api    integration    cookies
    # Obtenir le titre depuis l'API
    
    ${api_title}=   Get First Question Title From API
    Log    API Title: ${api_title}
    
    # Obtenir le titre depuis le Web (avec gestion des cookies)
    Open StackOverflow Questions    Newest
    ${web_title}=    Get First Question Title
    Log    Web Title: ${web_title}
    
    # Nettoyer et comparer
    ${clean_api}=    Evaluate    ' '.join('''${api_title}'''.split())
    ${clean_web}=    Evaluate    ' '.join('''${web_title}'''.split())
    
    Should Be Equal    ${clean_api}    ${clean_web}
    ...    msg= Les titres ne correspondent pas! API: '${clean_api}' vs WEB: '${clean_web}'

*** Keywords ***
Suite Setup
    Log     Début de la suite de tests Web avec gestion des cookies

Suite Teardown
    Log     Fin de la suite de tests Web


Test Compare First Question
    [Tags]    web    api
    Setup API Test
    ${api_title}=    Get First Question Title From API
    Open StackOverflow Questions     Newest
    ${web_title}=    Get First Question Title
    ${clean_api}=    Clean Text For Comparison    ${api_title}
    ${clean_web}=    Clean Text For Comparison    ${web_title}
    Should Be Equal    ${clean_api}    ${clean_web}