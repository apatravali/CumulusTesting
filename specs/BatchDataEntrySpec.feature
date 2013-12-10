Feature: Batch Data Entry
	Scenario: [DONE] Accessing Batch Data Entry
		Given I have installed Batch Data Entry package from AppExchange
		When I click Batch Data Entry Tab
		Then The page should be rendered correctly
		And A default batch setting for Opportunities is automatically created

	Feature: Creating a New Batch
		Given I have navigated to Batch Data Entry page
		When I select "Opportunity" as the object to work with and click "New Batch"
		Then I should be navigated to Batch Data Entry page
		And I should see Batch Name field automatically populated with "Opportunities" + current date

	Scenario: Modify Batch Data Entry properties
		Given I have navigated to the existing Batch Data Entry
		When I modify "Batch Name" field
		Then The page refleshes and the modified field was saved successfully

	Feature: Entering & Saving Data
		Scenario: [DONE] Filling in all the required fields in "Record Information" and creating new records
			Given I have navigated to a Batch Data Entry page
			When I fill in all required fields and click "Save"
			Then A new record should be created and appear in "Saved Related List" section
			When I click "View" link on the newly saved record
			Then I should be navigated to the detail page of the saved record

		Scenario: [DONE] Use Pushpin to make the fields sticky
			Given I have navigated to a Batch Data Entry page
			When I fill in all required fields
			And I press the Pushpin on all the required fields and click "Save"
			Then A new record should be created and appear in "Saved Related List" section
			And The value entered in the required fields appear as the default value
			And "Batch Size" should be incremented correctly

		Scenario: [DONE] Modify already saved records
			Given I have navigated to a Batch Data Entry page
			When I click "Edit" link in one of the already saved records in "Saved Related List" section
			Then The saved record should load in the "Record Information" section
			When I modify some fields and click "Save"
			Then The modified record should be saved and appear in "Saved Related List" section

		Scenario: [DONE] Deleting the already saved record
			Given I already have saved some records in the Batch Data Entry page
			When I click "del" link on the saved record
			Then The record should be deleted successfully and disapper in the "Saved Record List" section
			And "Batch Size" should be decremented correctly

		Scenario: [NOT DONE] Saving a new record with validation rules
			Given I have navigated to a Batch Data Entry page
			And have created a validation rule on "Opportunity"
			When I fill in all required fields such that its associated validation rule will fail, and click "Save"
			Then Saving a new record should fail and error message should appear
