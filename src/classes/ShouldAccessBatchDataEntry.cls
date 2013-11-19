public class ShouldAccessBatchDataEntry extends cinnamon.BaseTest {
	public override void test(cinnamon.CN_Context context) { 
		selenium1.DefaultSelenium s = getSelenium();
		s.open(TestUtil.BATCH_DATA_ENTRY_URL);
		s.verifyTextPresent('Batch Data Entry Home');
    }
}