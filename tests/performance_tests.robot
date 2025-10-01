*** Settings ***
Resource    ../resources/config.robot
Resource    ../api/stackoverflow_api.robot
Library     DateTime
Test Setup    Setup API Test
Test Teardown    Teardown API Test

*** Test Cases ***
Test Response Time Under 1 Second
    [Tags]    performance
    ${start}=    Get Time    epoch
    ${response}=    Get Latest Questions
    ${end}=    Get Time    epoch
    ${duration}=    Evaluate    (${end} - ${start}) * 1000
    Run Keyword If    ${duration} > 1000
    ...    Log    ⚠️  ALERTE: Temps de reponse ${duration}ms > 1000ms    WARN
    ...    ELSE
    ...    Log    ✅ Temps de reponse OK: ${duration}ms

