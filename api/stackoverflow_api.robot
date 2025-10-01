*** Settings ***
Library    RequestsLibrary
Library    Collections
Variables   ../resources/variables.py

*** Keywords ***
Get Latest Questions Json
    [Arguments]    ${response}      ${pagesize}
    ${response}       Get Latest Questions      ${pagesize}     creation
    ${json}=    To Json    ${response.text}
    [Return]    ${json}

Get Latest Questions
    [Arguments]    ${pagesize}=10    ${sort}=creation
    &{params}=    Create Dictionary    order=desc    sort=${sort}    site=stackoverflow    pagesize=${pagesize}
    ${response}=    GET    ${API_BASE_URL}${QUESTIONS_ENDPOINT}    params=${params}
    [Return]    ${response}
       

Get First Question Title From API
    ${response}=    Get Latest Questions    pagesize=1
    ${title}=    Set Variable    ${response.json()['items'][0]['title']}
    [Return]    ${title}