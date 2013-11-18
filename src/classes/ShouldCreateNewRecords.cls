public class ShouldCreateNewRecords extends cinnamon.BaseTest {

    public override void setup(cinnamon.CN_Context context) {
        bde__Batch__c batch = TestUtil.createNewBatch();
        context.put('batchId', batch.Id);
    }

    public override String getStartingPath(cinnamon.CN_Context context) {
        String batchId = (String) context.get('batchId');
        return TestUtil.BATCH_DATA_ENTRY_URL + '?id=' + batchId;
    }

    public override void test(cinnamon.CN_Context context) {
        selenium1.DefaultSelenium s = getSelenium();

        String oppName = 'Donation'+System.currentTimeMillis();

        s.type(TestUtil.OPPORTUNITY_NAME_FIELD, oppName);
        s.selectOption(TestUtil.OPPORTUNITY_STAGE_FIELD, 'label=Closed Won');
        s.type(TestUtil.OPPORTUNITY_CLOSE_DATE_FIELD, System.today().format());
        s.click(TestUtil.SAVE_BUTTON);
        s.waitForTextPresent('Saved Record List');

        Opportunity opp = [select Id, Name from Opportunity where Name = :oppName];
        System.assert(opp != null);
        System.assertEquals(oppName, opp.Name);
        context.put('oppId', opp.Id);
    }

    public override void tearDown(cinnamon.CN_Context context) {
    	List<ID> Ids = new List<ID>();
    	Ids.add((String) context.get('batchId'));
    	Ids.add((String) context.get('oppId'));
    	Database.delete(Ids);
    }
}
