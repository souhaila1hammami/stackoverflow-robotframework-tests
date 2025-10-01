*** Settings ***
Library    Collections
Library    String
Library    RequestsLibrary
Library    Browser
Variables   variables.py


*** Keywords ***
Setup API Test
    Create Session    stackoverflow    ${API_BASE_URL}

Teardown API Test
    Delete All Sessions

Setup Web Test

    New Browser    chromium    headless=false
    New Context    viewport={'width': 1920, 'height': 1080}

Teardown Web Test
    Close Browser

Clean Text For Comparison
    [Arguments]    ${text}
    ${clean_text}=    Evaluate    ' '.join('''${text}'''.split())
    [Return]    ${clean_text}

    #Test Setup
 #   Log    🔍 Début du test: %{TEST_NAME}

#Test Teardown
 #   Run Keyword If Test Failed    Take Screenshot On Failure    %{TEST_NAME}
  #  Log    ✅ Fin du test: %{TEST_NAME}
