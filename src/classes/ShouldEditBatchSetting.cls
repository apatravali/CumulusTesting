public class ShouldEditBatchSetting extends cinnamon.BaseTest {

    public override void setup(cinnamon.CN_Context context) {

        List<bde__BulkDataEntry__c> res = [select Id, Name from bde__BulkDataEntry__c];
        if (res.size() > 0) {
            Database.delete(res);
        }

        bde__BulkDataEntry__c dataEntry = new bde__BulkDataEntry__c();
        dataEntry.name = 'account';
        dataEntry.bde__Object_Entry_Field_Set__c = 'name';
        dataEntry.bde__Object_List_Field_Set__c = 'name';
        insert dataEntry;
        context.put('dataEntryId', dataEntry.Id);
    }

    public override String getStartingPath(cinnamon.CN_Context context) {
        // Set BatchDataEntrySettings page as BaseURL
        return TestUtil.BATCH_DATA_ENTRY_SETTINGS_PAGE;
    }

    public override void test(cinnamon.CN_Context context) {
        selenium1.DefaultSelenium s = getSelenium();
        String dataEntryId = (String) context.get('dataEntryId');

        s.click(TestUtil.SETTINGS_EDIT_LINK);
        String script = 'var select = selenium.browserbot.getCurrentWindow().document.querySelector(\".detailList .dataCol.first select\");' +
                        'select != null;';
        s.waitForCondition(script, '30000');
        s.addSelection(TestUtil.FIELDS_FOR_DATA_ENTRY, 'label=Account Number (accountnumber)');
        s.addSelection(TestUtil.FIELDS_FOR_SAVE_LIST, 'label=Account Number (accountnumber)');
        s.click(TestUtil.SETTINGS_SAVE_BUTTON);
        script = 'var select = selenium.browserbot.getCurrentWindow().document.querySelector(\".detailList .dataCol.first select\");' +
                 'select == null;';
        s.waitForCondition(script, '30000');

        bde__BulkDataEntry__c dataEntry = [select Name, bde__Object_Entry_Field_Set__c, bde__Object_List_Field_Set__c from bde__BulkDataEntry__c where Id = :dataEntryId];
        System.assert(dataEntry != null);
        System.assertEquals('name,accountnumber', dataEntry.bde__Object_Entry_Field_Set__c);
        System.assertEquals('name,accountnumber', dataEntry.bde__Object_List_Field_Set__c);
    }

    public override void tearDown(cinnamon.CN_Context context) {
        String dataEntryId = (String) context.get('dataEntryId');
        List<bde__BulkDataEntry__c> res = [select Id from bde__BulkDataEntry__c where Id = :dataEntryId];
        if (res.size() > 0) {
            Database.delete(res);
        }
    }
}