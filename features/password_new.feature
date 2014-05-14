Feature: Allow a user to get an email that will allow them to change their password
  In order to be useful
  The users
  Should be able to get a form that allows them to change their password

Scenario: The application has a new password page
  Given I do have a web application
  When I visit the new password page
  Then I should see the new password page