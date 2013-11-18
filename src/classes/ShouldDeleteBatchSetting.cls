public class ShouldDeleteBatchSetting extends cinnamon.BaseTest {

    public override void setup(cinnamon.CN_Context context) {

        List<bde__BulkDataEntry__c> dataEntryList = [select Id, Name from bde__BulkDataEntry__c];
        Database.delete(dataEntryList);

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

        s.click(TestUtil.SETTINGS_DELETE_LINK);
        String script = 'var dataRow = selenium.browserbot.getCurrentWindow().document.querySelector(\".dataRow\");' +
                        'dataRow == null;';
        s.waitForCondition(script, '30000');

        System.assertEquals(0, [select count() from bde__BulkDataEntry__c where Id = :dataEntryId]);
    }

    public override void tearDown(cinnamon.CN_Context context) {
        String dataEntryId = (String) context.get('dataEntryId');
        List<bde__BulkDataEntry__c> res = [select Id from bde__BulkDataEntry__c where Id = :dataEntryId];
        if (res.size() > 0) {
            Database.delete(res);
        }
    }
}