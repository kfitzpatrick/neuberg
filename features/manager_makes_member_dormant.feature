Feature: Manager makes member dormant
  In order to prevent me from having to remove and recreate members when they go on a long trip
  As an office manager
  I want put a member into a dormant state

  Scenario: make regular member dormant and display in two lists
    Given a member exists with a name of "ActiveMember"
    And a member exists with a name of "DormantMember"
    When I go to the members page
    And I follow "DormantMember"
    And I follow "Edit Member Info"
    And I check "Dormant?"
    And I press "Update Member"
    
    Then I should see "DormantMember is currently dormant"
    
    When I go to the members page
    Then I should see "Dormant Members"
    And I should see "ActiveMember" within ".active"
    And I should not see "DormantMember" within ".active"
    And I should see "DormantMember" within ".dormant"
    And I should not see "ActiveMember" within ".dormant"
    
    When I go to the members page
    And I follow "ActiveMember"
    Then I should not see "ActiveMember is currently dormant"
