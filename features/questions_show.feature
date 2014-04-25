Feature: Show the questions page
  In order to be useful
  The users
  Should be able to see the page that shows all questions

Scenario: The application has a new questions page
  Given I do have a web application
  When I visit the show questions page
  Then I should see the show questions page