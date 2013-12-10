Feature: Manage Household
    Scenario: Manage Household overrides Edit on Household
        Given a Household
        When I click Edit on the Contact's Household

        Then I get the Manage Household page for the Household

    Scenario: Manage Household overrides Edit on Household Account
        Given a Household Account
        When I click Edit on the Household Account

        Then I get the Manage Household Page for the Household Account

    Scenario: Manage Household lists all Household Contacts on Household
        Given a Household with two related Contacts
        When I click Edit on the Household

        Then I see a Contact card for each Contact related to the Household
        And the Contact card lists the Contact's name
        And the Contact card lists the Contact's mailing address
        And the Contact card includes checkboxes for inclusion in Household Name, Formal Greeting, and Informal Greeting

    Scenario: Manage Household lists all Household Contacts on Household Account
        Given a Household Account with two related Contacts
        When I click Edit on the Household Account

        Then I see a Contact card for each Contact related to the Household Account
        And the Contact card lists the Contact's name
        And the Contact card lists the Contact's mailing address
        And the Contact card includes checkboxes for inclusion in Household Name, Formal Greeting, and Informal Greeting

    Scenario: Add Contact to a Household
        Given a Household and a Contact unrelated to the Household
        When I click Edit on the Household
        And search for the unrelated Contact by name
        And click the Add button next to the contact in the drop down search results

        Then I see a new Contact card for the added Contact
        And the Contact card lists the Contact's name
        And the Contact card lists the Contact's mailing address
        And the Contact card includes checkboxes for inclusion in Household Name, Formal Greeting, and Informal Greeting
        And I see a message that Changes have not been saved

    Scenario: Add Contact to a Household Account
        Given a Household Account and a Contact unrelated to the Household Account
        When I click Edit on the Household Account
        And search for the unrelated Contact by name
        And click the Add button next to the contact in the drop down search results

        Then I see a new Contact card for the added Contact
        And the Contact card lists the Contact's name
        And the Contact card lists the Contact's mailing address
        And the Contact card includes checkboxes for inclusion in Household Name, Formal Greeting, and Informal Greeting
        And I see a message that Changes have not been saved

    Scenario: Re-order Contacts in a Household
        Given a Household with two related Contacts with different first and last names
        When I click Edit on the Household
        And drag the second Contact and drop it before the first Contact

        Then I see the Household Name update to place the previously second Contact's last name first
        And I see the Formal Greeting update to place the previously second Contact's full name first
        And I see the Informal Greeting update to place the previously second Contact's first name first
        And I see a message that Changes have not been saved

    Scenario: Re-order Contacts in a Household Account
        Given a Household Account with two related Contacts with different first and last names
        When I click Edit on the Household Account
        And drag the second Contact and drop it before the first Contact

        Then I see the Household Name update to place the previously second Contact's last name first
        And I see the Formal Greeting update to place the previously second Contact's full name first
        And I see the Informal Greeting update to place the previously second Contact's first name first
        And I see a message that Changes have not been saved

    Scenario: Push Household address from a Contact to Household Contacts on a Household
        Given a Household with two Contacts each with a different mailing address than the Household
        When I click Edit on the Household Account
        And I click the Change button in the Household Address section
        And I select the address of the first Contact
        And I click the Set Address button
        And I click the checkbox to Set the home address on household members

        Then I see the first Contact's address in the Household Address section
        And I see lines marking through the address fields on each Contact's card
        And I see a message that Changes have not been saved

    Scenario: Push Household Account address from a Contact to Household Contacts on a Household Account
        Given a Household Account with two Contacts each with a different mailing address than the Household Account
        When I click Edit on the Household Account
        And I click the Change button in the Household Address section
        And I select the address of the first Contact
        And I click the Set Address button
        And I click the checkbox to Set the home address on household members

        Then I see the first Contact's address in the Household Address section
        And I see lines marking through the address fields on each Contact's card
        And I see a message that Changes have not been saved

    Scenario: Push new Household address to Household Contacts on Household
        Given a Household and two Contacts each with a different mailing address than the Household
        When I click Edit on the Household
        And I click the Change button in the Household Address section
        And I click the Enter a new address button
        And I enter a new address in the form
        And I click the Set address button
        And I click the checkbox to Set the home address on household members

        Then I see the new address in the Household Address section
        And I see lines marking through the address fields on each Contact's card
        And I see a message that Changes have not been saved

    Scenario: Push new Household address to Household Contacts on Household Account
        Given a Household Account and two Contacts each with a different mailing address than the Household Account
        When I click Edit on the Household Account
        And I click the Change button in the Household Address section
        And I click the Enter a new address button
        And I enter a new address in the form
        And I click the Set address button
        And I click the checkbox to Set the home address on household members

        Then I see the new address in the Household Address section
        And I see lines marking through the address fields on each Contact's card
        And I see a message that Changes have not been saved

    Scenario: Remove a Contact from a Household
        Given a Household with two Contacts each with different first and last names
        When I click Edit on the Household
        And I hover over the second Contact's card
        And I click the minus icon button at the top right of the card

        Then I see the second Contact's card disappear
        And I see the Household Name update to remove the second Contact's last name
        And I see the Formal Greeting update to remove the second Contact's full name
        And I see the Informal Greeting update to remove the second Contact's first name
        And I see a message that Changes have not been saved

    Scenario: Remove a Contact from a Household Account
        Given a Household Account with two Contacts each with different first and last names
        When I click Edit on the Household Account
        And I hover over the second Contact's card
        And I click the minus icon button at the top right of the card

        Then I see the second Contact's card disappear
        And I see the Household Name update to remove the second Contact's last name
        And I see the Formal Greeting update to remove the second Contact's full name
        And I see the Informal Greeting update to remove the second Contact's first name
        And I see a message that Changes have not been saved

    Scenario: Edit fields on a Household from Mangage Household
        Given a Household
        When I click Edit on the Household
        And I enter a new phone number in the Household Phone field in the Household Details section
        And I click the Save button

        Then I land back on the view Household page
        And I see the new phone number I entered in the Household Phone field

    Scenario: Edit fields on a Household Account from Manage Household
        Given a Household Account
        When I click Edit on the Household Account
        And I enter a new phone number in the Household Phone field in the Household Details section
        And I click the Save button

        Then I land back on the view Household Account page
        And I see the new phone number I entered in the Household Phone field

    Scenario: Exclude Contact from Household Naming on Household
        Given a Household with two Contacts with different first and last names
        When I click Edit on the Household
        And I click the Household Name exclude checkbox on the second Contact's card
        And I click the Formal Greeting exclude checkbox on the second Contact's card
        And I click the Informal Greeting exclude checkbox on the second Contact's card

        Then I see the second Contact's last name removed from the Household Name field
        And I see the second Contact's full name removed from the Formal Greeting field
        And I see the second Contact's last name removed from the Informal Greeting field
        And I see a message that Changes have not been saved

    Scenario: Exclude Contact from Household Naming on Household Account
        Given a Household Account with two Contacts with different first and last names
        When I click Edit on the Household Account
        And I click the Household Name exclude checkbox on the second Contact's card
        And I click the Formal Greeting exclude checkbox on the second Contact's card
        And I click the Informal Greeting exclude checkbox on the second Contact's card

        Then I see the second Contact's last name removed from the Household Name field
        And I see the second Contact's full name removed from the Formal Greeting field
        And I see the second Contact's last name removed from the Informal Greeting field
        And I see a message that Changes have not been saved

    Scenario: Validation errors show on Household fields with errors
        Given a Household
        When I click Edit on the Household
        And I enter 'abc' in the Household Phone field in the Household Details section
        And I click the Save button

        Then I stay on the Manage Household page
        And I am shown an error on the Household Phone field that the phone number is invalid

    Scenario: Validation errors show on Household Account fields with errors
        Given a Household Account
        When I click Edit on the Household Account
        And I enter 'abc' in the Household Phone field in the Household Details section
        And I click the Save button

        Then I stay on the Manage Household page
        And I am shown an error on the Household Phone field that the phone number is invalid
