Feature: Show membership level counts
  In order to track growth for the purpose adjusting operations
  As a bookkeeper
  I want to see a snapshot of today's members and their levels
  
  Scenario: Display total number of members on home screen
    Given 1 Fulltime active members exist
    And 2 Lite active members exist
    And 3 Basic active members exist
    
    And 4 Fulltime inactive members exist
    And 5 Lite inactive members exist
    And 6 Basic inactive members exist
    
    When I go to the members page
    
    Then I should see "Total Current Members: 21"
    And I should see "Full Time: 5"
    And I should see "Lite: 7"
    And I should see "Basic: 9"
    
    And I should see "Total Active Members: 6"
    And I should see "Full Time: 1"
    And I should see "Lite: 2"
    And I should see "Basic: 3"
    
    And I should see "Total Inactive Members: 15"
    And I should see "Full Time: 4"
    And I should see "Lite: 5"
    And I should see "Basic: 6"
  
  