public class ShouldAccessBatchDataEntrySettings extends cinnamon.BaseTest {

    public override void test(cinnamon.CN_Context context) {
        selenium1.DefaultSelenium s = getSelenium();

        s.open(TestUtil.BATCH_DATA_ENTRY_SETTINGS_PAGE);
        s.verifyTextPresent('Configuration & Settings');

        s.click(TestUtil.ADVANCED_CONFIGURATION_TAB);
        s.verifyTextPresent('Automatically Name Opportunities');
        s.click(TestUtil.DELETE_BATCHES_TAB);
        s.verifyTextPresent('Existing Batches');
    }
}