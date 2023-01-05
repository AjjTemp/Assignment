*** Settings ***
Documentation    The focus of this test case is to check the user's ability to move items between inbox and archive
...              folders and vice versa. This test case can be executed in all three languages - Finnish, English, and
...              Swedish. It is done by changing the menu language. Extra comment is added in the test case for
...              identification. Sleep commands are used to see the working of the test case, and for the contents to
...              load without any hassels. Once the content is moved, it is checked whether it is present in the location,
...              from where it is moved.
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


InboxToArchiveFI
    switch window    title:Posti
    input text    id:username
    input password    id:password
    click element    id:posti_login_btn
    sleep    5
    #FI,SV,EN options to change language menu
    click element    id:mainMenuLanguageSV
    sleep    5
    click element    xpath://html/body/div[1]/div/main/div[2]/div/section[1]/div[2]/div/div/div/article[2]/button
    wait until element is visible    id:messageOptionsMenuButton
    click element    id:messageOptionsMenuButton
    sleep    8
    click element    xpath://*[@id="contentColumn"]/div[1]/div[1]/div/div[2]/div/ul/li[1]
    sleep    5
    wait until element is not visible  xpath://html/body/div[1]/div/main/div[2]/div/section[1]/div[2]/div/div/div/article[2]/button

ArchiveToInbox
    click element    id:mainMenuArchive
    sleep    2
    click element    xpath://html/body/div[1]/div/main/div[2]/div/section[1]/div[2]/div/div/div/article[2]/button
    wait until element is visible    id:messageOptionsMenuButton
    click element    id:messageOptionsMenuButton
    sleep    10
    click element    xpath://html/body/div[1]/div/main/div[2]/div/section[2]/div[1]/div[1]/div/div[2]/div/ul/li[1]
    wait until element is not visible    xpath://html/body/div[1]/div/main/div[2]/div/section[1]/div[2]/div/div/div/article[2]/button

Logoff
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[1]/span/span
    click element    xpath://html/body/div[1]/div/header/div[3]/div/div/div[2]/div/div[3]/label
    close browser