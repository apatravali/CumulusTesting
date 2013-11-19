public class ShouldCreateNewBatchSetting extends cinnamon.BaseTest {

    public override String getStartingPath(cinnamon.CN_Context context) {
        // Set BatchDataEntrySettings page as BaseURL
        return TestUtil.BATCH_DATA_ENTRY_SETTINGS_PAGE;
    }

    public override void setup(cinnamon.CN_Context context) {
        List<bde__BulkDataEntry__c> res = [select Name, bde__Object_Entry_Field_Set__c, bde__Object_List_Field_Set__c from bde__BulkDataEntry__c where Name = 'account'];
        if (res.size() > 0) {
            Database.delete(res);
        }
    }

    public override void test(cinnamon.CN_Context context) {
        selenium1.DefaultSelenium s = getSelenium();

        s.click(TestUtil.CREATE_NEW_SETTING_BUTTON);
        String script = 'var select = selenium.browserbot.getCurrentWindow().document.querySelector(\"select\");' +
                        'select != null;';
        s.waitForCondition(script, '30000');
        s.selectOption('css=select', 'Account');
        script = 'var select = selenium.browserbot.getCurrentWindow().document.querySelector(\".detailList .dataCol.first select\");' +
                 'select != null;';

        s.addSelection(TestUtil.FIELDS_FOR_DATA_ENTRY, 'label=Account Name (name)');
        s.addSelection(TestUtil.FIELDS_FOR_SAVE_LIST, 'label=Account Name (name)');
        s.click(TestUtil.SETTINGS_SAVE_BUTTON);
        s.waitForPageToLoad('5000');

        bde__BulkDataEntry__c dataEntry = [select Name, bde__Object_Entry_Field_Set__c, bde__Object_List_Field_Set__c from bde__BulkDataEntry__c where Name = 'account'];
        System.assert(dataEntry != null);
        System.assertEquals('name', dataEntry.bde__Object_Entry_Field_Set__c);
        System.assertEquals('name', dataEntry.bde__Object_List_Field_Set__c);

        context.put('dataEntryId', dataEntry.Id);
    }

    public override void tearDown(cinnamon.CN_Context context) {
        if (context.get('dataEntryId') != null) {
            List<ID> Ids = new List<ID>();
            Ids.add((String) context.get('dataEntryId'));
            Database.delete(Ids);
        }
    }
}