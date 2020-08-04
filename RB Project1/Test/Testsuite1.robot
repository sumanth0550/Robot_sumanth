*** Settings ***
Library    SeleniumLibrary 

Suite Setup    Log   i am in test suite setup
Suite Teardown    Log    i am inside test suite tear down    
Test Setup    Log    i am inside test setup
Test Teardown    Log    i am inside test teardown  

Default Tags    sanity
      

*** Test Cases ***
MyFirsttest
    Log    Hello World    
    

Frist seleniumTest
    [Tags]    google search
    Open Browser    https:google.com    chrome
    Set Browser Implicit Wait    5
    Input Text      name=q              worldvision
    Press Keys    name=q    ENTER
    #Click Button    name=btnK     
    Sleep    5       
    Close Browser
    Log    Test completed    
    
SampleLoginTests
    [Tags]    Login
    [Documentation]    sample logintest
    Open Browser    ${url}    chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element    id=welcome
    Click Element    link=Logout           
    Sleep    3    
    Close Browser   
    Log    Test complete  
    Log    This test was done by %{username} on %{os}
    

*** Variables ***
${url}    https://opensource-demo.orangehrmlive.com  
@{CREDENTIALS}    Admin    admin123 
&{LOGIN DATE}    username=Admin    password=admin123      


*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGIN DATE}[password]
    Click Button    id=btnLogin  