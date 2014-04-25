Feature: Show the new questions page
  In order to be useful
  The users
  Should be able to see the page to add new questions

Scenario: The application has a new questions page
  Given I do have a web application
  When I visit the new question page
  Then I should see the new question page