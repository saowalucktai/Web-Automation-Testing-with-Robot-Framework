*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}           https://the-internet.herokuapp.com/login
${BROWSER}       chrome
${USERNAME}      tomsmith
${PASSWORD}      SuperSecretPassword!

*** Test Cases ***
User Can Login Successfully
    Open Browser To Login Page
    Input Username And Password
    Submit Credentials
    Login Should Be Successful
    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Input Username And Password
    Input Text      id:username    ${USERNAME}
    Input Text      id:password    ${PASSWORD}

Submit Credentials
    Click Button    css:button[type="submit"]

Login Should Be Successful
    # ใช้ Wait Until เพื่อป้องกันปัญหาเน็ตช้าหรือหน้าเว็บโหลดไม่ทัน
    Wait Until Page Contains Element    id:flash    5s
    Element Should Contain              id:flash    You logged into a secure area!