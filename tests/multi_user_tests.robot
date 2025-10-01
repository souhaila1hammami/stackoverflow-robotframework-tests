*** Settings ***
Resource    ../resources/config.robot
Resource    ../api/stackoverflow_api.robot
Library     Collections
Library     DateTime
Library     OperatingSystem


*** Test Cases ***
Test Multiple Users Simulation
    [Tags]    multi-user    performance    api
    @{response_times}=    Create List
    
    FOR    ${user}    IN RANGE    1    4
        ${start}=    Get Time    epoch
        Setup API Test
        ${response}=    Get Latest Questions    pagesize=3
        ${end}=    Get Time    epoch
        ${duration}=    Evaluate    (${end} - ${start}) * 1000
        Append To List    ${response_times}    ${duration}
        Log   Utilisateur ${user}: ${duration}ms
    END
    
    ${avg}=    Evaluate    sum(${response_times}) / len(${response_times})
    Log    📊 Temps moyen: ${avg}ms
    
    # Simple fichier de résultats pour Allure
    ${results}=    Set Variable    Performance Test - Average: ${avg}ms - Individual: ${response_times}
    Create File    ${EXECDIR}/allure-results/test_results.txt    ${results}
    
    Teardown API Test