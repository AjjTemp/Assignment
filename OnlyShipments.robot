*** Settings ***
Documentation    This test case navigates from posti homepage to OmaPosti, by selecting appropriate cookie options.
...              The accept button handler can be changed if needed. This test case checks if only parcels are loaded
...              when the user chooses the shipments filter. This test case checks for all the three languages i.e Finnish,
...              English, and Swedish.
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
LoadOnlyShipmentsFI
    switch window    title:Posti
    input text    id:username
    input password    id:password
    click element    id:posti_login_btn
    sleep    5
    click element    id:mainMenuLanguageFI
    sleep    5
    click element    id:feed_filter_activating_button
    wait until element is visible    //ul[@role="listbox"]
    click element    //li[@value="parcel"]
    wait until element is visible    //button[@aria-expanded="false" and @aria-label="Näytä vain Lähetykset"]
LoadOnlyShipmentsEN
    click element    id:mainMenuLanguageEN
    wait until element is visible    //button[@aria-expanded="false" and @aria-label="Show only Shipments"]

LoadOnlyShipmentsSV
    click element    id:mainMenuLanguageSV
    wait until element is visible    //button[@aria-expanded="false" and @aria-label="Visa endast Försändelser"]

Logoff
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[1]/span/span
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[2]/div/div[3]/label
    close browser