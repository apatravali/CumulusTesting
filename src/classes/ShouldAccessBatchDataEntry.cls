public class ShouldAccessBatchDataEntry extends cinnamon.BaseTest {
    public override String getStartingPath(cinnamon.CN_Context context) {
        return TestUtil.BATCH_DATA_ENTRY_URL;
    }

	public override void test(cinnamon.CN_Context context) { 
		selenium1.DefaultSelenium s = getSelenium();
		s.verifyTextPresent('Batch Data Entry Home');
    }
}