*** Settings ***
Resource    ../resources/config.robot
Resource    ../api/stackoverflow_api.robot
Variables   ../resources/variables.py
Test Setup    Setup API Test
Test Teardown    Teardown API Test

*** Test Cases ***
Test API Returns Success
    [Tags]    api
    ${response}=    Get Latest Questions
    Should Be Equal As Numbers    ${response.status_code}    200

Test API Returns Questions
    [Tags]    api
    ${response}=    Get Latest Questions    pagesize=5
    ${count}=    Get Length    ${response.json()['items']}
    Should Be True    ${count} > 0


Pagination Parameterized Test
    [Template]    Check PageSize Returns ExpectedCount
    1
    5
    10
    50
*** Keywords ***
Check PageSize Returns ExpectedCount
    [Arguments]    ${pagesize}
    ${response}=    Get Latest Questions     pagesize=${pagesize}
    ${json}=    Get Latest Questions JSON    ${response}       pagesize=${pagesize}
    ${items}=   Set Variable    ${json["items"]}
    ${len}      Get Length    ${items}
    # The API may return fewer items than pagesize if not enough items; assert not more than pagesize
    Should Be True   ${len} <= ${pagesize}