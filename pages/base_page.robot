*** Settings ***
Library    Browser
Variables   ../resources/variables.py

*** Variables ***
${COOKIE_BANNER_SELECTOR}    css:.js-consent-banner
${ACCEPT_COOKIES_BUTTON}     css:.js-accept-cookies
*** Keywords ***
Open StackOverflow Questions
    [Arguments]    ${tab}
    New Page        ${WEB_BASE_URL}/questions?tab=${tab}
    Handle Cookie Banner
    Wait For Elements State    ${QUESTION_TITLE_SELECTOR}    visible    timeout=10s
Handle Cookie Banner
    [Documentation]    Gère la bannière de cookies si elle est présente
    ${cookie_banner_visible}=    Run Keyword And Return Status    
    ...    Wait For Elements State    ${ACCEPT_COOKIES_BUTTON}    visible    timeout=5s
    
    Run Keyword If    ${cookie_banner_visible}
    ...    Click Accept Cookies

Click Accept Cookies
    [Documentation]    Clique sur le bouton d'acceptation des cookies
    Click    ${ACCEPT_COOKIES_BUTTON}
    Log    ✅ Cookies acceptés
Get First Question Title
    Wait For Elements State    ${FIRST_QUESTION_TITLE_SELECTOR}    visible    timeout=5s
    ${title}=    Get Text    ${FIRST_QUESTION_TITLE_SELECTOR}
    [Return]    ${title}

    