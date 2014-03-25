public class HH_ManageHHAccountPageObject extends cinnamon.PageObject {
    public cinnamon.WebElement searchInput;
    public cinnamon.WebElement searchAddButton;
    public cinnamon.WebElement hhMembers;
    public cinnamon.WebElement fieldName;
    public cinnamon.WebElement fieldAutoName;
    public cinnamon.WebElement fieldFormalGreeting;
    public cinnamon.WebElement fieldAutoFormalGreeting;
    public cinnamon.WebElement fieldInformalGreeting;
    public cinnamon.WebElement fieldAutoInformalGreeting;
    public cinnamon.WebElement myTest;

    public override void initializePageObject() {
        searchInput = getElement(new cinnamon.ElementLocator('#hhSearch-input'));
        searchAddButton = getElement(new cinnamon.ElementLocator('.gwButton.hhAddNew'));
        hhMembers = getElement(new cinnamon.ElementLocator('.hhMembers'));
        hhMembers = getElement(new cinnamon.ElementLocator('.hhMembers'));
        fieldName = getElement(new cinnamon.ElementLocator('#hhName'));
        fieldAutoName = getElement(new cinnamon.ElementLocator('#hhAutoName'));
        fieldFormalGreeting = getElement(new cinnamon.ElementLocator('#hhFormalGreeting'));
        fieldAutoFormalGreeting = getElement(new cinnamon.ElementLocator('#hhAutoFormalGreeting'));
        fieldInformalGreeting = getElement(new cinnamon.ElementLocator('#hhInormalGreeting'));
        fieldAutoInformalGreeting = getElement(new cinnamon.ElementLocator('#hhAutoInormalGreeting'));
        myTest = getElement(new cinnamon.ElementLocator('#myTestThatWillNeverMatch'));
    }

    public String getTitle() {
        return selenium.getTitle();
    }

}