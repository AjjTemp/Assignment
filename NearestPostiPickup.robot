*** Settings ***
Documentation    This test case verfies if the nearest Posti pick up point can be chosen by the user based on
...              the zip code provided. This test case can also be executed in all three langauges.
Library  SeleniumLibrary


*** Variables ***


*** Test Cases ***
LoginTransfer
    open browser    https://www.posti.fi/sv  chrome
    maximize browser window
    wait until element is visible    id:onetrust-accept-btn-handler    timeout=10
    click element    id:onetrust-accept-btn-handler
    Execute JavaScript    window.scrollTo(0, 350)
    click element    //a[@class="send-and-track action-link"]


NearestPostiZipcode
    switch window    title:Posti
    sleep    1
    input text    id:username
    input password    id:password
    click element    id:posti_login_btn
    sleep    5
    click element    id:mainMenuLanguageFI
    sleep    5
    click element    id:mainMenuSettings
    wait until element is visible    id:lowerMenuSettingsMyPickUpPoint
    click element    id:lowerMenuSettingsMyPickUpPoint
    wait until element is visible    css=#pageMyPickupPoint > div > div > div > div > button
    click element    css=#pageMyPickupPoint > div > div > div > div > button
    wait until element is visible    xpath://html/body/div[1]/div/main/div[2]/section/div[1]/div/div[1]/div/input
    input text    xpath://html/body/div[1]/div/main/div[2]/section/div[1]/div/div[1]/div/input    33720
    wait until element is visible    xpath://*[@id="pageMyPickupPoint"]/div[1]/div/div[2]/div[1]/button
    click element    xpath://*[@id="pageMyPickupPoint"]/div[1]/div/div[2]/div[1]/button
    click element    css=h4

Logoff
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[1]/span/span
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[2]/div/div[3]/label
    close browser