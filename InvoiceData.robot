*** Settings ***
Documentation    This test case checks the ability to create a new invoice by filling the required fields.
...              Some issues occurred, after entering all the required data, the button click is recorded and
...              the test cases were passed. However, it was not getting reflected on webpage. Xpath and full Xpath is
...              used to click the button.
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


FillInvoiceData
    switch window    title:Posti
    sleep    1
    input text    id:username
    input password    id:password
    click element    id:posti_login_btn
    sleep    5
    click element    id:mainMenuLanguageSV
    sleep    5
    click element    id:actionToolbarAdd
    wait until element is visible    css=form
    input text    id:add_invoice_account_number    FI4950009420028730
    input text    id:add_invoice_recipient    TestReciever
    input text    id:add_invoice_reference_number    1234561
    input text    id:add_invoice_remittance_info    helloworld
    input text    id:add_invoice_due_date    31.1.2023
    input text    id:add_invoice_amount    30,00
    #click element    xpath://*[@id="addInvoice_modal"]/div/div/div[3]/form/div[6]/div/button
    click element    xpath://html/body/div[1]/div/div[3]/div[3]/div/div/div/div/div[3]/form/div[6]/div/button


Logoff
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[1]/span/span
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[2]/div/div[3]/label
    close browser
