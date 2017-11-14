*** Settings ***
Library  Selenium2Library

*** Variables ***
${SIGN_IN_EMAIL} =          xpath=/html/body/div[4]/section/cars-profiles-lsp/cui-tabs/div/ul[2]/li[1]/div/cars-login-form/div/div[3]/form/input[1]
${SIGN_IN_PASSWORD} =       xpath=/html/body/div[4]/section/cars-profiles-lsp/cui-tabs/div/ul[2]/li[1]/div/cars-login-form/div/div[3]/form/input[2]
${LOGIN_SUBMIT_BUTTON} =    xpath=/html/body/div[4]/section/cars-profiles-lsp/cui-tabs/div/ul[2]/li[1]/div/cars-login-form/div/div[3]/form/button


*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}

Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials.Email}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials.Email}
    run keyword unless  '${Credentials.Password}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials.Password}

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}

My Remarks
    *//cui-input[@options='email']/div/input
    *//cui-input[@options='loginPassword']/div/input
    *//button[@name='&lid=Log In']
