Feature: Navbar
  As a visitor
  I need a nav bar
  So that I can visit different sections of the site.

  Scenario: Click the different links on the Navbar
    Given I am on the home page
    When I click on the "About" button in the navigation
    Then I should see the about page
    When I click on the "Home" button in the navigation
    Then I should see the home page
