public class TestUtil {

    public static final String BASE_URL = 'https://c.na5.visual.force.com/';
    public static final String BATCH_DATA_ENTRY_PAGE = 'apex/BDE_BatchEntry';
    public static final String BATCH_DATA_ENTRY_URL = BASE_URL + 'apex/BDE_BatchEntry';
    public static final String NEW_BATCH_BUTTON = 'name=j_id0:j_id8:j_id9:j_id13';
    public static final String BATCH_NAME_FIELD = 'id=j_id0:j_id23:j_id24:j_id26:j_id27:0:j_id28';
    public static final String OPPORTUNITY_NAME_FIELD = 'css=.sticky-Name';
    public static final String OPPORTUNITY_NAME_PUSHPIN = 'css=label[for=sticky-Name]';
    public static final String CONTACT_LOOKUP_FIELD = 'css=.sticky-npspcontactid';
    public static final String OPPORTUNITY_CLOSE_DATE_FIELD = 'css=.sticky-CloseDate';
    //public static final String OPPORTUNITY_STAGE_FIELD = 'css=.sticky-StageName';
    public static final String OPPORTUNITY_STAGE_FIELD = 'j_id0:j_id24:j_id25:recInfo:j_id60:2:j_id61:j_id64';
    public static final String SAVE_BUTTON = 'css=.btnSave';
    public static final String EDIT_LINK = 'css=.editLink';
    public static final String DELETE_LINK = 'css=a.delLink';
    public static final String DELETE_LINK_FIRST_ROW = 'css=.dataRow.first a.delLink';

    // Batch Data Entry Settings
    public static final String BATCH_DATA_ENTRY_SETTINGS_PAGE = BASE_URL + 'apex/BatchEntrySettings';
    public static final String ADVANCED_CONFIGURATION_TAB = 'id=BatchEntrySettings:j_id0:j_id69_lbl';
    public static final String DELETE_BATCHES_TAB = 'id=BatchEntrySettings:j_id0:j_id85_lbl';
    public static final String CREATE_NEW_SETTING_BUTTON = 'name=BatchEntrySettings:j_id0:j_id33:j_id51';
    public static final String OBJECT_SELECT = 'name=BatchEntrySettings:j_id0:j_id52:pbs1:j_id54:j_id56';
    public static final String FIELDS_FOR_DATA_ENTRY = 'css=.detailList .dataCol.first select';
    public static final String FIELDS_FOR_SAVE_LIST = 'css=.detailList .dataCol.last select';
    public static final String SETTINGS_SAVE_BUTTON = 'css=input[value=\"Save\"]';
    public static final String SETTINGS_EDIT_LINK= 'css=.editLink';
    public static final String SETTINGS_DELETE_LINK = 'css=.delLink';

    public static Batch__c createNewBatch() {
        Batch__c batch = new Batch__c();
        batch.name = 'Opportunties' + System.currentTimeMillis();
        batch.Batch_Status__c = 'In Progress';
        batch.Object_Name__c = 'opportunity';
        insert batch;
        return batch;
    }

    public static Opportunity createNewOppWithBatch(String batchId) {
        Opportunity opp = new Opportunity();
        opp.Name = 'Donation' + System.currentTimeMillis();
        opp.CloseDate = System.today();
        opp.StageName = 'Closed Won';
        opp.Batch__c = batchId;
        insert opp;
        return opp;
    }
}