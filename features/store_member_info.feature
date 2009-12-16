Feature: Store & edit member's information
  In order to track membership & know how to bill
  As an office manager
  I want to store new member information
  
  Background:
    Given a membership level called "Basic"
    And a membership level called "Lite"
    And a membership level called "Fulltime"

  Scenario: Create a new member
    Given I am on the members page
    When I follow "Add a Member"
    Then I should be on the new member page
    
    When I fill in "Name" with "Kevin Fitzpatrick"
    And I fill in "Email" with "kevin@indyhall.org"
    And I fill in "Billing Notes" with "Kevin prefers his invoices to come by carrier pigeon."
    And I fill in "Primary Industry" with "Rails Guru"
    And I press "Create"

    Then I should be on the members page
    And I should see "Kevin Fitzpatrick"

    When I follow "Kevin Fitzpatrick"
    Then I should see "Basic Member"
    And I should see "Kevin Fitzpatrick's Profile"
    And I should see "Name: Kevin Fitzpatrick"
    And I should see "Email: kevin@indyhall.org"
    And I should see "Billing Notes:"
    And I should see "Kevin prefers his invoices to come by carrier pigeon."
    And I should see "Primary Industry: Rails Guru"

  Scenario: display member info
    Given a member named "Alex Hillman" with email "alex@indyhall.org"
    When I go to the members page
    And I follow "Alex Hillman"

    Then I should see "Alex Hillman's Profile"
    And I should see "Name: Alex Hillman"
    And I should see "Email: alex@indyhall.org"

  Scenario: Create lite members
    Given I am on the new member page
    When I fill in "Name" with "Foo"
    And I fill in "Email" with "foo@bar.com"
    And I select "Lite" from "Membership level"
    And I press "Create"
    When I follow "Foo"
    Then I should see "Lite Member"

  Scenario: Edit Membership Levels
    Given a Fulltime member named "Alex"
    When I go to the members page
    And I follow "Alex"
    And I follow "Edit Member"
    And I select "Lite" from "Membership level"
    And I press "Update Member"
    Then I should see "Lite Member"
  
  Scenario: Display the list
    Given a Fulltime member named "Alex"
    And a Lite member named "Kevin"
    And I am on the members page
    Then I should see a table row with the cells "Fulltime, Alex"
    And I should see a table row with the cells "Lite, Kevin"  

  Scenario: edit member info
    Given a member named "Chris Dawnson" with email "dawnson@indyhall.org" and billing notes "Carrier pigeon"
    When I go to the members page
    And I follow "Chris Dawnson"
    And I follow "Edit Member Info"
    And I fill in "Name" with "Chris Dawson"
    And I fill in "Email" with "dawson@indyhall.org"
    And I fill in "Billing Notes" with "Pony Express"
    And I fill in "Primary Industry" with "Java Hacker"
    And I press "Update Member"
        
    Then I should see "Chris Dawson"
    And I should not see "Dawnson"
    And I should see "dawson@indyhall.org"
    And I should not see "dawnson@indyhall.org"
    And I should see "Pony Express"
    And I should not see "Carrier pigeon"
    And I should see "Primary Industry: Java Hacker"
