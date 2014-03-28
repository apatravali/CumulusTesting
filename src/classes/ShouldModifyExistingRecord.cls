public class ShouldModifyExistingRecord extends cinnamon.BaseTest {

    public override void setup(cinnamon.CN_Context context) {
        npsp__Batch__c batch = TestUtil.createNewBatch();
        context.put('batchId', batch.Id);

        Opportunity opp = TestUtil.createNewOppWithBatch(batch.Id);
        context.put('oppId', opp.Id);
    }

    public override String getStartingPath(cinnamon.CN_Context context) {
        // Set BatchDataEntry page as BaseURL
        String batchId = (String) context.get('batchId');
        return TestUtil.BATCH_DATA_ENTRY_URL + '?id=' + batchId;
    }

    public override void test(cinnamon.CN_Context context) {
        selenium1.DefaultSelenium s = getSelenium();

        String oppId = (String) context.get('oppId');
        Opportunity opp = [select Id, Name, CloseDate, StageName from Opportunity where Id = :oppId];

        s.click(TestUtil.EDIT_LINK);
        String script = 'var name = selenium.browserbot.getCurrentWindow().document.querySelector(\"input.sticky-Name\");' +
                        'name.value != null && name.value != \'\';';
        s.waitForCondition(script, '30000');
        System.assertEquals(opp.Name, s.getValue(TestUtil.OPPORTUNITY_NAME_FIELD));

        String oppName = 'MODIFIED-' + opp.Name;
        s.type(TestUtil.OPPORTUNITY_NAME_FIELD, oppName);
        s.click(TestUtil.SAVE_BUTTON);

        script = 'var oppName = selenium.browserbot.getCurrentWindow().document.querySelector(\".dataRow.first .Name\");' +
                 'oppName.textContent == \"' + oppName + '\";';
        s.waitForCondition(script, '30000');

        opp = [select Id, Name from Opportunity where Id = :oppId];
        System.assert(opp != null);
        System.assertEquals(oppName, opp.Name);
    }

    public override void tearDown(cinnamon.CN_Context context) {
        List<ID> Ids = new List<ID>();
        Ids.add((String) context.get('batchId'));
        Ids.add((String) context.get('oppId'));
        Database.delete(Ids);
        Database.emptyRecycleBin(Ids);
    }
}