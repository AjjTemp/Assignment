*** Settings ***
Documentation    This test case verfies the ability to edit items by selecting them. All three options are
...              executed namely, cancel, delete, and archive. This test case can also be executed in all three
...              languages.
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


EditItemsCancel
    switch window    title:Posti
    sleep    1
    input text    id:username
    input password    id:password
    click element    id:posti_login_btn
    sleep    5
    click element    id:mainMenuLanguageEN
    sleep    5
    # Adding the tracking item since it was deleted for previous test case
    click element    id:actionToolbarTrack
    wait until element is visible    id:add-parcel-tracking-code
    input text    id:add-parcel-tracking-code    JJFI234567890
    click element    xpath://html/body/div[1]/div/div[3]/div[3]/div/div/div/div/section/div[2]/div[3]/div[1]/button
    wait until element is visible    //button[contains(@id,"JJFI234567890")]
    click element    id:feedHeaderEditButton
    click element    //label[contains(@id,"JJFI234567890")]
    click button    id:feedEditActionsPanelCancelButton
    wait until element is visible    //button[contains(@id,"JJFI234567890")]

EditItemsArchive
    click element    id:feedHeaderEditButton
    click element    //label[contains(@id,"JJFI234567890")]
    click button    id:feedEditActionsPanelArchiveButton
    wait until element is not visible    //button[contains(@id,"JJFI234567890")]
    click element    id:mainMenuArchive
    sleep    2
    wait until element is visible    //button[contains(@id,"JJFI234567890")]

EditItemsDelete
    click element    id:feedHeaderEditButton
    click element    //label[contains(@id,"JJFI234567890")]
    click button    id:feedEditActionsPanelDeletebutton
    click element  css=div > div > div > div > div > div > div > button:nth-child(2)
    wait until element is not visible    //button[contains(@id,"JJFI234567890")]
    click element    id:mainMenuInbox
    wait until element is not visible    //button[contains(@id,"JJFI234567890")]

Logoff
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[1]/span/span
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[2]/div/div[3]/label
    close browser