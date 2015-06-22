Feature: Add Person
  In order to maintain information
  A visitor
  Should enter information using the information form
  
  Scenario: Adds a person successfully
    Given I am on the index page
    When I submit the personal information
    Then I should see a success message

  Scenario: Adds a person successfully
    Given I am on the index page
    When I submit the personal information
    Then I should see my information on the page
    
  Scenario: Adds a person unsuccessfully
    Given I am on the index page
    When I submit invalid personal information
    Then I should see an error message