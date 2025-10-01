*** Settings ***
Resource    base_page.robot
Variables   ../resources/variables.py
*** Keywords ***
Verify Page Loaded
    Wait For Elements State    ${QUESTION_TITLE_SELECTOR}    visible    timeout=10s
    ${count}=    Get Element Count    ${QUESTIONS_SELECTOR}
    Should Be True    ${count} > 0
    [Return]    ${count}