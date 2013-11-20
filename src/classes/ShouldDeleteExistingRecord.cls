public class ShouldDeleteExistingRecord extends cinnamon.BaseTest {

    public override void setup(cinnamon.CN_Context context) {
        Batch__c batch = TestUtil.createNewBatch();
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

        String batchId = (String) context.get('batchId');
        String oppId = (String) context.get('oppId');
        Opportunity opp = [select Id, Name, CloseDate, StageName from Opportunity where Id = :oppId];

        s.click(TestUtil.DELETE_LINK);
        String script = 'var opp = selenium.browserbot.getCurrentWindow().document.querySelector(\".dataRow.first\");' +
                 'opp == null;';
        s.waitForCondition(script, '30000');

        s.verifyTextAbsent(opp.Name);
        s.verifyTextAbsent('Saved Record List');
        System.assertEquals(0, [select count() from Opportunity where Id = :oppId]);
    }

    public override void tearDown(cinnamon.CN_Context context) {
        List<ID> Ids = new List<ID>();
        Ids.add((String) context.get('batchId'));
        String oppId = (String) context.get('oppId');
        if ([select count() from Opportunity where Id = :oppId] != 0){
            Ids.add(oppId);
        }

        Database.delete(Ids);
    }
}