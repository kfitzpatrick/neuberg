Feature: Show membership level counts
  In order to track growth for the purpose adjusting operations
  As a bookkeeper
  I want to see a snapshot of today's members and their levels
  
  Scenario: Display total number of members on home screen
    Given the following members exist:
    | dormant |
    | true    |
    | true    |
    | true    |
    | false   |
    | false   |
    | false   |
    | false   |
    When I go to the members page
    And show me the page
    Then I should see "Total Members: 7"
    And I should see "Active: 4"
    And I should see "Inactive: 3"
