public class TestPackagesInstalled extends cinnamon.BaseTest {
	
	public override void test(cinnamon.CN_Context context) {
		selenium1.DefaultSelenium s = getSelenium();	
	    s.open('/0A3?setupid=ImportedPackage');
	    s.waitForElementPresent('css=.pbBody table');
	    s.verifyElementPresent('css=th a:contains(\'Affiliations\')');
	    s.verifyElementPresent('css=th a:contains(\'Contacts & Organizations\')');
	    //s.verifyElementPresent('css=th a:contains(\'Households\')');
	    s.verifyElementPresent('css=th a:contains(\'Recurring Donations\')');
	    s.verifyElementPresent('css=th a:contains(\'Relationships\')');
	}
    
}