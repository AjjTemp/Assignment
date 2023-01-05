*** Settings ***
Documentation    The focus of this test case is to track an item by the tracking ID provided. It is checked whether the
...              the item is visible on the feed. In addition to that, the same item is deleted by using the delete item
...              test case. It is ensured that the deleted item is not available on the feed.
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


TrackUsingID
    switch window    title:Posti
    input text    id:username
    input password    id:password
    click element    id:posti_login_btn
    sleep    5
    click element    id:mainMenuLanguageSV
    sleep    5
    click element    id:actionToolbarTrack
    wait until element is visible    id:add-parcel-tracking-code
    input text    id:add-parcel-tracking-code    JJFI234567890
    click element    xpath://html/body/div[1]/div/div[3]/div[3]/div/div/div/div/section/div[2]/div[3]/div[1]/button
    wait until element is visible    //button[contains(@id,"JJFI234567890")]

DeleteItem
    click element    //button[contains(@id,"JJFI234567890")]
    wait until element is visible    id:options-button
    click element    id:options-button
    wait until element is visible    id:options-menu
    click element    css=#options-menu > li:nth-child(3)
    wait until element is visible    id:delete-button
    click button    id:delete-button
    wait until element is not visible    //button[contains(@id,"JJFI234567890")]

Logoff
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[1]/span/span
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[2]/div/div[3]/label
    close browser