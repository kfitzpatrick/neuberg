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
    
    Then I should see "Total Members: 21"
    And I should see "F 5"
    And I should see "L 7"
    And I should see "B 9"
    
    And I should see "Active: 6"
    And I should see "F 1"
    And I should see "L 2"
    And I should see "B 3"
    
    And I should see "Inactive: 15"
    And I should see "F 4"
    And I should see "L 5"
    And I should see "B 6"
  
  